import 'package:flutter/material.dart';
import 'package:flutter_animations/widgets/app_toolbar.dart';

import '../theme/app_colors.dart';

class AnimatedAlignWidget extends StatefulWidget {
  const AnimatedAlignWidget({super.key});

  @override
  State<AnimatedAlignWidget> createState() => _AnimatedAlignWidgetState();
}

class _AnimatedAlignWidgetState extends State<AnimatedAlignWidget>
    with TickerProviderStateMixin {
  double _opacity = 0.0;
  Alignment _alignment = Alignment.topLeft;
  bool _changeContainers = false;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {
        _opacity = 1.0;
      });
    });
  }

  void changeAlignment() {
    setState(() {
      _alignment = _alignment == Alignment.topLeft
          ? Alignment.bottomRight
          : Alignment.topLeft;

      _changeContainers = !_changeContainers;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppToolbar(title: "Animated Align"),
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
                          child: Text(
                            "Definition : ",
                            style: TextStyle(
                                color: app_text_color,
                                fontSize: 18,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        AnimatedOpacity(
                          opacity: _opacity,
                          duration: Duration(seconds: 1),
                          child: Text(
                            "Animates the alignment of a widget inside its parent.",
                            style: TextStyle(
                                color:app_text_color,
                                fontSize: 16,
                                fontWeight: FontWeight.w400
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),



                  SizedBox(
                    height: 20,
                  ),
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
                  SizedBox(
                    height: 20,
                  ),
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
                        width: 400,
                        height: 300,
                        color: Colors.blue[100],
                        child: AnimatedAlign(
                          alignment: _alignment,
                          duration: Duration(seconds: 2),
                          curve: Curves.easeInOut,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              AnimatedContainer(
                                duration: Duration(seconds: 1),
                                width: _changeContainers ? 50 : 100,
                                height: _changeContainers ? 50 : 100,
                                color: _changeContainers
                                    ? Colors.red
                                    : Colors.tealAccent,
                                child: Center(
                                  child: GestureDetector(
                                    onTap: () {
                                      changeAlignment();
                                    },
                                    child: Text(
                                      "Tap",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: _changeContainers ? 10 : 20),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              AnimatedContainer(
                                duration: Duration(seconds: 1),
                                width: _changeContainers ? 50 : 100,
                                height: _changeContainers ? 50 : 100,
                                color: _changeContainers
                                    ? Colors.green
                                    : Colors.orange,
                                child: Center(
                                  child: GestureDetector(
                                    onTap: () {
                                      changeAlignment();
                                    },
                                    child: Text(
                                      "Tap",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: _changeContainers ? 10 : 20),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              AnimatedContainer(
                                duration: Duration(seconds: 1),
                                width: _changeContainers ? 50 : 100,
                                height: _changeContainers ? 50 : 100,
                                color: _changeContainers
                                    ? Colors.purple
                                    : Colors.yellow,
                                child: Center(
                                  child: GestureDetector(
                                    onTap: () {
                                      changeAlignment();
                                    },
                                    child: Text(
                                      "Tap",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: _changeContainers ? 10 : 20),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ]),
          ),
        ));
  }
}
