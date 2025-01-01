import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import '../shared/colors.dart';
import '../shared/text_styles.dart';

class AppTextFormFiled extends StatelessWidget {
  const AppTextFormFiled({
    super.key,
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
    this.stopSpace = false,
    required this.prefixIcon,
    this.errorBorder,
     this.keyboardType,
  });

  final EdgeInsetsGeometry? contentPadding;
  final String hintText;
  final TextStyle? hintStyle;
  final InputBorder? enabledBorder;
  final InputBorder? errorBorder;
  final InputBorder? focusedBorder;
  final Color? fillColor;
  final Widget? suffixIcon;
  final Widget prefixIcon;
  final bool obscureText = false;
  final bool stopSpace;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final int? maxLines;
  final int? minLines;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      inputFormatters: [
        stopSpace
            ? FilteringTextInputFormatter.deny(RegExp(r'\s'))
            : FilteringTextInputFormatter.allow(RegExp(r'.*')) // السماح بكل شيء
        ,
        // Disallow spaces
      ],
      validator: validator,
      controller: controller,
      maxLines: maxLines ?? 1,
      minLines: minLines ?? 1,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        contentPadding: contentPadding ??
            const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        hintText: hintText,
        hintStyle: hintStyle ?? TextStyles.font14grayColorW400,
        enabledBorder: enabledBorder ??
            OutlineInputBorder(
                borderSide: BorderSide(
                  color: ProjectColors.grayColors,
                ),
                borderRadius: BorderRadius.circular(16)),
        errorBorder: errorBorder ??
            OutlineInputBorder(
                borderSide: BorderSide(
                  color: ProjectColors.redColor,
                ),
                borderRadius: BorderRadius.circular(16)),
        focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: ProjectColors.redColor,
              width: 2
            ),
            borderRadius: BorderRadius.circular(16)),
        focusedBorder: focusedBorder ??
            OutlineInputBorder(
                borderSide: BorderSide(
                  color: ProjectColors.mainColor,
                ),
                borderRadius: BorderRadius.circular(16)),
        fillColor: fillColor ?? ProjectColors.mainColor.withOpacity(0.2),
        filled: true,
        isDense: true,
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
      ),
      obscureText: obscureText,
    );
  }
}

class FormFieldToInsertDate extends StatelessWidget {
  final String hintText;
  final void Function(DateTime)? onDateSelected;
  final DateTime? initialValue;

  const FormFieldToInsertDate({
    super.key,
    required this.hintText,
    this.onDateSelected,
    this.initialValue,
  });

  @override
  Widget build(BuildContext context) {
    return DateTimeFormField(
      validator: (value) {
        if (value == null) {
          return 'من فضلك ادخل التاريخ';
        }
        return null;
      },
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.date_range,
          color: ProjectColors.blueColor,
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        hintText: hintText,
        hintStyle: TextStyles.font14grayColorW400,
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: ProjectColors.grayColors,
            ),
            borderRadius: BorderRadius.circular(16)),
        errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: ProjectColors.redColor,
            ),
            borderRadius: BorderRadius.circular(16)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: ProjectColors.mainColor,
            ),
            borderRadius: BorderRadius.circular(16)),
        fillColor: ProjectColors.mainColor.withOpacity(0.2),
        filled: true,
        // suffixIcon: Icon(Icons.date_range)
      ),
      firstDate: DateTime.now().add(const Duration(days: 0)),
      lastDate: DateTime.now().add(const Duration(days: 90)),
      initialValue: initialValue,
      onDateSelected: onDateSelected,
      dateFormat: DateFormat('yyyy-MM-dd'),
    );
  }
}
