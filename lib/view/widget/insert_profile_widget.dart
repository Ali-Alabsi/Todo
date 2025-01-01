import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../controller/users_cubit.dart';
import '../../core/shared/colors.dart';
import '../../core/widget/app_text_form_filed.dart';

class FormInsertUserData extends StatelessWidget {
  const FormInsertUserData({
    super.key,
    required this.usersCubit,
    required this.usersState,
  });

  final UsersCubit usersCubit;
  final UsersState usersState;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: usersCubit.formKey,
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          ViewAndInsertImageInEditProfile(
            imageURL: null,
            usersCubit: UsersCubit.get(context),
          ),
          SizedBox(
            height: 20,
          ),
          AppTextFormFiled(
            validator: (String? value) {
              if (value!.isEmpty) {
                return 'الاسم لا يمكن ان يكون فارغ';
              }else{
                return null;
              }
            },
            hintText: 'الاسم ',
            controller: usersCubit.nameController,
            prefixIcon: Icon(
              Icons.person,
              size: 25,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          AppTextFormFiled(
            stopSpace: true,
            keyboardType: TextInputType.emailAddress,
            validator: (String? value) {
              if (value!.isEmpty) {
                return 'الايميل لا يمكن ان يكون فارغ';
              } else if (!value.contains('@')) {
                return 'الايميل غير صحيح';
              } else {
                return null;
              }

            },
            hintText: 'الايميل',
            controller: usersCubit.emailController,
            prefixIcon: Icon(
              Icons.email,
              size: 25,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          AppTextFormFiled(
            stopSpace: true,
            keyboardType: TextInputType.phone,
            validator: (String? value) {
              if (value!.isEmpty) {
                return 'رقم الهاتف لا يمكن ان يكون فارغ';
              } else {
                return null;
              }
            },
            hintText: 'رقم الهاتف',
            controller: usersCubit.phoneController,
            prefixIcon: Icon(
              Icons.phone,
              size: 25,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              usersState is UsersLoadingUpdate
                  ? CircularProgressIndicator()
                  : Expanded(
                child: ElevatedButton(
                  onPressed: () async {
                    if(UsersCubit.get(context).formKey.currentState!.validate()){
                      if(UsersCubit.get(context).image != null){
                        UsersCubit.get(context).insertUser();
                        ScaffoldMessenger.of(context)
                            .showSnackBar(SnackBar(
                            content: Text(
                                'تم عملية اضافة المستخدم بنجاح ✔✔')));
                        Navigator.pop(context);
                      }else{
                        ScaffoldMessenger.of(context)
                            .showSnackBar(SnackBar(
                            content: Text(
                                'يجب اختيار صورة قبل الحفظ')));
                      }
                    }

                  },
                  child: Text('حفظ'),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        ProjectColors.mainColor),
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('الغاء'),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        ProjectColors.grayColors),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class ViewAndInsertImageInEditProfile extends StatelessWidget {
  final String? imageURL;

  final UsersCubit usersCubit;

  const ViewAndInsertImageInEditProfile({
    super.key,
    required this.imageURL,
    required this.usersCubit,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          radius: 75,
          child: Container(
            height: 130,
            width: 130,
            decoration: BoxDecoration(
              color: ProjectColors.mainColor.withOpacity(0.5),
              borderRadius: BorderRadius.circular(100),
            ),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child:UsersCubit.get(context).listUsers.isNotEmpty ?  Image.file(
              File(imageURL!),
              fit: BoxFit.cover,
            ):
            Icon(
              Icons.account_circle_sharp,
              size: 130,
            ),
          ),
        ),
        Positioned(
            bottom: 10,
            child: BlocConsumer<UsersCubit, UsersState>(
              listener: (context, state) {
                // TODO: implement listener
              },
              builder: (context, state) {
                return InkWell(
                  onTap: () async {
                    await UsersCubit.get(context).getImage();
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(
                            'تم اختيار الصورة يرجى ضغط على زر الحفظ حتى تتم عملية الحفظ ')));
                  },
                  child: Card(
                    child: Icon(
                      Icons.edit,
                      size: 30,
                      color: ProjectColors.mainColor,
                    ),
                  ),
                );
              },
            ))
      ],
    );
  }
}