import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/core/widget/no_data.dart';
import '../../../controller/todos_cubit.dart';
import '../../widget/complete_widget.dart';

class Complete extends StatelessWidget {
  const Complete({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBarComplete(),
        body: BlocConsumer<TodosCubit, TodosState>(
          listener: (context, state) {},
          builder: (context, state) {
            return Container(
              padding: EdgeInsetsDirectional.all(15),
              child: TodosCubit.get(context).listComplete.length > 0?
              ListView.separated(
                  itemBuilder: (context, index) => CardItemCompete(
                        index: index,
                      ),
                  separatorBuilder: (context, index) => SizedBox(
                        height: 15,
                      ),
                  itemCount: TodosCubit.get(context).listComplete.length):
                  WidgetNoData(name:'لا يوجد اي مهام مكتملة ' )
            );
          },
        ));
  }
}
