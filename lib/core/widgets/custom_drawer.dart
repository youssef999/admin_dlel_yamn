



 import 'package:flutter/material.dart';
import 'package:freelancerApp/Core/resources/app_colors.dart';
import 'package:freelancerApp/core/resources/app_assets.dart';
import 'package:freelancerApp/core/resources/app_styles.dart';
import 'package:freelancerApp/core/resources/colors.dart';
import 'package:freelancerApp/features/auth/views/login_view.dart';
import 'package:freelancerApp/features/contact/contact_view.dart';
import 'package:freelancerApp/features/convert_money/convert_money_view.dart';
import 'package:freelancerApp/features/dark/dark_view.dart';
import 'package:freelancerApp/features/details/details_view.dart';
import 'package:freelancerApp/features/football/football_view.dart';
import 'package:freelancerApp/features/news/news_view.dart';
import 'package:freelancerApp/features/phone/phone_view.dart';
import 'package:freelancerApp/features/trips/trips_view.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:share_plus/share_plus.dart';

import '../../features/home/views/home_view.dart';
import '../../features/notifications/noti_view.dart';


 Widget CustomDrawer(){

  return Drawer(
   // backgroundColor: AppColors.primaryBGLightColor,
   child: Stack(
      children: [
    Container(
            decoration: AppDecorationDrawer,
            child:SizedBox(
              height: 2000,
              width: 2000,
              child: 
              Image.asset
              (drawerBg,fit:BoxFit.cover,))),


 ListView(children: [
        const SizedBox(height: 5,),

        Padding(
          padding: const EdgeInsets.all(2.0),
          child: Container(
            decoration: BoxDecoration(
             borderRadius:BorderRadius.circular(13),
              color:  Colors.black12.withOpacity(0.4),
            ),
            child: Image.asset(logo,fit:BoxFit.cover,
            height: 133,
            ),
          ),
        ),


      //  Divider(color:Colors.grey[100],),
        const SizedBox(height: 22,),
      
        DrawerItemWidget(image: homeDrawer, txt: 'الرئيسية',),
        const SizedBox(height: 20,),
        InkWell(child: DrawerItemWidget(image: billDrawer,
         txt: 'اشعارات',),
         onTap:(){
          Get.to(const NotiView());
         },
         ),
        const SizedBox(height: 20,),

        InkWell(child: DrawerItemWidget(
          image: priceMoneyDrawer, txt: 'اسعار العملات',),
          
          onTap:(){
            Get.to(DetailsView(
              dataKey: 'money'
            ));
          },
          ),
      
      
      
        const SizedBox(height: 20,),
        InkWell(child: DrawerItemWidget
        (image:goldDrawer, txt: 'اسعار الذهب',),
        onTap:(){
           Get.to(DetailsView(
              
              dataKey: 'gold'

            ));
        },
        ),


        const SizedBox(height: 20,),
        InkWell(child: DrawerItemWidget
        (image:gazDrawer, txt: 'اسعار المحروقات',),
        
        onTap:(){

           Get.to(DetailsView(
            
              dataKey: 'gaz'

            ));
        },
        ),

        const SizedBox(height: 20,),
        InkWell(child:
         DrawerItemWidget(image:phoneDrawer,
          txt: 'دليل الارقام',),
          onTap:()
          {
            Get.to(const PhoneView());
          },
          
          ),


        const SizedBox(height: 20,),
        InkWell(child: DrawerItemWidget
        (image: newsDrawer, txt: 'أخبار اقتصادية',),
        onTap:(){
          Get.to(NewsView(txt:''));
        },
        ),

        const SizedBox(height: 20,),
        InkWell(child: DrawerItemWidget
        (image: ballDrawer, txt: 'دليل المباريات',),
        
        onTap:(){

          Get.to(const FootballView());
        },
        ),
        const SizedBox(height: 20,),
        InkWell(child: DrawerItemWidget(image:convertDrawer,
          txt: 'تحويل العملات',),

        onTap:(){
          Get.to(const ConvertMoney());
        },
        ),
   const SizedBox(height: 20,),
   InkWell(child: DrawerItemWidget(image:convertDrawer,
     txt: 'الرحلات',),
     onTap:(){
       Get.to(const TripsView());
     },
   ),
        //TripsView

        const SizedBox(height: 20,),


        InkWell(child: DrawerItemWidget(image: darkModeDrawer,
          txt: 'الوضع الليلي ',),

        onTap:(){
          Get.to(const DarkView());
        },
        ),


        const SizedBox(height: 20,),
        InkWell(child: DrawerItemWidget(image: contactDrawer,
          txt: 'تواصل معنا',),
        onTap:(){

          Get.to(const ContactView());

        },
        ),
        const SizedBox(height: 20,),

        InkWell(child:

        DrawerItemWidget(image: share,
          txt: 'شارك التطبيق',),

        onTap:(){
          Share.share('https://play.google.com/store/apps/details?id=com.appPrice.app24&amp;hl=en');
        },
        ),

        const SizedBox(height: 20,),
        InkWell(child: DrawerItemWidget(image:
        logout, txt: 'تسجيل الخروج',),
        onTap:(){
          final box=GetStorage();
          box.remove('email');
          Get.offAll(const LoginView());

        },
        ),
        const SizedBox(height: 20,),


        //lang.png //share.png
        //convert.png //contact.png

        //دليل المباريات


      ],),

      ],
    )
    ,

        // BoxDecoration(
        //     gradient: LinearGradient(
        //       colors: [
        //        //const Color(0xffC7E1EE),
        //         const Color(0xff346EA2),
        //        const Color(0xff5E34A2).withOpacity(0.9)
        //
        //
        //       // Colors.blue[400]!,
        //        // kPrimaryColor,
        //        // kPrimaryColor,
        //       ],
        //     )),
    //  height: 200,
     
    );
 }

 class DrawerItemWidget extends StatefulWidget {

  String image;
  String txt;
   
  DrawerItemWidget({super.key,required this.image,required this.txt});
 
   @override
   State<DrawerItemWidget> createState() => _DrawerItemWidgetState();
 }
 
 class _DrawerItemWidgetState extends State<DrawerItemWidget> {
   @override
   Widget build(BuildContext context) {
     final box=GetStorage();
     bool isDarkMode = box.read('theme')??false ;
     if(isDarkMode==true){
       return Row(children: [
         const SizedBox(width: 16,),
         Image.asset(widget.image,width: 20,height: 20,),
         const SizedBox(width: 16,),
         GradientText(
           widget.txt,
           style:TextStyle(
               color:kDrawerText,fontSize: 16,fontWeight:FontWeight.bold
           ),
           gradient: LinearGradient(
             colors: [ kBallColor
               ,  kBallColor2],
           ),
           // style: TextStyle(fontSize: 40),
         ),

       ],);
     }else{
       return Row(children: [
         const SizedBox(width: 16,),
         Image.asset(widget.image,width: 20,height: 20,),
         const SizedBox(width: 16,),
         GradientText(
           widget.txt,
           style:TextStyle(
               color:kDrawerText,fontSize: 16,fontWeight:FontWeight.bold
           ),
           gradient: const LinearGradient(
             colors: [ Colors.white
               ,  Colors.white],
           ),
           // style: TextStyle(fontSize: 40),
         ),

       ],);
     }

   }
 }



