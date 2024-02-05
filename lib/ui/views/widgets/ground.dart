import 'package:flutter/material.dart';

/// 5 x 10 grid
/// index 0 - 139: grass, able to build buildings on
/// index 140 - 149: grass ground, not able to build buildings on
class Ground extends StatelessWidget {
  const Ground({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView(
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(10),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 5,
      ),
      children: List.generate(50, (index) {
        String? imagePath;
        if (index < 45) {
          return Container(
            decoration: BoxDecoration(
              color: Colors.green[200],
              border: Border.all(
                color: Colors.green[300]!,
                width: 1,
              ),
            ),
          );
          // imagePath = 'assets/images/grass.png';
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
