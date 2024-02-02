import 'package:flutter/material.dart';

import '../shared/colors.dart';
import '../shared/text_styles.dart';

class AppTextFormFiled extends StatelessWidget {
  const AppTextFormFiled(
      {super.key,
      this.contentPadding,
      required this.hintText,
      this.hintStyle,
      this.enabledBorder,
      this.focusedBorder,
      this.fillColor,
      this.suffixIcon,
      this.controller,
        this.validator,
        this.maxLines,
        this.minLines,
      });
  final EdgeInsetsGeometry? contentPadding;
  final String hintText;
  final TextStyle? hintStyle;
  final InputBorder? enabledBorder;
  final InputBorder? focusedBorder;
  final Color? fillColor;
  final Widget? suffixIcon;
  final bool obscureText = false;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final int? maxLines ;
  final int? minLines ;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      maxLines: maxLines??1,
      minLines: minLines?? 1 ,
      decoration: InputDecoration(

          contentPadding: contentPadding ??
              const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          hintText: hintText,
          hintStyle: hintStyle ?? TextStyles.font14grayColorW400,
          enabledBorder: enabledBorder ??
              OutlineInputBorder(
                  borderSide:  BorderSide(
                    color: ProjectColors.grayColors,
                  ),
                  borderRadius: BorderRadius.circular(16)),
          focusedBorder: focusedBorder ??
              OutlineInputBorder(
                  borderSide:  BorderSide(
                    color: ProjectColors.mainColor,
                  ),
                  borderRadius: BorderRadius.circular(16)),
          fillColor: fillColor ?? ProjectColors.mainColor.withOpacity(0.2),
          filled: true,
          suffixIcon: suffixIcon),
      obscureText: obscureText,
    );
  }
}
