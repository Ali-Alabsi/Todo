
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/controller/todos_cubit.dart';
import 'package:todo/core/dialog/success_dialog.dart';

import '../controller/controller_var.dart';
import '../dialog/insert_dialog.dart';
import '../shared/colors.dart';

class showBottomSheetEditAndDelete extends StatelessWidget {
  const showBottomSheetEditAndDelete({
    super.key,
     required this.todosCubit,
    required this.indTask,
    this.titleTask,
    this.detailsTask, this.dateEndTask,
  });


  final TodosCubit todosCubit;
  final int indTask;
  final String? titleTask;
  final String? dateEndTask;
  final String? detailsTask;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              spreadRadius: 2,
              blurRadius: 3,
              offset: Offset.zero,
            )
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 10,
          ),
          InkWell(
            onTap: () {
              todosCubit.deleteFromDataBase(indTask).then((value) {
                 successDialog(context: context, title: 'تم الحذف', desc: "قمت بحذف المهمة بنجاح").show().then((value) {
                   Get.back();
                 });
              });
              // todosCubit
            },
            child: Container(
              decoration: BoxDecoration(
                color: ProjectColors.mainColor,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.4),
                      spreadRadius: 2,
                      blurRadius: 3,
                      offset: Offset.zero),
                ],
              ),
              margin: EdgeInsetsDirectional.symmetric(vertical: 28),
              padding: EdgeInsetsDirectional.only(bottom: 8),
              width: 150,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.delete,
                    color: Colors.white,
                    size: 80,
                  ),
                  Text(
                    'حذف',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              // formUpdateDialog(context  ,value, index);
              // todosCubit.updateFromDataBase( indTask);
              ControllerVar.titleTasks.text =titleTask!;
              ControllerVar.descTasks.text =detailsTask!;
              ControllerVar.dateEndTasks.text =dateEndTask!;
              insertDialog(
                name: 'تعديل البيانات',
                  context: context,
                  ButtonSave: Expanded(
                    child: AnimatedButton(
                      color: ProjectColors.greenColor,
                      isFixedHeight: false,
                      text: 'حفظ',
                      pressEvent: () async {
                        if (formKey.currentState!.validate()) {
                          todosCubit.updateFromDataBase(indTask, ControllerVar.titleTasks.text ,ControllerVar.descTasks.text , ControllerVar.dateEndTasks.text)
                              .then((value) {
                            Get.back();
                            successDialog(
                                context: context,
                                title: 'تم التعديل بنجاح',
                                desc: 'لقد تم تعديل المهمة  بنجاح ')
                                .show().then((value) {
                              Get.back();
                            });
                            ControllerVar.descTasks.clear();
                            ControllerVar.titleTasks.clear();
                          });
                        }
                        // dialog.dismiss();
                      },
                    ),
                  )).show();
            },
            child: Container(
              decoration: BoxDecoration(
                color: ProjectColors.mainColor,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.4),
                      spreadRadius: 2,
                      blurRadius: 3,
                      offset: Offset.zero),
                ],
              ),
              margin: EdgeInsetsDirectional.symmetric(
                vertical: 28,
              ),
              padding: EdgeInsetsDirectional.only(bottom: 8),
              width: 150,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.edit,
                    color: Colors.white,
                    size: 70,
                  ),
                  Text(
                    'تعديل',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
    );
  }
}