

 import 'package:flutter/material.dart';
import 'package:freelancerApp/features/home/views/home_view.dart';

import '../../core/resources/app_assets.dart';
import '../../core/resources/app_styles.dart';
import '../../core/resources/colors.dart';

// ignore: must_be_immutable
class DataCardWidget extends StatelessWidget {

  String title;
  String image;
  String img1;
  String img2;
  String buyPrice;
  String sellPrice;
  String date;
  String country;
  String type;
  String dataType;

DataCardWidget({super.key,
  required this.buyPrice,required this.image,
  required this.date,required this.country,
  required this.type,required this.dataType,
  this.img1='',this.img2='',
  required this.sellPrice,required this.title
  });

  @override
  Widget build(BuildContext context) {


    if(type=='money'){

       return Container(
      decoration:BoxDecoration(
        borderRadius:BorderRadius.circular(12),
        
        border:Border.all(
          color:kCardColor
        ),
          color:kCardColor
      ),
      child:Column(children: [
        Container(
          height: 50,
          decoration:BoxDecoration(
              color:kTextHelperLightColor,
            borderRadius:BorderRadius.circular(7)
          ),
          child: Padding(
            padding: const EdgeInsets.all(1.0),
            child: Row(
              mainAxisAlignment:MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 15,
                  backgroundImage: NetworkImage(img1),
                ),
              const  SizedBox(width: 2,),
                GradientText(
                  title,
                  style:TextStyle(
                      color:kPrimaryColor,
                      fontSize: 16,
                      fontWeight:FontWeight.w800
                  ),
                  gradient: LinearGradient(
                    colors: [ kBallColor
                      ,  kBallColor],
                  ),
                  // style: TextStyle(fontSize: 40),
                ),

                 const  SizedBox(width: 2,),
                 CircleAvatar(
                  radius: 15,
                  backgroundImage: NetworkImage(img2),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 1,),
        Container(
          padding: const EdgeInsets.all(3.0),
          child: Container(
            color:kCardColor,
            child: Padding(
              padding: const EdgeInsets.only(left:15.0,right:15),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment:MainAxisAlignment.center,
                    children: [
                    Column(children: [
                     const SizedBox(height: 41,),
                      GradientText(
                        'سعر الشراء',
                        style:Styles.primaryTextStyleBold,
                        gradient: LinearGradient(
                          colors: [ kBallColor
                            ,  kBallColor],
                        ),
                        // style: TextStyle(fontSize: 40),
                      ), GradientText(
                        ' ${buyPrice}'+"﷼",
                        style:Styles.primaryTextStyleBold,
                        gradient: LinearGradient(
                          colors: [ kBallColor
                            ,  kBallColor],
                        ),
                        // style: TextStyle(fontSize: 40),
                      ),



                      const SizedBox(height: 6,),



                    ],),
                 const   SizedBox(width: 21,),

                    Column(children: [

                     // Text(country,style:Styles.primaryTextStyle),

                      GradientText(
                        country,
                          style:Styles.primaryTextStyle,
                        gradient: LinearGradient(
                          colors: [ kBallColor
                            ,  kBallColor],
                        ),
                        // style: TextStyle(fontSize: 40),
                      ),
                     // Image.asset(image,height: 40,),
                      const SizedBox(height: 6,),
                      Image.asset(AppAssets.refersh,height: 22,),
                      const SizedBox(height: 8,),
                      (dataType=='up')?
                      Image.asset(AppAssets.arrowSt,height: 22,):
                      Image.asset(AppAssets.arrowStRed,height: 22,)


                    ],),
                     const   SizedBox(width: 21,),

                     Column(children: [
                       const SizedBox(height: 41,),
                       GradientText(
                         'سعر البيع',
                         style:Styles.primaryTextStyleBold,
                         gradient: LinearGradient(
                           colors: [ kBallColor
                             ,  kBallColor],
                         ),
                         // style: TextStyle(fontSize: 40),
                       ),

                      const SizedBox(height: 6,),
                       GradientText(
                         ' ${sellPrice} '+"﷼",
                         style:Styles.primaryTextStyle,
                         gradient: LinearGradient(
                           colors: [ kBallColor
                             ,  kBallColor],
                         ),
                         // style: TextStyle(fontSize: 40),
                       ),

                     const SizedBox(height: 11,),

                    ],),


                  ],),

                  const SizedBox(height: 7,),

                   InkWell(
                          child: Center(
                            child: Stack(
                              children: [
                                Image.asset(
                                 buttonBg,
                                  width: 270,
                                  height: 44,
                                  fit:BoxFit.fill,
                                ),
                                 Padding(
                                  padding: const EdgeInsets.only(top:7.0,bottom: 6),
                                  child: Padding(
                                                      padding:  const EdgeInsets.all(1.0),
                                                      child: Text("  "+'اخر تحديث اليوم عند الساعة'+" : "
                                                          +date,
                                                      style:Styles.lightTextStyle,
                                                      ),
                                                    ),
                                ),

                              ],
                            ),
                          ),
                          onTap:(){
                            // controller.userLogin();

                          },
                        ),
                   const SizedBox(height: 12,),

                ],
              ),
            ),
          ),
        )




      ],),
    );

    }else if(type=='gold'){


       return Container(
      decoration:BoxDecoration(
          border:Border.all(
              color:kCardColor
        ),
        borderRadius:BorderRadius.circular(12),
          color:kCardColor
        
      ),
      child:Column(children: [
        Container(
          height: 44,
          width:MediaQuery.of(context).size.width,
          decoration:BoxDecoration(
      color:kTextHelperLightColor,
            borderRadius:BorderRadius.circular(7)
          ),
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Center(
              child: GradientText(
                title,
                gradient: LinearGradient(
                  colors: [kBallColor
                    ,  kBallColor]
                ),
                  style:Styles.primaryTextStyleBold
              ),


            ),
          ),
        ),
        const SizedBox(height: 11,),
        Container(
          color:kCardColor,
          child: Padding(
            padding: const EdgeInsets.only(left:15.0,right:15),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment:MainAxisAlignment.center,
                  children: [
                     const   SizedBox(width: 21,),
                
                  Column(children: [
                     const SizedBox(height: 41,),

                    GradientText(
                        'سعر الشراء',
                        gradient: LinearGradient(
                            colors: [kBallColor
                              ,  kBallColor]
                        ),
                        style:Styles.primaryTextStyleBold
                    ),


                    const SizedBox(height: 6,),
                    GradientText(
                        ' ${buyPrice}'+"﷼",
                        gradient: LinearGradient(
                            colors: [kBallColor
                              ,  kBallColor]
                        ),
                        style:Styles.primaryTextStyle
                    ),


                      const SizedBox(height: 11,),
                        
                  ],),
                   const   SizedBox(width: 21,),
                
                  Column(children: [

                    GradientText(
                  country,
                        gradient: LinearGradient(
                            colors: [kBallColor
                              ,  kBallColor]
                        ),
                        style:Styles.primaryTextStyle
                    ),
                

                

                    Image.asset(AppAssets.gold,height: 40,),
                     const SizedBox(height: 5,),
                      Image.asset(AppAssets.arrowSt,height: 22,),
                    const SizedBox(height: 5,),
                   // Image.asset(AppAssets.arrowSt,height: 40,),

                  ],),
                   const   SizedBox(width: 21,),
                
                   Column(children: [
                     const SizedBox(height: 41,),
                     GradientText(
                         'سعر البيع',
                         gradient: LinearGradient(
                             colors: [kBallColor
                               ,  kBallColor]
                         ),
                         style:Styles.primaryTextStyleBold
                     ),

                    const SizedBox(height: 6,),
                     GradientText(
                         ' ${sellPrice} '+"﷼",
                         gradient: LinearGradient(
                             colors: [kBallColor
                               ,  kBallColor]
                         ),
                         style:Styles.primaryTextStyleBold
                     ),

                   const SizedBox(height: 11,),
                
                  ],),
                
                
                ],),
          
                const SizedBox(height: 7,),

                InkWell(
                        child: Center(
                          child: Stack(
                            children: [
                              Image.asset(
                                buttonBg,
                                width: 270,
                                height: 44,
                                fit:BoxFit.fill,
                              ),
                               Padding(
                                padding: const EdgeInsets.only(top:7.0),
                                child: Padding(
                                                    padding:  const EdgeInsets.all(1.0),
                                                    child: Text("  "+'اخر تحديث اليوم عند الساعة'+" : " +date,
                                                    style:Styles.lightTextStyle,
                                                    ),
                                                  ),
                              ),
                          
                            ],
                          ),
                        ),
                        onTap:(){
                          // controller.userLogin();

                        },
                      ),



          
                // Container(
                //   decoration:BoxDecoration(
                //     borderRadius:BorderRadius.circular(12),
                //     color:kButtonColor
                //   ),
                //   child:Padding(
                //     padding: const EdgeInsets.all(8.0),
                //     child: Text('اخر تحديث اليوم عند الساعة'+" : " +date,
                //     style:Styles.lightTextStyle,
                //     ),
                //   ),
                // ),
                 const SizedBox(height: 12,),
              ],
            ),
          ),
        )

      ],),
    );

    }else{
      return const Text('xxxxxxxxx');
    }
   
  }}