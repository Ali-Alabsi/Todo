import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/core/controller/controller_var.dart';
import 'package:todo/core/shared/colors.dart';
import '../shared/text_styles.dart';
import '../widget/app_text_form_filed.dart';

GlobalKey<FormState> formKey = GlobalKey();
AwesomeDialog insertDialog({
  required BuildContext context,
  String? name,
  Widget? ButtonSave,
}) {
  return AwesomeDialog(
    context: context,
    animType: AnimType.scale,
    dialogType: DialogType.info,
    keyboardAware: true,
    body: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(
        key: formKey,
        child: Column(
          children: <Widget>[
            Text(
               name ??'ادخال المهام',
              style: TextStyles.font22mainColorW600,
            ),
            const SizedBox(
              height: 10,
            ),
            Material(
              child: AppTextFormFiled(
                validator: (value){
                  if(value ==''){
                    return 'من فضلك ادخل العنوان ';
                  }
                  return null;
                },
                controller: ControllerVar.titleTasks,
                hintText: 'العنوان',
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Material(
              child: AppTextFormFiled(
                maxLines: 3,
                minLines: 2,
                controller: ControllerVar.descTasks,
                hintText: 'التفاصيل',
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  child: AnimatedButton(
                    color: ProjectColors.greyColor,
                    isFixedHeight: false,
                    text: 'الغاء',
                    pressEvent: () {
                      // dialog.dismiss();
                      Get.back();
                      ControllerVar.descTasks.clear();
                      ControllerVar.titleTasks.clear();
                    },
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                ButtonSave ??
                    Expanded(
                      child: AnimatedButton(
                        color: ProjectColors.greenColor,
                        isFixedHeight: false,
                        text: 'حفظ',
                        pressEvent: () async {
                          // dialog.dismiss();
                        },
                      ),
                    ),
              ],
            )
          ],
        ),
      ),
    ),
  );
}
