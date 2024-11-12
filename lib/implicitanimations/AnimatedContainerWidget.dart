import 'package:flutter/material.dart';
import 'package:flutter_animations/theme/app_colors.dart';
import 'package:flutter_animations/widgets/app_toolbar.dart';

class AnimatedContainerWidget extends StatefulWidget {
  const AnimatedContainerWidget({super.key});

  @override
  State<AnimatedContainerWidget> createState() =>
      _AnimatedContainerWidgetState();
}

class _AnimatedContainerWidgetState extends State<AnimatedContainerWidget>
    with TickerProviderStateMixin {
  bool isExpanded = false;
  late AnimationController _definitionTitleController;
  late AnimationController _definitionDescriptionController;
  late AnimationController _codeSnippetTitleController;
  late AnimationController _codeSnippetController;
  late AnimationController _animationTitleController;
  late AnimationController _animationViewController;

  late Animation<Offset> _definitionTitleAnimation;
  late Animation<Offset> _definitionDescriptionAnimation;
  late Animation<Offset> _codeSnippetTitleAnimation;
  late Animation<Offset> _codeSnippetAnimation;
  late Animation<Offset> _animationTitleAnimation;
  late Animation<Offset> _animationViewAnimation;

  @override
  void initState() {
    super.initState();

    _definitionTitleController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    _definitionDescriptionController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    _codeSnippetTitleController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    _codeSnippetController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    _animationTitleController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    _animationViewController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    _definitionTitleAnimation = Tween<Offset>(
      begin: Offset(0, -1.5),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _definitionTitleController,
      curve: Curves.easeOut,
    ));

    _definitionDescriptionAnimation = Tween<Offset>(
      begin: Offset(0, -1.5),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _definitionDescriptionController,
      curve: Curves.easeOut,
    ));

    _codeSnippetTitleAnimation = Tween<Offset>(
      begin: Offset(0, -1.5),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _codeSnippetTitleController,
      curve: Curves.easeOut,
    ));

    _codeSnippetAnimation = Tween<Offset>(
      begin: Offset(0, -1.5),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _codeSnippetController,
      curve: Curves.easeOut,
    ));

    _animationTitleAnimation = Tween<Offset>(
      begin: Offset(0, 1.5),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _animationTitleController,
      curve: Curves.easeOut,
    ));

    _animationViewAnimation = Tween<Offset>(
      begin: Offset(0, 1.5),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _animationViewController,
      curve: Curves.easeOut,
    ));

    _definitionTitleController.forward();
    _definitionDescriptionController.forward();

    _codeSnippetTitleController.forward();
    _codeSnippetController.forward();

    _animationTitleController.forward();
    _animationViewController.forward();
  }

  @override
  void dispose() {
    super.dispose();

    _definitionTitleController.dispose();
    _definitionDescriptionController.dispose();
    _codeSnippetTitleController.dispose();
    _codeSnippetController.dispose();
    _animationTitleController.dispose();
    _animationViewController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppToolbar(title: "Animated Container"),

        body: SingleChildScrollView(

          child: Container(
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                    SlideTransition(
                      position: _definitionTitleAnimation,
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
                    SlideTransition(
                      position: _definitionDescriptionAnimation,
                      child: Text(
                        "Most versatile implicit animation widgets. It animates changes in size, padding, margin, decoration (e.g., border, background), alignment, and more.",
                        style: TextStyle(
                            color: app_text_color,
                            fontSize: 16,
                            fontWeight: FontWeight.w400),
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
                    SlideTransition(
                      position: _codeSnippetTitleAnimation,
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
                    SlideTransition(
                        position: _codeSnippetAnimation,
                        child: InteractiveViewer(
                          panEnabled: true,
                          scaleEnabled: true,
                          minScale: 1,
                          maxScale: 5,
                          child: const Image(
                              image: AssetImage(
                                  "assets/codesnippets/animated_container.png")),
                        ))
                  ],
                ),
              ),


              SizedBox(
                height: 20,
              ),


              Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
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
                    SlideTransition(
                      position: _animationTitleAnimation,
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
                    SlideTransition(
                      position: _animationViewAnimation,
                      child: Center(
                        child: AnimatedContainer(
                          duration: Duration(seconds: 1),
                          width: isExpanded ? 300 : 100,
                          height: isExpanded ? 300 : 100,
                          color: isExpanded ? Colors.blue : Colors.black,
                          curve: Curves.linearToEaseOut,
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                isExpanded = !isExpanded;
                              });
                            },
                            child: Center(
                              child: Text(
                                "Tap me",
                                style: TextStyle(
                                    color: isExpanded ? Colors.white : Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )


            ]),
          ),
        ));
  }
}
