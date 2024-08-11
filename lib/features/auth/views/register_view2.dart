// ignore_for_file: avoid_print, unnecessary_const

import 'package:flutter/material.dart';
import 'package:freelancerApp/core/resources/app_assets.dart';
import 'package:freelancerApp/core/resources/colors.dart';
import 'package:freelancerApp/core/widgets/Custom_Text.dart';
import 'package:freelancerApp/core/widgets/custom_app_bar.dart';
import 'package:freelancerApp/core/widgets/custom_loading.dart';
import 'package:freelancerApp/core/widgets/custom_textformfield.dart';
import 'package:freelancerApp/features/auth/controllers/auth_controller.dart';
import 'package:freelancerApp/features/auth/views/forgot_pass.dart';
import 'package:freelancerApp/routes/app_routes.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/resources/app_colors.dart';
import '../../../core/resources/app_styles.dart';
import '../../home/views/home_view.dart';
import 'register_view2.dart';

class SignupView extends StatelessWidget {

  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {

    AuthController controller = Get.put(AuthController());

    controller.loginFormKey = GlobalKey<FormState>();

    return Scaffold(
      //  appBar: AppBar(
      //   toolbarHeight: 43,
      //   backgroundColor: Colors.transparent,
      //   elevation: 0,
      //   iconTheme: const IconThemeData(color: Colors.black),
      // ),
      //backgroundColor: Colors.blue[200],
      appBar:AppBar(
        backgroundColor: kPrimaryColor,
        elevation: 0.2,
        leading: IconButton(onPressed: (){
            Get.back();
        }, icon: const Icon(Icons.arrow_back_ios,
        size: 22,
        )),
       
   
      ),
      body: Form(
        key: controller.loginFormKey,
        child: Container(
          color:Colors.white,
          //decoration: AppDecoration,
          child: ListView(
            children: [
            
             
              Column(children: [
                Image.asset(
                    AppAssets.logo,
                    fit: BoxFit.fill,
                    height: 100,
                  ),
                GradientText(
                  "أهلا بك في تطبيق دليل اليمن !",

                  style:const TextStyle(
                    //  color: kTextPrimaryColor
                      fontSize: 27,
                      fontWeight:FontWeight.bold
                  ),
                  gradient: LinearGradient(
                    colors: [ kBallColor
                      ,  kBallColor2],
                  ),
                  // style: TextStyle(fontSize: 40),
                ),
                  // Image.asset(
                  //   'assets/images/Text.png',
                  //   fit: BoxFit.fill,
                  // ),
                const SizedBox(height: 11,),
                const SizedBox(
                  height: 20,
                ),
              ]),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                    //color: AppColors.primaryDarkColor,
                    borderRadius: BorderRadius.all(Radius.circular(25))),
                child: Column(
                  children: [
                    CustomTextFormField(
                        hint: 'email'.tr,
                        obs: false,
                        color: AppColors.textColorDark,
                        icon: Icons.email,
                        validateMessage: 'wrongEmail'.tr,
                        controller: controller.emailController),
                    const SizedBox(
                      height: 20,
                    ),
                     CustomTextFormField(
                        hint: 'الاسم'.tr,
                        obs: false,
                        color: AppColors.textColorDark,
                        validateMessage: 'wrongEmail'.tr,
                        controller: controller.nameController),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomTextFormField(
                        hint: 'password'.tr,
                        obs: true,
                        color: AppColors.textColorDark,
                        validateMessage: 'wrongPass'.tr,
                        obx: true,
                        controller: controller.passController),
                         const SizedBox(
                      height: 20,
                    ),
                    // CustomTextFormField(
                    //     hint: 'password'.tr,
                    //     obs: true,
                    //     color: AppColors.textColorDark,
                    //     validateMessage: 'wrongPass'.tr,
                    //     obx: true,
                    //     controller: controller.passController),
                    const SizedBox(
                      height: 3,
                    ),
                      InkWell(
                        child: Center(
                          child: Stack(
                            children: [
                              Image.asset(
                                'assets/images/button.png',
                                width: 370,
                              ),
                              const Padding(
                                padding: EdgeInsets.only(top:20.0),
                                child: Center(
                                  child: Text(
                                  " انشاء حساب",
                                  style: TextStyle(color: Colors.white),
                                  textAlign: TextAlign.center,
                                                          ),
                                ),
                              ),
                          
                            ],
                          ),
                        ),
                        onTap:(){
                          controller.signupUser();

                        },
                      ),
                  
                    const SizedBox(height: 6,),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(
                          width: 200,
                        ),
                      //  InkWell(
                      //     child: Custom_Text(
                      //       text: 'forgotPassword'.tr,
                      //       color:Colors.grey[600]!,
                      //       fontSize: 15,
                          
                      //     ),
                      //     onTap:(){
                      //       Get.to(const ForgotPass());
                      //     },
                      //   )
                      ],
                    ),
                    const SizedBox(
                      height: 3
                    ),
                    Center(
                        child: Text(
                      'or'.tr,
                      style:
                          const TextStyle(color: AppColors.redColor, fontSize: 20),
                    )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "تمتلك حساب بالفعل".tr,
                          style: TextStyle(
                              fontSize: 15, color: kPrimaryColor),
                        ),
                        TextButton(
                          onPressed: () {
                            //Get.to(const SignUpView());
                          },
                          child: Text(
                            'تسجيل حساب'.tr,
                            style:  const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.black),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
