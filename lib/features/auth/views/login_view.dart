// ignore_for_file: avoid_print, unnecessary_const

import 'package:flutter/material.dart';
import 'package:freelancerApp/core/resources/app_assets.dart';
import 'package:freelancerApp/core/resources/colors.dart';
import 'package:freelancerApp/core/widgets/Custom_Text.dart';
import 'package:freelancerApp/core/widgets/custom_loading.dart';
import 'package:freelancerApp/core/widgets/custom_textformfield.dart';
import 'package:freelancerApp/features/auth/controllers/auth_controller.dart';
import 'package:freelancerApp/features/auth/views/forgot_pass.dart';
import 'package:freelancerApp/features/home/views/home_view.dart';
import 'package:freelancerApp/routes/app_routes.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../admin/home/admin_view.dart';
import '../../../core/resources/app_colors.dart';
import '../../../core/resources/app_styles.dart';
import 'register_view2.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    AuthController controller = Get.put(AuthController());

    controller.loginFormKey = GlobalKey<FormState>();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: null,
      body: Form(
        key: controller.loginFormKey,
        child: Center(
          child: Container(
            //decoration: AppDecoration,
            child: GetBuilder<AuthController>(
              builder: (_) {
                return ListView(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Column(children: [
                      Image.asset(
                        height: 150,
                        AppAssets.logo,
                        fit: BoxFit.cover,
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
                      //   fit: BoxFit.cover,
                      // ),
                      const SizedBox(
                        height: 1,
                      ),

                      //  Text('اهلا بك في تطبيق دليل اليمن ',
                      //  style:Styles.primaryTextStyleLarge
                      //  ),
                      const SizedBox(
                        height: 11,
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
                              hint: 'البريد الالكتروني',
                              obs: false,
                              color: AppColors.textColorDark,
                              validateMessage: 'بريد الكتروني غير صحيح',
                              controller: controller.emailController),
                          const SizedBox(
                            height: 20,
                          ),
                          CustomTextFormField(
                              hint: 'كلمة المرور ',
                              obs: true,
                              color: AppColors.textColorDark,
                              validateMessage: 'كلمة المرور غير صحيحة',
                              obx: true,
                              controller: controller.passController),
                          const SizedBox(
                            height: 2,
                          ),
                           Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              const SizedBox(
                                width: 200,
                              ),
                              InkWell(
                                child: Custom_Text(
                                  text: 'نسيت كلمة المرور؟',
                                  color: Colors.grey[600]!,
                                  fontSize: 15,
                                ),
                                onTap: () {
                                  Get.to(const ForgotPass());
                                },
                              )
                            ],
                          ),
                           const SizedBox(
                            height: 20
                          ),
                          (controller.isLoading == false)?
                          InkWell(
                            child: Center(
                              child: Stack(
                                children: [
                                  Image.asset(
                                    'assets/images/button.png',
                                    width: 326,
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(top:20.0),
                                    child: Center(
                                      child: Text(
                                      " تسجيل الدخول  ",
                                      style: TextStyle(color: Colors.white),
                                      textAlign: TextAlign.center,
                                                              ),
                                    ),
                                  ),

                                ],
                              ),
                            ),
                            onTap:(){

                              Get.off(const AdminView());
                               //controller.userLogin();
                            },
                          ):const Center(
                            child:CircularProgressIndicator(),
                          ),
                          // ElevatedButton(
                          //   style: ElevatedButton.styleFrom(
                          //       elevation: 7,
                          //       fixedSize: const Size(300, 60),
                          //       shadowColor: AppColors.darkColor,
                          //       shape: RoundedRectangleBorder(
                          //           side: BorderSide(
                          //               width: 0.1, color: AppColors.darkColor),
                          //           borderRadius: BorderRadius.circular(10)),
                          //       backgroundColor: kPrimaryColor),
                          //   child: const Text(
                          //     "تسجيل دخول الان ",
                          //     style: TextStyle(color: Colors.white),
                          //     textAlign: TextAlign.center,
                          //   ),
                          //   onPressed: () {
                          //     CustomLoading.showLoading('Loading');
                          //     controller.userLogin();

                          //     // controller.getRoleIdByUser().then((value) {
                          //     //   print("role id done");
                          //     //   Future.delayed(const Duration(seconds: 1))
                          //     //       .then((value) {

                          //     //     {
                          //     //      // Get.offAll(const HomeView());

                          //     //     }

                          //     //   });
                          //     // });
                          //   },
                          // ),
                          const SizedBox(
                            height: 6,
                          ),

                          const SizedBox(height: 3),
                          Center(
                              child: Text(
                            'او'.tr,
                            style: const TextStyle(
                                color: AppColors.redColor, fontSize: 20),
                          )),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "لا تمتلك حساب ؟",
                                style:
                                    TextStyle(fontSize: 15, color: kPrimaryColor),
                              ),
                              TextButton(
                                onPressed: () {
                                  Get.to(const SignupView());
                                },
                                child: Text(
                                  'انشاء حساب'.tr,
                                  style: const TextStyle(
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
                );
              }
            ),
          ),
        ),
      ),
    );
  }
}
