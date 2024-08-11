


import 'package:flutter/material.dart';
import 'package:freelancerApp/core/resources/app_styles.dart';
import 'package:freelancerApp/core/widgets/bottom_navber.dart';
import 'package:freelancerApp/core/widgets/custom_app_bar.dart';
import 'package:freelancerApp/features/phone/phone_controller.dart';
import 'package:get/get.dart';

import '../../core/resources/app_colors.dart';
import '../../core/resources/colors.dart';
import '../home/controllers/root_controller.dart';
import '../home/views/widgets/drop_down.dart';

class PhoneDetailsView extends StatefulWidget {

  String phoneType;
 
  PhoneDetailsView({super.key,required this.phoneType});

  @override
  State<PhoneDetailsView> createState() => _PhoneDetailsViewState();
}

class _PhoneDetailsViewState extends State<PhoneDetailsView> {


  PhoneController controller=Get.put(PhoneController());


  @override
  void initState() {
   
     controller.getPhoneData(widget.phoneType);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    RootController rootController=Get.put(RootController());

    return Scaffold(
      bottomNavigationBar:buildBottomNavigationMenu(context,rootController
          ,  1 ),
      
     // appBar: CustomAppBar('', context),
      body:Container(
        //decoration: AppDecoration,
        child: Stack(
          children: [



            SizedBox(
              height: 3000,
              width: MediaQuery.of(context).size.width,
              child:Image.asset(backgroundImage,
                fit:BoxFit.fill,),
            ),
            Directionality(
              textDirection: TextDirection.rtl,
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: GetBuilder<PhoneController>(
                  builder: (_) {
                    return ListView(children: [
                       Image.asset(phoneAppBar,
                         fit:BoxFit.fill,
                    //height: 55,
                    width:MediaQuery.of(context).size.width,
                    ),
                      const SizedBox(height: 22,),
                        Padding(
                        padding: const EdgeInsets.only(left: 11, right: 11),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(21),
                              color: Colors.white),

                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                "المناطق",
                                style: TextStyle(color: AppColors.txtPrimaryColor),
                              ),
                              DropDownWidget(
                                items: controller.placesList,
                                hintText: 'المناطق',
                                selectedValue: controller.selcetPlace,
                                onChanged: (String? newValue) {
                                  controller.chnagePlace(newValue!,
                                  widget.phoneType
                                  );
                                },
                              ),
                              SizedBox(
                                height: 21,
                                child: Image.asset(
                                  'assets/images/star.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 5),
                     const Padding(
                        padding: EdgeInsets.all(10.0),
                        child:  PhoneTitleWidget(),
                      ),
                      ListView.builder(
                        itemCount: controller.phoneDataList.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                        return Padding(padding: const EdgeInsets.all(10.0),
                        child:PhoneCardWidget(
                          txt:controller.phoneDataList[index]['name'],
                          phone:controller.phoneDataList[index]['phone'],

                        ),
                        );
                      })

                    ],);
                  }
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



// ignore: must_be_immutable
class PhoneCardWidget extends StatelessWidget {

  String txt;
  String phone;
 
  PhoneCardWidget({super.key,required this.phone,required this.txt});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:BoxDecoration(
        borderRadius:BorderRadius.circular(12),
     //   border:Border.all(color:Colors.grey[100]!)
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment:MainAxisAlignment.spaceBetween,
          children: [
        
          Text(txt,style:Styles.darkTextStyleBold),
        
         const SizedBox(width: 12,),
        
            Text(phone,style:Styles.primaryTextStyle),
            const SizedBox(width: 12,),

            Row(
              children: [
                Image.asset('assets/images/phone.png'
                
                ,width: 42,
                ),

                  Image.asset('assets/images/share.png'
            
            ,width: 42,
            )
              ],
            ),

           

        
        
        ],),
      ),
    );
  }
}


class PhoneTitleWidget extends StatelessWidget {

 
 
 const PhoneTitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:BoxDecoration(
        border:Border.all(color: Colors.grey[100]!),
        borderRadius:BorderRadius.circular(12),
        color:Colors.white
     //   border:Border.all(color:Colors.grey[100]!)
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment:MainAxisAlignment.spaceBetween,
          children: [
          const  SizedBox(width: 6,),
        
          Text('الاسم',style:Styles.darkTextStyleBold),
        
         const SizedBox(width: 12,),
        
            Text('رقم الاتصال',style:Styles.primaryTextStyle),
            const SizedBox(width: 12,),

            const Row(
              children: [
                SizedBox(width: 84,)
            //     Image.asset('assets/images/phone.png'
                
            //     ,width: 42,
            //     ),

            //       Image.asset('assets/images/share.png'
            
            // ,width: 42,
            // )
              ],
            ),

           

        
        
        ],),
      ),
    );
  }
}