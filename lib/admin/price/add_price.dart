





import 'package:flutter/material.dart';
import 'package:freelancerApp/core/resources/colors.dart';
import 'package:freelancerApp/core/widgets/Custom_button.dart';
import 'package:freelancerApp/core/widgets/custom_textformfield.dart';
import 'package:get/get.dart';

class AddPrice extends StatefulWidget {
  const AddPrice({super.key});

  @override
  State<AddPrice> createState() => _PriceDetailsState();
}

class _PriceDetailsState extends State<AddPrice> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:kBallColor2,
      bottomSheet:  Padding(
        padding: const EdgeInsets.all(0.0),
        child: Container(
          color:Colors.blue[100]!.withOpacity( 0.4),
          child: Row(
            children: [
              const SizedBox(width: 20,),
              Padding(
                padding: const EdgeInsets.only(left:8.0,right: 8,bottom: 30),
                child: CircleAvatar(
                  backgroundColor:kBallColor,
                    child: const Icon(Icons.add,size: 40,
                      color: Colors.white
                    ) ),
              ),
            ],
          ),
        ),
      ),
      body:Directionality(
        textDirection: TextDirection.rtl,
        child: Stack(
          children: [
            SizedBox(
              height: 3000,
              width: MediaQuery.of(context).size.width,
              child:Image.asset(backgroundImage,
                fit:BoxFit.fill,),
            ),
            ListView(children: [
              const SizedBox(height: 44,),
              Row(
                //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const   SizedBox(width:90 ,),
                  Text("إضافة العملات",
                    style:TextStyle(
                        color:kBallColor,fontSize: 26,fontWeight:FontWeight.w700
                    ),
                  ),
                  const  SizedBox(width:90 ,),

                  InkWell(child: 
                  Image.asset('assets/images/backIcon.png',
                    height: 50,width: 50,),
                  onTap:(){Get.back();},
                  ),
                ],),
            const SizedBox(height: 90,),
              Padding(
                padding: const EdgeInsets.only(left: 28.0,right: 29),
                child: Container(
                  height: 312,
                  width:317,
                  decoration:  CardDecoration,
                  child:Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(children: [
                     const SizedBox(height: 20,),
                      Text("إضافة  عملة",style:TextStyle(
                        color:kBallColor,fontSize: 19,fontWeight:FontWeight.w700
                      )),
                     const SizedBox(height: 11,),
                     const SizedBox(
                       width: 200,
                       height: 43,
                       child:  TextField(
                         decoration: InputDecoration(
                           filled: true,
                           fillColor: Colors.white,

                             enabledBorder: OutlineInputBorder(
                               borderSide: BorderSide(color: Colors.white), // White border
                             ),
                             focusedBorder: OutlineInputBorder(
                               borderSide: BorderSide(color: Colors.white), // White border when focused
                             ),
                           labelText: ''
                         ),
                       ),
                     ),
                      const SizedBox(height: 11,),

                      Text("إضافة  علم الدولة",style:TextStyle(
                          color:kBallColor,fontSize: 19,fontWeight:FontWeight.w700
                      )),
                      const SizedBox(height: 11,),
                      Container(
                        width: 200,
                        height: 43,
                        decoration:BoxDecoration(
                          borderRadius:BorderRadius.circular(14),
                          color:Colors.white,
                        ),
                        child:Row(children: [
                         const SizedBox(width: 6,),
                          
                          Image.asset('assets/images/dow.png',
                          width: 29,
                          ),
                          const SizedBox(width: 6,),

                          Text("انقر لاضافة الصورة ",
                          style:TextStyle(
                            color: kBallColor,fontSize: 14,fontWeight:FontWeight.w500
                          ),
                          ),




                          

                        ],),
                      ),
                     const SizedBox(height: 20,),

                      CustomButton(text: 'اضافة', onPressed: (){})



                    ],),
                  ),
                ),
              ),
              const SizedBox(height: 200,),




            ],),
          ],
        ),
      ),
    );
  }
}
