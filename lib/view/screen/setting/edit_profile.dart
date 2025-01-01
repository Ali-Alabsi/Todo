import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/core/shared/colors.dart';
import 'package:todo/core/shared/text_styles.dart';
import 'package:todo/core/widget/app_text_form_filed.dart';

import '../../../controller/users_cubit.dart';
import '../../widget/edit_profile_widget.dart';
import '../../widget/setting_widget.dart';

class EditProfile extends StatelessWidget {
  final UsersCubit usersCubit;
  final UsersState usersState;

  const EditProfile(
      {super.key, required this.usersCubit, required this.usersState});

  @override
  Widget build(BuildContext context) {
    usersCubit.nameController.text = usersCubit.listUsers[0].name;
    usersCubit.emailController.text = usersCubit.listUsers[0].email;
    usersCubit.phoneController.text = usersCubit.listUsers[0].phone;
    usersCubit.image = File(usersCubit.listUsers[0].image);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ProjectColors.mainColor,
        title: Text('تعديل الحساب'),
      ),
      body: SingleChildScrollView(
        child: FormEditDataUser(usersCubit: usersCubit, usersState: usersState),
      ),
    );
  }
}


