import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/controller/users_cubit.dart';
import 'package:todo/view/screen/setting/insert_profile.dart';

import '../../core/shared/colors.dart';
import '../../core/shared/text_styles.dart';
import '../screen/setting/contact_us.dart';
import '../screen/setting/edit_profile.dart';
import '../screen/setting/natifications.dart';
import '../screen/setting/privacy_policy.dart';

class ListItemInSettingPage extends StatelessWidget {
  const ListItemInSettingPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          SizedBox(
            height: 15,
          ),
          ItemEditAndInsertUsers(),
          ItemInSettingPage(
              title: 'الاشعارات والمهام المتبقية', icon: Icons.notifications, onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Notifications()));
          }),
          ItemInSettingPage(
              title: 'تواصل معنا', icon: Icons.call, onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => ContactUs()));
          }),
          ItemInSettingPage(
              title: 'سياسة الخصوصية', icon: Icons.privacy_tip, onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => PrivacyPolicy()));
          }),
          ButtonSignOut()
        ],
      ),
    );
  }
}

class ButtonSignOut extends StatelessWidget {
  const ButtonSignOut({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: ElevatedButton(
        onPressed: () async {
          await UsersCubit.get(context).deleteUsers();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('تم حذف معلومات الحساب'),
              backgroundColor: ProjectColors.mainColor,
            ),
          );
        },
        child:
            Text('حذف معلومات الحساب', style: TextStyles.font16whiteColorW300),
        style: ElevatedButton.styleFrom(
          backgroundColor: ProjectColors.mainColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          minimumSize: Size(double.infinity, 50),
        ),
      ),
    );
  }
}

class ItemInSettingPage extends StatelessWidget {
  final String title;
  final IconData icon;
  final void Function()? onTap;

  const ItemInSettingPage({
    super.key,
    required this.title,
    required this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Icon(icon, size: 40, color: ProjectColors.mainColor),
          title: Text(title, style: TextStyles.font16grayColorW300),
          trailing: Icon(
            Icons.arrow_forward_ios,
            color: ProjectColors.mainColor,
          ),
          onTap: onTap,
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }
}

class ViewImageInSetting extends StatelessWidget {
  final String? imageURL;

  const ViewImageInSetting({
    super.key,
    this.imageURL,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 75,
      child: Container(
        height: 130,
        width: 130,
        decoration: BoxDecoration(
          color: ProjectColors.mainColor.withOpacity(0.5),
          borderRadius: BorderRadius.circular(100),
        ),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: imageURL != null
            ? Image.file(
                File(imageURL!),
                fit: BoxFit.cover,
              )
            : Icon(
                Icons.account_circle_sharp,
                size: 130,
              ),
      ),
    );
  }
}

AppBar appBarSetting() {
  return AppBar(
    backgroundColor: ProjectColors.mainColor,
    title: Text('الاعدادت'),
  );
}

class ItemEditAndInsertUsers extends StatelessWidget {
  const ItemEditAndInsertUsers({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UsersCubit, UsersState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return UsersCubit.get(context).listUsers.isNotEmpty
            ? ButtonEditUserInPageSetting()
            : ButtonInsertUserInPageSetting();
      },
    );
  }
}

class ButtonEditUserInPageSetting extends StatelessWidget {
  const ButtonEditUserInPageSetting({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ItemInSettingPage(
        title: 'تعديل البروفايل',
        icon: Icons.account_circle,
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => EditProfile(
                        usersCubit: UsersCubit.get(context),
                        usersState: UsersCubit.get(context).state,
                      )));
        });
  }
}

class ButtonInsertUserInPageSetting extends StatelessWidget {
  const ButtonInsertUserInPageSetting({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ItemInSettingPage(
        title: 'اضافة البروفايل',
        icon: Icons.account_circle,
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => InsertProfile(
                        usersCubit: UsersCubit.get(context),
                        usersState: UsersCubit.get(context).state,
                      )));
        });
  }
}
