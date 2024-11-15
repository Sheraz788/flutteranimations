import 'package:flutter/material.dart';

class DetailedHeroScreen extends StatelessWidget {
  final String imageUrl;

  const DetailedHeroScreen({required this.imageUrl, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(
              tag: 'imageHero-${imageUrl.hashCode}', // Same unique tag to match source
              child: Transform.scale(
                scale: 1.2, // Initial scale for visual interest
                child: RotationTransition(
                  turns: AlwaysStoppedAnimation(10 / 360), // Slight rotation
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(
                      imageUrl,
                      width: 300,
                      height: 300,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Beautiful Image",
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "This is a more advanced version of the Hero animation with a zoom and rotation effect. "
                    "The image transitions smoothly from the grid view to this detailed view.",
                style: TextStyle(color: Colors.white60, fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Go Back"),
            ),
          ],
        ),
      ),
    );
  }
}
