import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:todo/controller/todos_cubit.dart';
import '../../../core/controller/controller_var.dart';
import '../../../core/dialog/insert_dialog.dart';
import '../../../core/dialog/success_dialog.dart';
import '../../../core/shared/colors.dart';
import '../../../core/shared/text_styles.dart';
import '../../../core/widget/no_data.dart';
import '../../widget/task_widget.dart';

class Tasks extends StatelessWidget {
  const Tasks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarTask(),
      body: Container(
        padding: EdgeInsetsDirectional.all(15),
        child: BlocConsumer<TodosCubit, TodosState>(
          listener: (context, state) {},
          builder: (context, state) {
            return TodosCubit.get(context).listTasks.length > 0
                ? ListView.separated(
                    itemBuilder: (context, index) => CardItemTask(
                          index: index,
                        ),
                    separatorBuilder: (context, index) => SizedBox(
                          height: 15,
                        ),
                    itemCount: TodosCubit.get(context).listTasks.length)
                : WidgetNoData(name: 'لا يوجد اي مهام للقيام بها',);
          },
        ),
      ),
      floatingActionButton: BlocConsumer<TodosCubit, TodosState>(
        listener: (context, state) {},
        builder: (context, state) {
          return FloatingActionButton(
            onPressed: () async {
              insertDialog(
                  context: context,
                  ButtonSave: Expanded(
                    child: AnimatedButton(
                      color: ProjectColors.greenColor,
                      isFixedHeight: false,
                      text: 'حفظ',
                      pressEvent: () async {
                        if (formKey.currentState!.validate()) {
                          TodosCubit.get(context)
                              .insertToDataBase(ControllerVar.titleTasks.text,
                                  ControllerVar.descTasks.text)
                              .then((value) {
                            Get.back();
                            successDialog(
                                    context: context,
                                    title: 'تم الاضافة بنجاح',
                                    desc: 'لقد تم اضافة مهمة جديدة بنجاح ')
                                .show();
                            ControllerVar.descTasks.clear();
                            ControllerVar.titleTasks.clear();
                          });
                        }
                        // dialog.dismiss();
                      },
                    ),
                  )).show();
              // await TodosCubit.get(context).getDataToTasks();
            },
            child: Icon(
              Icons.add,
              color: ProjectColors.blackColor.withOpacity(0.6),
              size: 30,
            ),
          );
        },
      ),
    );
  }
}
