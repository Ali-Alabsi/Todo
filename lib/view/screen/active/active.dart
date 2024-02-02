import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/controller/todos_cubit.dart';
import 'package:todo/core/shared/colors.dart';
import 'package:todo/core/widget/no_data.dart';
import '../../widget/active_widget.dart';

class Active extends StatelessWidget {
  const Active({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBarActive(),
        body: Container(
          padding: EdgeInsetsDirectional.all(15),
          child: BlocConsumer<TodosCubit, TodosState>(
            listener: (context, state) {},
            builder: (context, state) {
              return TodosCubit.get(context).listActive.length > 0?
                ListView.separated(
                  itemBuilder: (context, index) => CardItemActive(
                        index: index,
                      ),
                  separatorBuilder: (context, index) => SizedBox(
                        height: 15,
                      ),
                  itemCount: TodosCubit.get(context).listActive.length):
                  WidgetNoData(name: 'لا يوجد مهام نشطة تحت العمل للقيام بها ');
            },
          ),
        ));
  }
}
