import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:todo/controller/todos_cubit.dart';
import 'package:todo/core/controller/controller_var.dart';
import 'package:todo/core/dialog/insert_dialog.dart';
import 'package:todo/model/function_sqflite/function_sqflite.dart';
import '../../../core/dialog/success_dialog.dart';
import '../../../core/shared/colors.dart';
import '../active/active.dart';
import '../complete/complete.dart';

class Layout extends StatelessWidget {
  Layout({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TodosCubit()..createDataBase(),
      child: Scaffold(
        bottomNavigationBar: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  blurRadius: 20,
                  color: Colors.black.withOpacity(.1),
                )
              ],
            ),
            child: SafeArea(
                child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
              child: BlocConsumer<TodosCubit, TodosState>(
                listener: (context, state) {
                  if (state is CreateDataBase) {
                    TodosCubit.get(context).getDataToTasks();
                  }
                },
                builder: (context, state) {
                  return GNav(
                      onTabChange: (i) {
                        //setState(() {

                        if (i == 1) {
                          TodosCubit.get(context).getDataToActive();
                        }
                        if (i == 2) {
                          TodosCubit.get(context).getDataToComplete();
                        }
                        if (i == 0) {
                          TodosCubit.get(context).getDataToTasks();
                        }
                        TodosCubit.get(context).changeCurrentIndex(i);
                        print(i);
                        // });
                      },
                      rippleColor: Colors.grey,
                      hoverColor: Colors.grey,
                      haptic: true,
                      tabBorderRadius: 15,
                      // tabActiveBorder: Border.all(color: Colors.black, width: 1),
                      // tabBorder: Border.all(color: Colors.grey, width: 1),
                      curve: Curves.easeInOut,
                      duration: Duration(milliseconds: 900),
                      gap: 8,
                      color: Colors.black87,
                      activeColor: ProjectColors.mainColor,
                      iconSize: 24,
                      tabBackgroundColor:
                          ProjectColors.mainColor.withOpacity(0.1),
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      tabs: [
                        GButton(
                          icon: Icons.menu,
                          text: 'المهام',
                        ),
                        GButton(
                          icon: Icons.downloading,
                          text: 'النشطة',
                        ),
                        GButton(
                          icon: Icons.task_alt,
                          text: 'المكتملة',
                        ),
                        GButton(
                          icon: Icons.settings,
                          text: 'الاعدادت',
                        ),
                      ]);
                },
              ),
            ))),
        body: BlocConsumer<TodosCubit, TodosState>(
          listener: (context, state) {},
          builder: (context, state) {
            return TodosCubit.get(context)
                .screen[TodosCubit.get(context).currentIndex];
          },
        )

        // GetBuilder<LayoutController>(
        //   init: LayoutController(),
        //   builder: (controller){
        //     return  controller.screen[controller.currentIndex];
        //   },
        // )
        ,

      ),
    );
  }
}
