import 'package:flutter/material.dart';
import 'package:freelancerApp/Core/resources/app_colors.dart';
import 'package:freelancerApp/core/resources/app_assets.dart';
import 'package:freelancerApp/core/resources/colors.dart';
import 'package:freelancerApp/core/widgets/Custom_button.dart';
import 'package:freelancerApp/core/widgets/custom_drawer.dart';
import 'package:freelancerApp/core/widgets/custom_textformfield.dart';
import 'package:freelancerApp/features/details/details_view.dart';
import 'package:freelancerApp/features/home/controllers/home_controller.dart';
import 'package:freelancerApp/features/home/views/widgets/drop_down.dart';
import 'package:freelancerApp/features/news/news_view.dart';
import 'package:get/get.dart';
import '../../../core/resources/app_styles.dart';
import '../../data_card_widget/data_card.dart';
import '../../football/football_view.dart';
import '../../phone/phone_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  HomeController controller = Get.put(HomeController());

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    controller.getPriceData();
    controller.getGoldData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: CustomDrawer(),

      body: Stack(
        children: [
          SizedBox(
            height: 3000,
            width: MediaQuery.of(context).size.width,
            child:Image.asset(backgroundImage,
            fit:BoxFit.fill,),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GetBuilder<HomeController>(builder: (_) {
              return Padding(
                padding: const EdgeInsets.all(2.0),
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: ListView(
                    children: [
                      
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset(
                              logo,
                              fit: BoxFit.cover,
                              width: 100,
                              height: 60,
                            ),
                            InkWell(
                              child: SizedBox(
                                height: 31,
                                child: Image.asset(
                               menuIcon,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              onTap: () {
                                scaffoldKey.currentState?.openDrawer();
                              },
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(
                        height: 12,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 11, right: 11),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(21),
                              color:kDropDownColor
                          //    kTextHelperLightColor
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              GradientText(
                                "المناطق",
                                style:const TextStyle(
                                  //  color: kTextPrimaryColor
                                    fontSize: 16,
                                    fontWeight:FontWeight.w800
                                ),
                                gradient: LinearGradient(
                                  colors: [ kBallColor
                                    ,  kBallColor],
                                ),
                                // style: TextStyle(fontSize: 40),
                              ),



                              DropDownWidget(
                                items: controller.placesList,
                                hintText: 'المناطق',
                                selectedValue: controller.selcetPlace,
                                onChanged: (String? newValue) {
                                  controller.chnagePlace(newValue!);
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
                      const SizedBox(
                        height: 5,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: ListView.builder(
                          itemCount: 1,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            if (controller.isLoading == true) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            } else if (controller.priceDataList.isEmpty) {
                              return const Center(child: SizedBox());
                            } else {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: DataCardWidget(
                                  dataType: controller.priceDataList[index]
                                  ['type'],
                                  img1: controller.priceDataList[index]
                                            ['img1'],
                                            img2: controller.priceDataList[index]
                                            ['img2'],
                                    buyPrice: controller.priceDataList[index]
                                            ['buyPrice']
                                        .toString(),
                                    image: 'assets/images/st.png',
                                    sellPrice: controller.priceDataList[index]
                                            ['sellPrice']
                                        .toString(),
                                    title: controller.priceDataList[index]
                                                ['country1']
                                            .toString() +
                                        "    مقابل   " +
                                        controller.priceDataList[index]
                                                ['country2']
                                            .toString(),
                                    type: 'money',
                                    date: controller.priceDataList[index]
                                        ['date'],
                                    country: controller.priceDataList[index]
                                        ['location']),
                              );
                            }
                          },
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                        ),
                      ),
                    
                      Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: ListView.builder(
                          itemCount: 1,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            // if (controller.isLoading==true){
                            //   return const Center(
                            //     child: CircularProgressIndicator(),
                            //   );
                            // }
                            if (controller.goldDataList.isEmpty) {
                              return const Center(child: SizedBox());
                            } else {
                              return Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: DataCardWidget(
                                    dataType:controller.priceDataList[index]
                                    ['type'],
                                    buyPrice: controller.goldDataList[index]
                                            ['buyPrice']
                                        .toString(),
                                    image: 'assets/images/gold.png',
                                    type: 'gold',
                                    sellPrice: controller.goldDataList[index]
                                            ['sellPrice']
                                        .toString(),
                                    title: controller.goldDataList[index]['txt']
                                        .toString(),
                                    date: controller.goldDataList[index]
                                        ['date'],
                                    country: controller.goldDataList[index]
                                        ['location']),
                              );
                            }
                          },
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                        ),
                      ),

                      //GradientText(
                      Padding(
                        padding: const EdgeInsets.only(left:23.0,right: 23),
                        child: GradientText(
                          'دليل اليمن',
                          style: Styles.primaryTextStyleLarge,
                          gradient: LinearGradient(
                            colors: [ kBallColor
                              ,  kBallColor],
                          ),
                         // style: TextStyle(fontSize: 40),
                        ),
                      ),
                     const SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          InkWell(
                            child: AppCardWidget(
                              image: moneyPrice,
                              txt: 'أسعار',
                              txt2:'العملات'
                            ),
                            onTap: () {
                              Get.to(DetailsView(
                                dataKey: 'money',
                              ));
                            },
                          ),
                          InkWell(
                            child: AppCardWidget(
                              image:goldPrice,
                              txt: 'اسعار',
                              txt2: 'الذهب',
                            ),
                            onTap: () {
                              Get.to(DetailsView(
                                dataKey: 'gold',
                              ));
                            },
                          ),
                          InkWell(
                            child: AppCardWidget(
                              image: gazPrice,
                              txt: 'أسعار',
                              txt2: 'المحروقات',
                            ),
                            onTap: () {
                              Get.to(DetailsView(
                                dataKey: 'gaz',
                              ));
                            },
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          InkWell(
                            child: AppCardWidget(
                              image: phoneIcon,
                              txt: 'دليل',
                              txt2: 'الارقام',
                            ),
                            onTap: () {
                              Get.to(const PhoneView());
                            },
                          ),
                          InkWell(
                            child: AppCardWidget(
                              image:newsIcon,
                              txt: "أخبار",
                              txt2: 'اقتصادية',
                            ),
                            onTap: () {
                              Get.to(NewsView(
                                txt: "news",
                              ));
                            },
                          ),
                          InkWell(
                            child: AppCardWidget(
                              image:ballIcon,
                              txt: 'دليل',
                              txt2: ' المباريات',
                            ),
                            onTap: () {
                              Get.to(const FootballView());
                            },
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
class GradientText extends StatelessWidget {
  GradientText(
      this.text, {
        required this.gradient,
        this.style,
      });

  final String text;
  final Gradient gradient;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) {
        return gradient.createShader(
          Rect.fromLTWH(0, 0, bounds.width, bounds.height),
        );
      },
      child: Text(
        text,
        style: style?.copyWith(color: Colors.white),
      ),
    );
  }
}
// ignore: must_be_immutable
class AppCardWidget extends StatelessWidget {
  String image;
  String txt;
  String txt2;

  AppCardWidget({super.key, required this.image, 
  
    required this.txt2,required this.txt});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      //width:MediaQuery.of(context).size.width*0.24,
      decoration: BoxDecoration(
        border:Border.all(color:Colors.grey),
          boxShadow: [
            BoxShadow(
              color: kShadowColor.withOpacity(0.2), // لون الظل مع ضبط الشفافية
              spreadRadius: 2, // مدى انتشار الظل
              blurRadius: 5, // مدى ضبابية الظل
              offset: const Offset(1, 3), // إزاحة الظل
            ),
          ],
          borderRadius:
          BorderRadius.circular(14),
          color: newCardColor),

      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Row(
          children: [
            Column(
              children: [
           const   SizedBox(height: 20,),
                SizedBox(
                  width: 57,
                  child:

                  GradientText(
                    txt,
                    style: const TextStyle(
                        //color:kPrimaryColor,
                        fontSize:13,
                        fontWeight:FontWeight.w800
                    ),
                    gradient: LinearGradient(
                      colors: [ kBallColor
                        ,  kBallColor],
                    ),
                    // style: TextStyle(fontSize: 40),
                  ),


                ),
                  SizedBox(
                  width: 61,
                  child: GradientText(
                    txt2,
                    style: const TextStyle(
                        //color:kPrimaryColor,
                        fontSize:13,
                        fontWeight:FontWeight.w800
                    ),
                    gradient: LinearGradient(
                      colors: [ kBallColor
                        ,  kBallColor],
                    ),
                    // style: TextStyle(fontSize: 40),
                  ),
                ),
              ],
            ),
            const SizedBox(
              width: 5,
            ),
            Image.asset(
              image,
              height: 40,
              width: 39,
              fit: BoxFit.cover,
            ),
             const SizedBox(
              width: 4
            ),
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable

