import 'package:flutter/material.dart';
import '../../../core/shared/colors.dart';
import '../../../core/shared/text_styles.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ProjectColors.mainColor,
        title: Text(
          'سياسة الخصوصية',
          
        ),

      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Text('سياسة الخصوصية', style: TextStyles.font18BlackBold),
              SizedBox(height: 15),
              Text(
                'نحن في Todo App نلتزم بحماية خصوصيتك. توضح هذه السياسة كيفية جمع واستخدام ومشاركة وحماية معلوماتك الشخصية.',
                style: TextStyles.font16BlackW500,
              ),
              SizedBox(height: 40),
              Text('جمع البيانات', style: TextStyles.font18BlackBold),
              SizedBox(height: 10),
              Text(
                'نقوم بجمع المعلومات التي تقدمها عند التسجيل في التطبيق، مثل الاسم والبريد الإلكتروني. كما نقوم بجمع معلومات حول المهام التي تقوم بإنشائها وإدارتها داخل التطبيق.',
                style: TextStyles.font16BlackW500,
              ),
              SizedBox(height: 40),
              Text('استخدام البيانات', style: TextStyles.font18BlackBold),
              SizedBox(height: 10),
              Text(
                'نستخدم المعلومات التي نجمعها لتحسين تجربتك في التطبيق، وتقديم الدعم الفني، وإرسال التحديثات والإشعارات الهامة. كما نستخدم البيانات لتحليل كيفية استخدام التطبيق وتحسين خدماتنا.',
                style: TextStyles.font16BlackW500,
              ),
              SizedBox(height: 40),
              Text('مشاركة البيانات', style: TextStyles.font18BlackBold),
              SizedBox(height: 10),
              Text(
                'نحن لا نشارك معلوماتك الشخصية مع أطراف ثالثة إلا في الحالات التالية: عندما نحصل على موافقتك، أو عندما يكون ذلك ضروريًا لتقديم خدماتنا، أو عندما يكون ذلك مطلوبًا بموجب القانون.',
                style: TextStyles.font16BlackW500,
              ),
              SizedBox(height: 40),
              Text('أمان البيانات', style: TextStyles.font18BlackBold),
              SizedBox(height: 10),
              Text(
                'نحن نتخذ تدابير أمنية لحماية معلوماتك الشخصية من الوصول غير المصرح به أو التعديل أو الكشف أو التدمير. ومع ذلك، لا يمكننا ضمان أمان البيانات بنسبة 100٪.',
                style: TextStyles.font16BlackW500,
              ),
              SizedBox(height: 40),
              Text('حقوق المستخدمين', style: TextStyles.font18BlackBold),
              SizedBox(height: 10),
              Text(
                'لديك الحق في الوصول إلى معلوماتك الشخصية وتصحيحها وحذفها. إذا كنت ترغب في ممارسة هذه الحقوق، يرجى الاتصال بنا عبر [معلومات الاتصال].',
                style: TextStyles.font16BlackW500,
              ),
              SizedBox(height: 40),
              Text('التغييرات في سياسة الخصوصية', style: TextStyles.font18BlackBold),
              SizedBox(height: 10),
              Text(
                'قد نقوم بتحديث سياسة الخصوصية من وقت لآخر. سنقوم بإعلامك بأي تغييرات جوهرية من خلال نشر السياسة الجديدة على هذه الصفحة.',
                style: TextStyles.font16BlackW500,
              ),
            ],
          ),
        ),
      ),
    );
  }
}