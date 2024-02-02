

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/shared/text_styles.dart';

class Setting  extends StatelessWidget {
  const Setting ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset('assets/svg/update.svg'),
            Text('سوف يتم اضافة الاعدادات في التحديث القادم',style: TextStyles.font16grayColorW300,)
          ],
        ),
      ),
    );
  }
}
