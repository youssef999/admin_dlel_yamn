
import 'package:flutter/material.dart';
import 'package:freelancerApp/core/resources/app_styles.dart';
import 'package:freelancerApp/core/resources/colors.dart';
import 'package:freelancerApp/core/widgets/new_appbar.dart';
import 'package:freelancerApp/features/phone/phone_controller.dart';
import 'package:freelancerApp/features/phone/phone_details.dart';
import 'package:get/get.dart';
import '../../core/widgets/bottom_navber.dart';
import '../../core/widgets/custom_app_bar.dart';
import '../home/controllers/root_controller.dart';

class PhoneView extends StatefulWidget {
  const PhoneView({super.key});

  @override
  State<PhoneView> createState() => _PhoneViewState();
}

class _PhoneViewState extends State<PhoneView> {
  PhoneController controller = Get.put(PhoneController());
  @override
  void initState() {
   controller.checkTheme();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    RootController rootController=Get.put(RootController());

    return Scaffold(
      bottomNavigationBar:buildBottomNavigationMenu(context,rootController
          ,  1 ),
      backgroundColor: kBackgroundColor,
      //  appBar:CustomAppBar('phone', context),
      body: Padding(
        padding: const EdgeInsets.all(0.0),
        child: Stack(
          children: [
            SizedBox(
            height: 3000,
            child:Image.asset(backgroundImage,
            fit:BoxFit.fill,),
          ),
            ListView(
              children: [
                NewAppbar(txt:'أرقام مهمة'),
                // Image.asset(
                //   phoneAppBar,
                //   //height: 55,
                //   width: MediaQuery.of(context).size.width,
                //   fit:BoxFit.fill,
                // ),
                const SizedBox(height: 14),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: controller.phoneImage.length,
                    itemBuilder: (context, index) {
                      return PhoneCardWidget(
                          image: controller.phoneImage[index],
                          txt: controller.phoneName[index]);
                    },
                    gridDelegate:
                        const
                     SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.92,
                      crossAxisSpacing: 1,
                      mainAxisSpacing: 1,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class PhoneCardWidget extends StatelessWidget {
  String image;
  String txt;

  PhoneCardWidget({super.key, required this.image, required this.txt});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Column(
        children: [
          SizedBox(
            height: 130,
            width: 164,
            child: Container(
              decoration:BoxDecoration(
                  color: const Color(0XFFcfe2f3).withOpacity(0.5),
                borderRadius:BorderRadius.circular(22)
              ),

              child: Image.asset(
                image,height: 100,
                width: 70,
              )),
          ),

          const SizedBox(
            height: 2
          ),
          Text(txt, style: TextStyle(
            color: phoneCardTextColor,
            fontSize: 14,
            fontWeight: FontWeight.w600
          )),
           const SizedBox(
            height: 10,
          ),
        ],
      ),
      onTap: () {
        Get.to(PhoneDetailsView(phoneType: txt));
      },
    );
  }
}
