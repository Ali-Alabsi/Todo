import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

import '../core/function_sqflite/function_sqflite.dart';
import '../model/user_model.dart';

part 'users_state.dart';

class UsersCubit extends Cubit<UsersState> {
  UsersCubit() : super(UsersInitial());
  static UsersCubit get(context) => BlocProvider.of(context);
  List<usersModel> listUsers=[] ;
  File? image;
  final picker = ImagePicker();
  // Insert New User
  insertUser() {
    emit(UsersLoadingInsert());
    SqfliteDB.database.transaction((txn) async {
      final user = usersModel(
        name: 'Ahmed',
        email: 'ahmed@gmail.com',
        phone: '01010101010',
        image: 'assets/svg/LogoTodoSplashScreen.png',
      );
      int id = await txn.insert('users', user.toMap());
      print('Insert Tasks Number $id ');
    });
    try {
      emit(UsersLoadedInsert());
    } catch (e) {
      emit(UsersErrorInsert());
    }
  }

  // get Users
  getUser() async {
    emit(UsersLoading());
    try {
      listUsers =[];
      List<Map<String, dynamic>> list = await SqfliteDB.database.query('Users',);
      list.forEach((userMap) async {
        listUsers.add(usersModel.fromJson(userMap));
      });
      print('------------------------${listUsers.length}');
      emit(UsersLoaded());
    } catch (e) {
      emit(UsersError());
    }
  }

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  // Update Users
  Future updateUser() async {
    print('----------------------------------------${image!.path}');
    emit(UsersLoadingUpdate());
    try {
     await SqfliteDB.database.transaction((txn) async {
        final user = usersModel(
          name: nameController.text,
          email: emailController.text,
          phone: phoneController.text,
          image: image!.path,
        );
        int id = await txn.update('users', user.toMap(), where: 'id = ?', whereArgs: [listUsers[0].id]);
         getUser();
        emit(UsersLoadedUpdate());
        print('Update Tasks Number $id ');

      });
    } catch (e) {
      emit(UsersErrorUpdate());
    }
  }
  Future getImage() async {
    try{
      emit(UsersLoadingImage());
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        image = File(pickedFile.path);
        emit(UsersLoadedImage());
        print('-------------------------');
        print( image?.path);
      } else {
        print('No image selected.');
      }
    }catch(e){
      // emit(UsersError());
    }
  }

}
