import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

AwesomeDialog successDialog({required BuildContext context ,required String title , required String desc}) {
  return AwesomeDialog(
    context: context,
    animType: AnimType.leftSlide,
    headerAnimationLoop: false,
    dialogType: DialogType.success,
    showCloseIcon: true,
    title: title,
    desc: desc,
    btnOkOnPress: () {
      // debugPrint('OnClcik');
    },
    btnOkIcon: Icons.check_circle,
    onDismissCallback: (type) {
      // debugPrint('Dialog Dissmiss from callback $type');
    },
  );
}
