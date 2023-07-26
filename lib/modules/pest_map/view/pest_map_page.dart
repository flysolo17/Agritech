import 'package:flutter/material.dart';

class PestMapPage extends StatelessWidget {
  const PestMapPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> imageUrls = [
      'lib/assets/images/homeimg1.png',
      'lib/assets/images/homeimg1.png',
      'lib/assets/images/homeimg3.png',
      // Add more image URLs as needed
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pest Map'),
      ),
      body: ListView.builder(
        itemCount: imageUrls.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: Image.asset(
                imageUrls[index],
                fit: BoxFit.cover, // Adjust image size to cover the card
              ),
            ),
          );
        },
      ),
    );
  }
}
