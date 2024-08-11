import 'package:flutter/material.dart';
import 'package:freelancerApp/core/widgets/Custom_button.dart';
import 'package:freelancerApp/features/trips/trips_controller.dart';
import 'package:get/get.dart';
import '../../core/resources/colors.dart';
import '../home/views/home_view.dart';
import '../home/views/widgets/drop_down.dart';

class TripsView extends StatefulWidget {
  const TripsView({super.key});

  @override
  State<TripsView> createState() => _TripsViewState();
}

class _TripsViewState extends State<TripsView> {
  TripsController controller = Get.put(TripsController());

  @override
  void initState() {
    controller.getAllTrips();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            backgroundImage,
            fit: BoxFit.fill,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
          ),
          GetBuilder<TripsController>(builder: (_) {
            return ListView(
              children: [
                Image.asset(
                  'assets/images/tripsAppBar.png',
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.fill,
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 20, left: 21.0, right: 21),
                  child: Container(
                    decoration:

                    BoxDecoration(
                      borderRadius: BorderRadius.circular(13),
                      border: Border.all(color: Colors.white),
                      gradient: const RadialGradient(
                        center: Alignment(0.919, 0.58),
                        radius: 0.27,
                        colors: <Color>[
                          const Color(0xE5C9DEF2),
                          Color(0xE5C0D9F0),
                          Color(0xE5CADEF2)
                        ],
                        stops: <double>[0.2, 0.2, 1.3],
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GradientText("المنطقة",
                                  gradient: LinearGradient(
                                    colors: [kBallColor, kBallColor2],
                                  ),
                                  style: TextStyle(
                                      color: kPrimaryColor,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)),
                              DropDownWidget(
                                items: controller.placesList,
                                hintText: ' المنطقة',
                                selectedValue: controller.selcetPlace,
                                onChanged: (String? newValue) {
                                  controller.chnagePlace(newValue!);
                                },
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GradientText("نوع الرحلة",
                                  gradient: LinearGradient(
                                    colors: [kBallColor, kBallColor2],
                                  ),
                                  style: TextStyle(
                                      color: kPrimaryColor,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)),
                              DropDownWidget(
                                items: controller.typeList,
                                hintText: ' العملة ',
                                selectedValue: controller.selcetType,
                                onChanged: (String? newValue) {
                                  controller.chnageType(newValue!);
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                ListView.builder(
                    shrinkWrap: true,
                    itemCount: controller.tripsList.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: TripCardWidget(
                          trip: controller.tripsList[index],
                        ),
                      );
                    })
              ],
            );
          }),
        ],
      ),
    );
  }
}

class TripCardWidget extends StatelessWidget {
  Map<String, dynamic> trip;

  TripCardWidget({super.key, required this.trip});

  @override
  Widget build(BuildContext context) {
    String type = '';
    String image = '';

    if (trip['type'] == 'الطيران') {
      type = 'رقم الطائرة';
      image = 'assets/images/plane.png';
    } else if (trip['type'] == 'باصات') {
      type = 'رقم الباص';
      image = 'assets/images/bus.png';
    }
    if (trip['type'] == 'الطيران') {
      type = 'رقم الطائرة';
      image = 'assets/images/car.png';
    }

    return Container(
      height: 210,
      width: 330,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(13),
        border: Border.all(color: Colors.white),
        gradient: const RadialGradient(
          center: Alignment(0.919, 0.58),
          radius: 0.27,
          colors: <Color>[
            const Color(0xE5C9DEF2),
            Color(0xE5C0D9F0),
            Color(0xE5CADEF2)
          ],
          stops: <double>[0.2, 0.885, 1],
        ),
      ),
      child: Column(
        children: [
          const SizedBox(
            height: 21,
          ),
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 48.0, top: 1),
                child: Image.asset(
                  image,
                  fit: BoxFit.cover,
                  height: 20,
                ),
              ),
              Image.asset(
                'assets/images/line.png',
              ),
            ],
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(left: 55.0, right: 55),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    trip['from'],
                    style: TextStyle(
                        color: kTextHelperDarkColor,
                        fontSize: 17,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    trip['to'],
                    style: TextStyle(
                        color: kTextHelperDarkColor,
                        fontSize: 17,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  type,
                  style: const TextStyle(color: Colors.grey),
                ),
                const Text(
                  'وقت الرحلة',
                  style: TextStyle(color: Colors.grey),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  trip['num'],
                  style: const TextStyle(color: Colors.grey),
                ),
                Text(
                  trip['time'],
                  style: const TextStyle(color: Colors.grey),
                )
              ],
            ),
          ),
          Image.asset('assets/images/div.png'),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //SizedBox(width: 1,),

                Stack(
                  children: [
                    Image.asset(
                      'assets/images/buttonCard.png',
                      width: 134,
                      fit: BoxFit.fill,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        trip['company'],
                        style: TextStyle(
                          color: kTextHelperLightColor,
                        ),
                      ),
                    )
                  ],
                ),

                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      color: Colors.white,
                      border: Border.all(color: kPrimaryColor, width: 2)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      trip['price'],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
