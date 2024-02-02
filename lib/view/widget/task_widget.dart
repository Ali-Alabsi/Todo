
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../controller/todos_cubit.dart';
import '../../core/shared/colors.dart';
import '../../core/shared/date.dart';
import '../../core/shared/text_styles.dart';
import '../../core/widget/button_check_action.dart';
import '../../core/widget/button_delete_edit.dart';

class CardItemTask extends StatelessWidget {
  final int index;

  const CardItemTask({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TodosCubit, TodosState>(
      listener: (context, state) {},
      builder: (context, state) {
        return InkWell(
          onLongPress: () {
            // TodosCubit.get(context).deleteFromDataBase(TodosCubit.get(context).listTasks[index]['id']);
            Get.bottomSheet(
              showBottomSheetEditAndDelete(
                todosCubit: TodosCubit.get(context),
                indTask: TodosCubit.get(context).listTasks[index]['id'],
                detailsTask: TodosCubit.get(context).listTasks[index]['details'],
                titleTask: TodosCubit.get(context).listTasks[index]['title'],
              ),
            );
          },
          child: Card(
            elevation: 5,
            shape: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(width: 0, color: ProjectColors.whiteColor),
            ),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  // -------

                  // -----------------
                  Text(
                    "${TodosCubit.get(context).listTasks[index]['title']}",
                    style: TextStyles.font22mainColorW600,
                    maxLines: 1,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    '${TodosCubit.get(context).listTasks[index]['details']}',
                    style: TextStyles.font16grayColorW300,
                    textAlign: TextAlign.center,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                      "[${TodosCubit.get(context).listTasks[index]['time']}] ${TodosCubit.get(context).listTasks[index]['date']}  ",
                      style: TextStyles.font16grayColorW300),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ButtonCheckAction(
                          onTap: () {
                            TodosCubit.get(context).updateToActive(
                                TodosCubit.get(context).listTasks[index]['id']);
                          },
                          color: ProjectColors.greenColor,
                          icon: Icons.downloading),
                      SizedBox(
                        width: 30,
                      ),
                      ButtonCheckAction(
                        onTap: () {
                          TodosCubit.get(context).updateToComplete(
                              TodosCubit.get(context).listTasks[index]['id']);
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

AppBar appBarTask() {
  return AppBar(
    backgroundColor: ProjectColors.tealColor,
    title: Text('المهام'),

  );
}