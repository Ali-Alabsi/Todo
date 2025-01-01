import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo/controller/users_cubit.dart';

import '../../../core/shared/colors.dart';
import '../../../core/shared/text_styles.dart';
import '../../widget/setting_widget.dart';
import 'edit_profile.dart';

class Setting extends StatelessWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarSetting(),
      body: BlocConsumer<UsersCubit, UsersState>(
        listener: (context, state) {

        },
        builder: (context, state) {
          // int length = UsersCubit.get(context).listUsers.length;
          return Center(
            child: Padding(
              padding:
                  EdgeInsetsDirectional.symmetric(vertical: 15, horizontal: 10),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  UsersCubit.get(context).listUsers.length >0 ?  ViewImageInSetting(
                    imageURL: UsersCubit.get(context).listUsers[0].image) :CircularProgressIndicator(),
                  SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    onTap: () {
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => EditProfile(
                      //               usersCubit: UsersCubit.get(context),
                      //               usersState: UsersCubit.get(context).state,
                      //             )));
                    },
                    child: Text(
                      UsersCubit.get(context).listUsers.isNotEmpty
                          ? UsersCubit.get(context).listUsers[0].name
                          :'لا يوجد اسم',
                      style: TextStyles.font24mainColorW700,
                    ),
                  ),
                  Text(
                    UsersCubit.get(context).listUsers.isNotEmpty
                        ? UsersCubit.get(context).listUsers[0].email
                  :'لا يوجد ايميل',
                    style: TextStyles.font16grayColorW300,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  ListItemInSettingPage()
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
