import 'package:flutter/material.dart';
import 'package:flutter_animations/widgets/app_toolbar.dart';

import '../theme/app_colors.dart';
import '../widgets/elevated_button.dart';

class HeroAnimations extends StatefulWidget {

  const HeroAnimations({super.key});

  @override
  State<HeroAnimations> createState() => _HeroAnimationsState();
}

class _HeroAnimationsState extends State<HeroAnimations> {


  List<String> heroAnimations = [
    "Basic Animation",
  ];

  List<bool> _visibleList = List.generate(10, (index) => false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppToolbar(title: "Hero Animations"),

      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: tiles_theme_bg_color,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: app_theme_color.withOpacity(0.2),
                        spreadRadius: 5,
                        blurRadius: 3,
                        offset: Offset(0, 2),
                      ),
                    ]
                ),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Basic Concept :",
                      style: TextStyle(
                          color: app_text_color,
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    ),

                    Text(
                      "A Hero Animation in one sentence is simply an element of one screen “flying” to the next when the app goes to the next page.",
                      style: TextStyle(
                          color: app_text_color,
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),

              ),

              SizedBox(
                height: 20,
              ),


              Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: tiles_theme_bg_color,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: app_theme_color.withOpacity(0.2),
                        spreadRadius: 5,
                        blurRadius: 3,
                        offset: Offset(0, 2),
                      ),
                    ]
                ),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Text(
                      "Key Animations :",
                      style: TextStyle(
                          color: app_text_color,
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    ),

                    SizedBox(height: 10,),

                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: List.generate(
                          heroAnimations.length,
                              (index) {
                            return AnimatedContainer(
                                duration: Duration(seconds: 1),
                                curve: Curves.easeOut,
                                //margin: EdgeInsets.only(top: _visibleList[index] ? 10.0 : 100.0),
                                child: AppElevatedButton(
                                    onPress: () {



                                    },
                                    title: heroAnimations[index]));
                          },
                        ),
                      ),
                    )


                  ],
                ),
              )






            ]
          ),
        ),

      ),
    );
  }
}