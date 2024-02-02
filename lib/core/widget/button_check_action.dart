
import 'package:flutter/material.dart';

import '../shared/colors.dart';

class ButtonCheckAction extends StatelessWidget {
  const ButtonCheckAction({
    super.key,
    this.color,
    this.icon, this.onTap,
  });
  final Function()? onTap;
  final Color? color;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
              color: color ?? ProjectColors.mainColor,
              borderRadius: BorderRadius.circular(10)),
          child: Icon(
            icon ?? Icons.check,
            color: ProjectColors.whiteColor,
          )),
    );
  }
}