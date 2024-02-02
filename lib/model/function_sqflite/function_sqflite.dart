import 'package:sqflite/sqflite.dart';
import 'package:todo/core/shared/date.dart';


class SqfliteDB {
 static late Database database ;
 static createDataBase() async {
    database  = await openDatabase(
        'todo.db',
        version: 2,
        onCreate: (Database db , int version)async {
          print('Create DataBase');
          try{
            await db.execute('CREATE TABLE tasks ( id INTEGER PRIMARY KEY , title TEXT  , details TEXT , date TEXT , time TEXT , status TEXT  )');
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

 static Future insertToDataBase (title , desc) async{
   await database.transaction((txn)async {
      try{
        int id = await txn.rawInsert('INSERT INTO tasks(title ,details ,  date , time ,status )  VALUES( "$title", "$desc" ,"${formattedDate}" , "${formattedTime}" , "Tasks")');
        print('Insert Tasks Number $id ');
      }catch(e){
        print(e.toString());
      }

    });
  }
 static Future<List<Map>> getToDataBase() async{
    // listTodos = await  db.rawQuery("SELECT * FROM Tasks");
    // print(listTodos);
    return await database.rawQuery("SELECT * FROM Tasks");
  }

 static Future<List<Map>> getToDataBaseWithStatus( status ) async{
   // listTodos = await  db.rawQuery("SELECT * FROM Tasks");
   // print(listTodos);
   return  database.rawQuery("SELECT * FROM Tasks WHERE status = ?",["$status"]);
 }

 static Future deleteFromDataBase (id ) async {
    try{
      int count = await database.rawDelete('DELETE FROM Tasks WHERE id = ? ', [id]);
      // assert(count == 1);
      print(count);
    }catch(e){
      print(e.toString());
    }

  }

 static updateFromDataBase ( title  ,details , id ) async{
    int count = await database.rawUpdate(
        'UPDATE Tasks SET title = ?, details = ? WHERE id = ?',
        ['$title', '$details', id]);

    print('-----------------------------------------------------------------------------------------------------------updated: $count title $title , details $details , id $id');
  }
 static Future updateFromDataBaseWithStatus ( id , status  ) async{
   int count = await database.rawUpdate(
       'UPDATE Tasks SET status = ? WHERE id = ?',
       ['$status', id]);
   print('updated: $count');
 }
//  deleteDateBase () async{
//    var databasesPath = await getDatabasesPath();
//    String path = join(databasesPath, 'todo.db');
//
// // Delete the database
//    await deleteDatabase(path)
//  }
}
