import 'package:flutter/material.dart';

class AnimatedContainerWidget extends StatefulWidget {
  const AnimatedContainerWidget({super.key});

  @override
  State<AnimatedContainerWidget> createState() => _AnimatedContainerWidgetState();
}

class _AnimatedContainerWidgetState extends State<AnimatedContainerWidget>  with TickerProviderStateMixin{
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
    ).animate(
      CurvedAnimation(
        parent: _definitionTitleController,
        curve: Curves.easeOut,
    ));

    _definitionDescriptionAnimation = Tween<Offset>(
      begin: Offset(0, -1.5),
      end: Offset.zero,
    ).animate(
        CurvedAnimation(
          parent: _definitionDescriptionController,
          curve: Curves.easeOut,
        ));

    _codeSnippetTitleAnimation = Tween<Offset>(
      begin: Offset(0, -1.5),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _codeSnippetTitleController,
        curve: Curves.easeOut,
    ));

    _codeSnippetAnimation = Tween<Offset>(
      begin: Offset(0, -1.5),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _codeSnippetController,
        curve: Curves.easeOut,
    ));


    _animationTitleAnimation = Tween<Offset>(
      begin: Offset(0, -1.5),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _animationTitleController,
        curve: Curves.easeOut,
    ));


    _animationViewAnimation = Tween<Offset>(
      begin: Offset(0, 1.5),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
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
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("Animated Container"),
      ),

      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              SlideTransition(position: _definitionTitleAnimation, child: const Text("Definition : ", style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w500),),),

              SizedBox(height: 10,),

              SlideTransition(position: _definitionDescriptionAnimation, child: const Text("Most versatile implicit animation widgets. It animates changes in size, padding, margin, decoration (e.g., border, background), alignment, and more.", style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w300),),),

              SizedBox(height: 20,),

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
                      onTap: (){
                        setState(() {
                          isExpanded = !isExpanded;
                        });
                      },
                      child: Center(child: Text("Tap me", style: TextStyle(color: isExpanded ? Colors.white : Colors.white),),),
                    ),

                  ),
                ),),
            ]
          ),
        ),
      )
    );
  }
}
