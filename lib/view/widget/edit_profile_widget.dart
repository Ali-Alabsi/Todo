import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../controller/users_cubit.dart';
import '../../core/shared/colors.dart';
import '../../core/widget/app_text_form_filed.dart';

class FormEditDataUser extends StatelessWidget {
  const FormEditDataUser({
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
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              ViewAndEditImageInEditProfile(
                imageURL: usersCubit.listUsers[0].image,
                usersCubit: UsersCubit.get(context),
              ),
              SizedBox(
                height: 20,
              ),
              AppTextFormFiled(
                keyboardType: TextInputType.name,
                validator: (value) {
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
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'الايميل لا يمكن ان يكون فارغ';
                  }else{
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
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'رقم الهاتف لا يمكن ان يكون فارغ';
                  }else{
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
                        if(usersCubit.formKey.currentState!.validate()){
                          await UsersCubit.get(context).updateUser().then((value) {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(SnackBar(
                                content: Text(
                                    'تم عملية تعديل البروفايل بنجاح ✔✔')));
                            Navigator.pop(context);
                          });
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
        ),
      ),
    );
  }
}

class ViewAndEditImageInEditProfile extends StatelessWidget {
  final String imageURL;

  final UsersCubit usersCubit;

  const ViewAndEditImageInEditProfile({
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
            child: Image.file(
              File(imageURL),
              fit: BoxFit.cover,
            ),

            // Icon(
            //   Icons.account_circle_sharp,
            //   size: 130,
            // ),
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