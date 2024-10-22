import 'package:flutter/material.dart';
import 'package:flutter_animations/implicitanimations/AnimatedContainer.dart';

class ImplicitAnimations extends StatefulWidget {
  const ImplicitAnimations({super.key});

  @override
  State<ImplicitAnimations> createState() => _ImplicitAnimationsState();
}

class _ImplicitAnimationsState extends State<ImplicitAnimations> {

  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Implicit Animations"),
      ),

      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(

          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            ElevatedButton(onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)
              => AnimatedContainerAnim()
              ));
            }, child: Text("Animated Container")),


            ElevatedButton(onPressed: () {

            }, child: Text("Animated Opacity")),

            ElevatedButton(onPressed: () {

            }, child: Text("Animated Align")),


            ElevatedButton(onPressed: () {

            }, child: Text("Animated Padding")),



            ElevatedButton(onPressed: () {

            }, child: Text("Animated Positioned")),



            ElevatedButton(onPressed: () {

            }, child: Text("Animated CrossFade")),



            ElevatedButton(onPressed: () {

            }, child: Text("Animated Switcher")),

            ElevatedButton(onPressed: () {

            }, child: Text("Animated DefaultTextStyle")),


            ElevatedButton(onPressed: () {

            }, child: Text("Animated PhysicalModel")),


            ElevatedButton(onPressed: () {

            }, child: Text("Animated AnimatedSize")),


          ],),
      ),
    );
  }
}
