import 'package:flutter/material.dart';
import 'package:flutter_animations/implicitanimations/AnimatedContainerWidget.dart';
import 'package:flutter_animations/widgets/app_toolbar.dart';

import 'AnimatedAlignWidget.dart';
import 'AnimatedCrossFadeWidget.dart';
import 'AnimatedDefaultTextStyleWidget.dart';
import 'AnimatedOpacityWidget.dart';
import 'AnimatedPaddingWidget.dart';
import 'AnimatedPhysicalModelWidget.dart';
import 'AnimatedPositionedWidget.dart';
import 'AnimatedSizeWidget.dart';
import 'AnimatedSwitcherWidget.dart';
import 'AnimationPractice.dart';

class ImplicitAnimations extends StatefulWidget {
  const ImplicitAnimations({super.key});

  @override
  State<ImplicitAnimations> createState() => _ImplicitAnimationsState();
}

class _ImplicitAnimationsState extends State<ImplicitAnimations>
    with TickerProviderStateMixin {
  late AnimationController _titleAnimationController;
  late AnimationController _descriptionAnimationController;
  late Animation<Offset> _titleAnimation;
  late Animation<Offset> _descriptionAnimation;

  List<String> implicitAnimations = [
    "Animated Container",
    "Animated Opacity",
    "Animated Align",
    "Animated Padding",
    "Animated Positioned",
    "Animated CrossFade",
    "Animated Switcher",
    "Animated DefaultTextStyle",
    "Animated PhysicalModel",
    "Animated Size"
  ];

  List<bool> _visibleList = List.generate(10, (index) => false);


  @override
  void initState() {
    super.initState();

    _titleAnimationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _descriptionAnimationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));

    _titleAnimation = Tween<Offset>(
      begin: Offset(-1.5, 0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
        parent: _titleAnimationController, curve: Curves.easeIn));

    _descriptionAnimation = Tween<Offset>(
      begin: Offset(-1.5, 0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
        parent: _descriptionAnimationController, curve: Curves.easeIn));

    _titleAnimationController.forward();
    _descriptionAnimationController.forward();
    _animateButtons();
  }

  void _animateButtons() {
    for (int i = 0; i < _visibleList.length; i++) {
      Future.delayed(Duration(milliseconds: i * 300), () {
        if (mounted) {
          setState(() {
            _visibleList[i] = true; // Show buttons one by one
          });
        }
      });
    }
  }

  @override
  void dispose() {
    super.dispose();

    _titleAnimationController.dispose();
    _descriptionAnimationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppToolbar(title: "Implicit Animations"),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SlideTransition(
                position: _titleAnimation,
                child: const Text(
                  "Basic Concept :",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w500),
                ),
              ),
              SlideTransition(
                position: _descriptionAnimation,
                child: const Text(
                  "            Implicit Animations are built-in animations that allow you to easily animate changes to widget properties, like size, position, color, or opacity, without needing to manually manage animation controllers or listeners.",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w400),
                  textAlign: TextAlign.start,
                ),
              ),
              SizedBox(
                height: 20,
              ),

              SlideTransition(
                position: _titleAnimation,
                child: const Text(
                  "Key Animations :",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w500),
                ),
              ),

              SizedBox(height: 10,),

              Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: List.generate(
                    implicitAnimations.length,
                    (index) {
                      return AnimatedContainer(
                          duration: Duration(seconds: 1),
                          curve: Curves.easeOut,
                          margin: EdgeInsets.only(top: _visibleList[index] ? 10.0 : 100.0),
                          child: ElevatedButton(
                              onPressed: () {
                                _handleButtonPress(index);
                              },
                              child: Text(implicitAnimations[index])));
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }


  void _handleButtonPress(int index) {

    switch(index) {
      case 0:
        Navigator.push(context, MaterialPageRoute(builder: (context) => AnimatedContainerWidget()));
        break;
      case 1:
        Navigator.push(context, MaterialPageRoute(builder: (context) => AnimatedOpacityWidget()));
        break;
      case 2:
        Navigator.push(context, MaterialPageRoute(builder: (context) => AnimatedAlignWidget()));
        break;
      case 3:
        Navigator.push(context, MaterialPageRoute(builder: (context) => AnimatedPaddingWidget()));
        break;
      case 4:
        Navigator.push(context, MaterialPageRoute(builder: (context) => AnimatedPositionedWidget()));
        break;
      case 5:
        Navigator.push(context, MaterialPageRoute(builder: (context) => AnimatedCrossFadeWidget()));
        break;
      case 6:
        Navigator.push(context, MaterialPageRoute(builder: (context) => AnimatedSwitcherWidget()));
        break;
      case 7:
        Navigator.push(context, MaterialPageRoute(builder: (context) => AnimatedDefaultTextStyleWidget()));
        break;
      case 8:
        Navigator.push(context, MaterialPageRoute(builder: (context) => AnimatedPhysicalModelWidget()));
        break;
      case 9:
        Navigator.push(context, MaterialPageRoute(builder: (context) => AnimatedSizeWidget()));
        break;
    }

  }

}
