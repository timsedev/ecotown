import 'package:flutter/material.dart';

class Ground extends StatelessWidget {
  const Ground({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView(
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(10),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 10,
      ),
      children: List.generate(150, (index) {
        String? imagePath;
        if (index < 140) {
          imagePath = 'assets/images/grass.png';
        } else {
          imagePath = 'assets/images/grass_ground.png';
        }

        return Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.fill,
            ),
          ),
        );
      }),
    );
  }
}
