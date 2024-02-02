import 'dart:developer';

import 'package:ecotown/ui/common/app_strings.dart';

/// building grid = 5 x 7
class Building {
  final String name;
  final String description;
  final String image;
  final int x;
  final int y;

  Building({
    required this.name,
    required this.description,
    required this.image,
    required this.x,
    required this.y,
  });

  factory Building.biofuelPlant(int x, int y) {
    return Building(
      name: biofuelData['name'] as String,
      description: biofuelData['description'] as String,
      image: biofuelData['image-path'] as String,
      x: x,
      y: y,
    );
  }
  factory Building.solarPanel(int x, int y) {
    return Building(
      name: solarPanelData['name'] as String,
      description: solarPanelData['description'] as String,
      image: solarPanelData['image-path'] as String,
      x: x,
      y: y,
    );
  }

  factory Building.timberMill(int x, int y) {
    return Building(
      name: timberMillData['name'] as String,
      description: timberMillData['description'] as String,
      image: timberMillData['image-path'] as String,
      x: x,
      y: y,
    );
  }
}

/// temporary building map
List<Building?> buildingsMap = List.generate(35, (index) {
  if (index == 10) {
    return Building.biofuelPlant(index % 4, index ~/ 4);
  }
  if (index == 28) {
    return Building.biofuelPlant(index % 4, index ~/ 4);
  }
  return null;
});
