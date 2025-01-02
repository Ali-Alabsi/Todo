import 'dart:io';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../core/shared/colors.dart';
import '../../../core/shared/text_styles.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ProjectColors.mainColor,
        title: Text('مركز المساعدة'),
      ),
      body: Container(
        color: ProjectColors.moreGrayColors,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 15),
          child: ListView(
            children: [
              _buildContactOption(
                context,
                icon: Icon(Icons.email),
                text: "خدمه العملاء",
                onTap: () {
                  final Uri emailLaunchUri = Uri(
                    scheme: 'mailto',
                    path: 'alabsiali247@gmail.com',
                    query: _encodeQueryParameters(<String, String>{
                      'subject': 'There is a problem with the application',
                    }),
                  );
                  launchUrl(emailLaunchUri);
                },
              ),
              SizedBox(height: 25),
              _buildContactOption(
                context,
                icon: Image.asset('assets/images/whatsapp.png', height: 25, width: 25, fit: BoxFit.fill),
                text: "واتس اب",
                onTap: () async {
                  openWhatsapp( context: context);
                },
              ),
              SizedBox(height: 20),
              _buildContactOption(
                context,
                icon: Image.asset('assets/images/internet.png', height: 25, width: 25, fit: BoxFit.fill),
                text: "موقع الكتروني",
              ),
              SizedBox(height: 20),
              _buildContactOption(
                context,
                icon: Icon(Icons.facebook, color: Colors.blue),
                text: "فيس بوك",
                onTap: _openFacebook,
              ),
              SizedBox(height: 20),
              _buildContactOption(
                context,
                icon: Icon(EvaIcons.twitter, color: Colors.blue),
                text: "تويتر",
              ),
              SizedBox(height: 20),
              _buildContactOption(
                context,
                icon: Image.asset('assets/images/instagram.png', height: 25, width: 25, fit: BoxFit.fill),
                text: "انستقرام",
                onTap: _launchInstagram,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContactOption(BuildContext context, {required Widget icon, required String text, void Function()? onTap}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      height: 60,
      decoration: BoxDecoration(
        color: ProjectColors.whiteColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: InkWell(
        onTap: onTap,
        child: Row(
          children: [
            icon,
            SizedBox(width: 20),
            Text(text, style: TextStyles.font16BlackBold),
          ],
        ),
      ),
    );
  }

  String? _encodeQueryParameters(Map<String, String> params) {
    return params.entries
        .map((MapEntry<String, String> e) => '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
        .join('&');
  }
}








void openWhatsapp({required BuildContext context}) async {
  const String number = '+967771750533';
  var whatsappURL = "https://wa.me/$number";

  if (await canLaunchUrl(Uri.parse(whatsappURL))) {
    await launchUrl(Uri.parse(whatsappURL));
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("WhatsApp not installed")),
    );
  }
}

Future<void> _openFacebook() async {
  String fbProtocolUrl = Platform.isIOS ? 'fb://profile/{100040819552583}' : 'fb://page/{100040819552583}';
  String fallbackUrl = 'https://www.facebook.com/profile.php?id=100040819552583';

  try {
    Uri fbBundleUri = Uri.parse(fbProtocolUrl);
    if (await canLaunchUrl(fbBundleUri)) {
      launchUrl(fbBundleUri);
    } else {
      await launchUrl(Uri.parse(fallbackUrl), mode: LaunchMode.externalApplication);
    }
  } catch (e) {
    // Handle this as you prefer
  }
}

void _launchInstagram() async {
  const nativeUrl = "instagram://user?username=a_l_i247";
  const webUrl = "https://www.instagram.com/eng.ali300/";
  if (await canLaunch(nativeUrl)) {
    await launch(nativeUrl);
  } else if (await canLaunch(webUrl)) {
    await launch(webUrl);
  } else {
    print("can't open Instagram");
  }
}