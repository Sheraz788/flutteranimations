import 'package:flutter/material.dart';
import 'DetailedHeroScreen.dart';

class HeroAnimationsPractice extends StatelessWidget {
  final List<String> images = [
    'https://www.shutterstock.com/image-photo/calm-weather-on-sea-ocean-260nw-2212935531.jpg', // Placeholder image URLs
    'https://www.shutterstock.com/image-photo/calm-weather-on-sea-ocean-260nw-2212935531.jpg',
    'https://www.shutterstock.com/image-photo/calm-weather-on-sea-ocean-260nw-2212935531.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Hero Animations Advanced")),
      body: GridView.builder(
        padding: EdgeInsets.all(8),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
        ),
        itemCount: images.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => DetailedHeroScreen(imageUrl: images[index]),
                ),
              );
            },
            child: Hero(
              tag: 'imageHero-$index', // Unique tag for each item
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  images[index],
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
