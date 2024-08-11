





import 'package:flutter/material.dart';
import 'package:freelancerApp/core/resources/app_colors.dart';
import 'package:freelancerApp/core/resources/colors.dart';

import '../home_view.dart';


class DropDownWidget extends StatelessWidget {

  //ActivityCubit cubit;
  String selectedValue;
  List<String> items;
  String hintText;
  Function onChanged;

 DropDownWidget({super.key,
 required this.items,
 required this.hintText,
 required this.onChanged,
 required this.selectedValue});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(21),
        //border: Border.all(
          //color: Colors.white
        //)
      ),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: DropdownButton<String>(
              hint: const Text('Select an item'),
             // underline: const SizedBox(),
              value:selectedValue,
              items: items.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child:

                  GradientText(
                value,
                    style:TextStyle(color: kTextPrimaryColor,
                        fontWeight:FontWeight.w800
                    ),
                    gradient: LinearGradient(
                      colors: [ kBallColor
                        ,  kBallColor2],
                    ),
                    // style: TextStyle(fontSize: 40),
                  ),

                );
              }).toList(),
              onChanged: (String? newValue) {
                onChanged(newValue!);
                // setState(() {
                //   _selectedItem = newValue;
                // });
              },
            
          ),
      ),
    );
  }
}