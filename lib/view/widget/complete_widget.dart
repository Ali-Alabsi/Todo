
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../controller/todos_cubit.dart';
import '../../core/shared/colors.dart';
import '../../core/shared/text_styles.dart';
import '../../core/widget/button_check_action.dart';
import '../../core/widget/button_delete_edit.dart';

class CardItemCompete extends StatelessWidget {
  final int index;

  const CardItemCompete({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TodosCubit, TodosState>(

      listener: (context, state) {
      },
      builder: (context, state) {
        var obCubit = TodosCubit.get(context);
        return InkWell(
          onLongPress: (){
            Get.bottomSheet(
              showBottomSheetEditAndDelete(
                todosCubit: TodosCubit.get(context),
                indTask: TodosCubit.get(context).listComplete[index].id!,
                titleTask: TodosCubit.get(context).listComplete[index].title,
                detailsTask: TodosCubit.get(context).listComplete[index].details,
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
                  Text(
                    '${obCubit.listComplete[index].title}',
                    style: TextStyles.font22mainColorW600,
                    maxLines: 1,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    '${obCubit.listComplete[index].details}',
                    style: TextStyles.font16grayColorW300,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text('[${obCubit.listComplete[index].dateWrite}] ${obCubit.listComplete[index].dateEnd}  ',
                      style: TextStyles.font16grayColorW300),
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
                          obCubit.updateToActive(obCubit.listComplete[index].id);
                        },
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      ButtonCheckAction(
                        color: ProjectColors.mainColor,
                        icon: Icons.downloading,
                        onTap: (){
                          obCubit.updateToActive(obCubit.listComplete[index].id);
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


AppBar appBarComplete() {
  return AppBar(
    backgroundColor: ProjectColors.greenColor,
    title: Text('المهام المكتملة'),
  );
}
