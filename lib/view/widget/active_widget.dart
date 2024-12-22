
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../controller/todos_cubit.dart';
import '../../core/shared/colors.dart';
import '../../core/shared/text_styles.dart';
import '../../core/widget/button_check_action.dart';
import '../../core/widget/button_delete_edit.dart';

class CardItemActive extends StatelessWidget {
  final int index;
  const CardItemActive({
    super.key, required this.index,
  });

  @override
  Widget build(BuildContext context) {

    var obCubit =TodosCubit.get(context);
    return BlocConsumer<TodosCubit, TodosState>(
      listener: (context, state) {
      },
      builder: (contextt, state) {
        return InkWell(
          onLongPress: (){
            // TodosCubit.get(context).deleteFromDataBase(TodosCubit.get(context).listTasks[index]['id']);
            Get.bottomSheet(
              showBottomSheetEditAndDelete(
                todosCubit: TodosCubit.get(context),
                indTask: TodosCubit.get(context).listActive[index].id!,
                titleTask: TodosCubit.get(context).listActive[index].title,
                detailsTask: TodosCubit.get(context).listActive[index].details,
                dateEndTask: TodosCubit.get(context).listActive[index].dateEnd,
              ),
            );
          },
          child: Card(
            elevation: 5,
            shape: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide:
              BorderSide(width: 0, color: ProjectColors.whiteColor),
            ),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  Text(
                    '${obCubit.listActive[index].title}',
                    style: TextStyles.font22mainColorW600,
                    maxLines: 1,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    '${obCubit.listActive[index].details} ',
                    style: TextStyles.font16grayColorW300,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(' الكتابة',
                                  style: TextStyles.font14mainColorW400,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1),
                            ),
                            Text(
                                ' ${TodosCubit.get(context).listActive[index].dateWrite}',
                                style: TextStyles.font16grayColorW300,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1
                            ),

                          ],
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(' الانتهاء',
                                maxLines: 1,
                                style: TextStyles.font14mainColorW400,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Text(
                              ' ${TodosCubit.get(context).listActive[index].dateEnd}',
                              style: TextStyles.font16grayColorW300,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ButtonCheckAction(
                        color: ProjectColors.tealColor,
                        icon: Icons.menu,
                        onTap: (){
                          obCubit.updateToTasks(obCubit.listActive[index].id ,context);
                        },
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      ButtonCheckAction(
                        color: ProjectColors.greenColor,
                        icon: Icons.check,
                        onTap: (){
                          obCubit.updateToComplete(obCubit.listActive[index].id, context);
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



AppBar appBarActive() {
  return AppBar(
    backgroundColor: ProjectColors.blueColor.withOpacity(0.7),
    title: Text('مهام قيد العمل '),
  );
}
