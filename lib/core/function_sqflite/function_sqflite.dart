import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';
import '../../model/tasks_model.dart';
import '../shared/date.dart';


class SqfliteDB {
 static late Database database ;
 static createDataBase() async {
    database  = await openDatabase(
        'todo1.db',
        version: 2,
        onCreate: (Database db , int version)async {
          print('Create DataBase');
          try{
            await db.execute('CREATE TABLE tasks ( id INTEGER PRIMARY KEY , title TEXT  , details TEXT , dateWrite TEXT , dateEnd TEXT , status TEXT  )');
            print('Crate Table');


          }catch(e){
            print(e.toString());
          }
        },
        onOpen: (Database db ){
          print('Open DataBase');
        }
    );
  }

 static Future insertToDataBase (title , desc, dateEnd) async{

   await database.transaction((txn)async {
      try{
        final task = TasksModel(
          title: title,
          dateWrite: DateFormat('yyyy-MM-dd HH:mm').format(now),
          dateEnd: dateEnd,
          details: desc,
        );
        int id = await txn.insert('tasks', task.toMap());
        print('Insert Tasks Number $id ');
        // int id = await txn.rawInsert('INSERT INTO tasks(title ,details ,  date , time ,status )  VALUES( "$title", "$desc" ,"${formattedDate}" , "${formattedTime}" , "Tasks")');
        // print('Insert Tasks Number $id ');
      }catch(e){
        print(e.toString());
      }

    });
  }

 static Future<List<Map<String, dynamic>>?> getToDataBaseWithStatus(String status) async {
   List<Map<String, dynamic>> taskList = await database.query(
      'Tasks',
     where: 'status = ?',
     whereArgs: [status],
   );
   return taskList;

 }

 static Future deleteFromDataBase (id ) async {
    try{
      final int result = await database.delete(
          'Tasks',
          where: 'id = ?',
          whereArgs: [id]
      );
      return result;
    }catch(e){
      print(e.toString());
    }

  }

 static updateFromDataBase ( title  ,details , dateEnd , id ) async{
   final int result = await database.update(
       'Tasks',
       {'title':title , 'details':details , 'dateEnd':dateEnd },
       where: 'id =?',
       whereArgs: [id]
   );
   return result;
  }
 static Future updateFromDataBaseWithStatus ( id , status  ) async{
   final int result = await database.update(
       'Tasks',
       {'status':status },
       where: 'id =?',
       whereArgs: [id]
   );
   return result;
 }

}
