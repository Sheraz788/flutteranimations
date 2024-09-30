import 'package:flutter/material.dart';

class AnimationsWithDelay extends StatefulWidget {
  const AnimationsWithDelay({Key? key}) : super(key: key);

  @override
  _AnimationsWithDelayState createState() => _AnimationsWithDelayState();
}

class _AnimationsWithDelayState extends State<AnimationsWithDelay> with TickerProviderStateMixin {
  late AnimationController _titleController;
  late AnimationController _descriptionController;
  late AnimationController _imageController;

  late Animation<Offset> _titleAnimation;
  late Animation<Offset> _descriptionAnimation;
  late Animation<Offset> _imageAnimation;

  @override
  void initState() {
    super.initState();

    // AnimationController for title
    _titleController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _titleAnimation = Tween<Offset>(
      begin: const Offset(0.0, 1.0), // Start from bottom
      end: Offset.zero, // End at its normal position
    ).animate(CurvedAnimation(
      parent: _titleController,
      curve: Curves.easeOut,
    ));

    // AnimationController for description
    _descriptionController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _descriptionAnimation = Tween<Offset>(
      begin: const Offset(0.0, 1.0), // Start from bottom
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _descriptionController,
      curve: Curves.easeOut,
    ));

    // AnimationController for image
    _imageController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _imageAnimation = Tween<Offset>(
      begin: const Offset(0.0, 1.0), // Start from bottom
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _imageController,
      curve: Curves.easeOut,
    ));

    // Start animations sequentially
    _startAnimations();
  }

  void _startAnimations() async {
    // Start title animation first
    await _titleController.forward();

    // Delay for the description to start
    await Future.delayed(const Duration(milliseconds: 300));
    await _descriptionController.forward();

    // Delay for the image to start
    await Future.delayed(const Duration(milliseconds: 300));
    await _imageController.forward();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _imageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sequential Slide Animation'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Title Text
            AnimatedBuilder(
              animation: _titleAnimation,
              builder: (context, child) {
                return SlideTransition(
                  position: _titleAnimation,
                  child: const Text(
                    'Title',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                );
              },
            ),
            const SizedBox(height: 20),

            // Description Text
            AnimatedBuilder(
              animation: _descriptionAnimation,
              builder: (context, child) {
                return SlideTransition(
                  position: _descriptionAnimation,
                  child: const Text(
                    'Description',
                    style: TextStyle(fontSize: 20),
                  ),
                );
              },
            ),
            const SizedBox(height: 20),

            // Image
            AnimatedBuilder(
              animation: _imageAnimation,
              builder: (context, child) {
                return SlideTransition(
                  position: _imageAnimation,
                  child: Image.network(
                    'https://flutter.dev/assets/images/shared/brand/flutter/logo/flutter-lockup.png',
                    width: 100,
                    height: 100,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
