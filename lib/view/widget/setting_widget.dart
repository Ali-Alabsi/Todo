import 'package:flutter/material.dart';

import '../../core/shared/colors.dart';
import '../../core/shared/text_styles.dart';

class ListItemInSettingPage extends StatelessWidget {
  const ListItemInSettingPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          SizedBox(height: 15,),
          ItemInSettingPage(
              title: 'تعديل البروفايل',
              icon: Icons.account_circle,
              onTap: () {}),
          ItemInSettingPage(
              title: 'الاشعارات',
              icon: Icons.notifications,
              onTap: () {}),
          ItemInSettingPage(
              title: 'تواصل معنا', icon: Icons.call, onTap: () {}),
          ItemInSettingPage(
              title: 'سياسة الخصوصية',
              icon: Icons.privacy_tip,
              onTap: () {}),
          ButtonSignOut()
        ],
      ),
    );
  }
}

class ButtonSignOut extends StatelessWidget {
  const ButtonSignOut({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(

      padding: const EdgeInsets.all(15.0),
      child: ElevatedButton(
        onPressed: () {},
        child: Text('تسجيل الخروج ',
            style: TextStyles.font16whiteColorW300),
        style: ElevatedButton.styleFrom(
          backgroundColor: ProjectColors.mainColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          minimumSize: Size(double.infinity, 50),
        ),
      ),
    );
  }
}

class ItemInSettingPage extends StatelessWidget {
  final String title;
  final IconData icon;
  final void Function()? onTap;

  const ItemInSettingPage({
    super.key,
    required this.title,
    required this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Icon(icon, size: 40, color: ProjectColors.mainColor),
          title: Text(title, style: TextStyles.font16grayColorW300),
          trailing: Icon(
            Icons.arrow_forward_ios,
            color: ProjectColors.mainColor,
          ),
          onTap: onTap,
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }
}

class ViewImageInSetting extends StatelessWidget {
  const ViewImageInSetting({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          radius: 75,
          child: Container(
              height: 130,
              width: 130,
              decoration: BoxDecoration(
                color: ProjectColors.mainColor.withOpacity(0.5),
                borderRadius: BorderRadius.circular(100),
              ),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: // image png
              Image.asset(
                'assets/svg/LogoTodoSplashScreen.png',
                height: 120,
                width: 120,
              )

            // Icon(
            //   Icons.account_circle_sharp,
            //   size: 130,
            // ),
          ),
        ),
        Positioned(
            bottom: 10,
            child: Card(
              child: Icon(
                Icons.edit,
                size: 30,
                color: ProjectColors.mainColor,
              ),
            ))
      ],
    );
  }
}

AppBar appBarSetting() {
  return AppBar(
    backgroundColor: ProjectColors.mainColor,
    title: Text('الاعدادت'),
  );
}