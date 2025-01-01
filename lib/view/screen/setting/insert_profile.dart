import 'package:flutter/material.dart';
import 'package:todo/core/shared/colors.dart';
import '../../../controller/users_cubit.dart';
import '../../widget/insert_profile_widget.dart';

class InsertProfile extends StatelessWidget {
  final UsersCubit usersCubit;
  final UsersState usersState;

  const InsertProfile(
      {super.key, required this.usersCubit, required this.usersState});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ProjectColors.mainColor,
        title: Text('أضافة الحساب'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: FormInsertUserData(usersCubit: usersCubit, usersState: usersState),
          ),
        ),
      ),
    );
  }
}


