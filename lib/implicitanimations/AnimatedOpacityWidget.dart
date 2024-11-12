import 'package:flutter/material.dart';
import 'package:flutter_animations/widgets/app_toolbar.dart';

import '../theme/app_colors.dart';

class AnimatedOpacityWidget extends StatefulWidget {
  const AnimatedOpacityWidget({super.key});

  @override
  State<AnimatedOpacityWidget> createState() => _AnimatedOpacityWidgetState();
}

class _AnimatedOpacityWidgetState extends State<AnimatedOpacityWidget>
    with TickerProviderStateMixin {
  double _opacity = 0.0;
  final int fadeDuration = 1;


  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {
        _opacity = 1.0;
      });
    });
  }


  void _fadeOutIn()
  {
    setState(() {
      _opacity = 0.0;
    });


    Future.delayed(Duration(seconds: fadeDuration), () {

      setState(() {
        _opacity = 1.0;
      });

    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppToolbar(title: "Animated Opacity"),

        body: SingleChildScrollView(

          child: Container(
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            child:
            Column(
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
                        ]),

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        AnimatedOpacity(
                          opacity: _opacity,
                          duration: const Duration(
                            seconds: 1,
                          ),
                          child: const Text(
                            "Definition : ",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w500),
                          ),
                        ),

                        SizedBox(
                          height: 10,
                        ),

                        AnimatedOpacity(
                          opacity: _opacity,
                          duration: Duration(seconds: 1),
                          child: const Text(
                            "Animates the opacity of a widget. It’s useful for fade-in/fade-out effects.",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w300),
                          ),
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
                        ]),

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        AnimatedOpacity(
                          opacity: _opacity,
                          duration: Duration(
                            seconds: 1,
                          ),
                          child: const Text(
                            "Code Snippet : ",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        AnimatedOpacity(
                          opacity: _opacity,
                          duration: Duration(seconds: 1),
                          child: InteractiveViewer(
                            panEnabled: true,
                            scaleEnabled: true,
                            minScale: 1,
                            maxScale: 5,
                            child: const Image(
                                image: AssetImage(
                                    "assets/codesnippets/animated_opacity.png")),
                          ),
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
                        ]),

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        AnimatedOpacity(
                          opacity: _opacity,
                          duration: Duration(
                            seconds: 1,
                          ),
                          child: const Text(
                            "Animation View : ",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: AnimatedOpacity(
                            opacity: _opacity,
                            duration: Duration(seconds: 1),
                            child: Container(
                              width: 300,
                              height: 200,
                              color: Colors.blue,
                              child: Center(
                                child: GestureDetector(
                                  onTap: () {
                                    _fadeOutIn();
                                  }, child: Text("Tap To Animate", style: TextStyle(color: Colors.white, fontSize: 20),),

                                ),
                              ),
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),

                ]),
          ),
        ));
  }
}
