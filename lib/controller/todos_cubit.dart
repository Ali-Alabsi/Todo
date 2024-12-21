import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../core/function_sqflite/function_sqflite.dart';
import '../model/tasks_model.dart';
import '../view/screen/active/active.dart';
import '../view/screen/complete/complete.dart';
import '../view/screen/setting/setting.dart';
import '../view/screen/tasks/tasks.dart';

part 'todos_state.dart';

class TodosCubit extends Cubit<TodosState> {
  static TodosCubit get(context) => BlocProvider.of(context);

  TodosCubit() : super(TodosInitial());

  // Start Bottom Nav Bar
  int currentIndex = 0;
  List screen = [
    Tasks(),
    Active(),
    Complete(),
    Setting(),
  ];

  void changeCurrentIndex(int index) {
    currentIndex = index;
    emit(ChangeBottomNavBar());
  }

  // End Bottom Nav Bar
  //Create Data Base
  int c = 6;
  List<Map> listTodos = [];
  List<TasksModel> listActive = [];
  List<TasksModel> listComplete = [];
  List<TasksModel> listTasks = [];

  createDataBase() async {
    try {
      await SqfliteDB.createDataBase();
      // listTodos = await SqfliteDB.getToDataBase();
      // print(listTodos);
      emit(CreateDataBase());
    } catch (e) {
      print(e);
    }
  }

  //Get DataBase
  getDataToTasks() async {
    try {
      listTasks = [];
      final List<Map<String, dynamic>>? taskListMap = await SqfliteDB.getToDataBaseWithStatus('Tasks');
      taskListMap?.forEach((taskMap) async {
        listTasks.add(TasksModel.fromMap(taskMap));
      });
      emit(GetTasksDataBase());
    } catch (e) {
      print(e);
    }
  }

  void getDataToActive() async {
    try{
     listActive = [];
      // listActive = await SqfliteDB.getToDataBaseWithStatus('Active');
      final List<Map<String, dynamic>>? taskListMap = await SqfliteDB.getToDataBaseWithStatus('Active');
      taskListMap?.forEach((taskMap) async {
        listActive.add(TasksModel.fromMap(taskMap));
      });
      emit(GetActiveDataBase());
    }catch(e){
      print(e);
    }

  }

  void getDataToComplete() async {
    try{
      listComplete = [];
      final List<Map<String, dynamic>>? taskListMap = await SqfliteDB.getToDataBaseWithStatus('Complete');
      taskListMap?.forEach((taskMap) async {
        listComplete.add(TasksModel.fromMap(taskMap));
      });
      emit(GetCompleteDataBase());
    }catch(e){
      print(e);
    }

  }

  // Insert To Data Base
  Future insertToDataBase(title , desc) async {
   await SqfliteDB.insertToDataBase('$title', '$desc').then((value) {
      emit(InsertToDataBase());
      getDataToTasks();
    });

  }
  // Update To Active
void updateToActive(id){
    SqfliteDB.updateFromDataBaseWithStatus(id, "Active").then((value) {
      emit(UpdateActiveInDataBase());
      getDataToTasks();
      getDataToComplete();
      getDataToActive();
    });

}

  void updateToComplete(id){
    SqfliteDB.updateFromDataBaseWithStatus(id, "Complete").then((value) {
      emit(UpdateCompleteInDataBase());
      getDataToTasks();
      getDataToComplete();
      getDataToActive();
    });

  }
  void updateToTasks(id){
    SqfliteDB.updateFromDataBaseWithStatus(id, "Tasks").then((value) {
      emit(UpdateCompleteInDataBase());
      getDataToTasks();
      getDataToComplete();
      getDataToActive();
    });

  }
  // Update From Id
  Future updateFromDataBase(id,title, details ) async{

    await  SqfliteDB.updateFromDataBase('$title','$details',id).then((value) {
      emit(UpdateFromDataBase());
      getDataToTasks();
      getDataToComplete();
      getDataToActive();
    }
    );
  }
  // Delete From Id
  Future deleteFromDataBase(id) async{
    await  SqfliteDB.deleteFromDataBase(id).then((value) {
      emit(DeleteFromDataBase());
      getDataToTasks();
      getDataToComplete();
      getDataToActive();
    }
    );
  }

}
