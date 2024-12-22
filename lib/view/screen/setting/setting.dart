import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/shared/colors.dart';
import '../../../core/shared/text_styles.dart';
import '../../widget/setting_widget.dart';

class Setting extends StatelessWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarSetting(),
      body: Center(
        child: Padding(
          padding:
              EdgeInsetsDirectional.symmetric(vertical: 15, horizontal: 10),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ViewImageInSetting(),
              SizedBox(
                height: 10,
              ),
              Text(
                'علي نبيل علي ',
                style: TextStyles.font24mainColorW700,
              ),
              Text(
                'alialabsi@gmail.com',
                style: TextStyles.font16grayColorW300,
              ),
              SizedBox(height: 15,),
              ListItemInSettingPage()
            ],
          ),
        ),
      ),
    );
  }
}


