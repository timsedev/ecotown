import 'package:ecotown/ui/common/app_strings.dart';

class Building {
  final String name;
  final String description;
  final String image;
  final double x;
  final double y;

  Building({
    required this.name,
    required this.description,
    required this.image,
    required this.x,
    required this.y,
  });

  factory Building.biofuelPlant(double x, double y) {
    return Building(
      name: biofuelData['name'] as String,
      description: biofuelData['description'] as String,
      image: biofuelData['image-path'] as String,
      x: x,
      y: y,
    );
  }
  factory Building.solarPanel(double x, double y) {
    return Building(
      name: solarPanelData['name'] as String,
      description: solarPanelData['description'] as String,
      image: solarPanelData['image-path'] as String,
      x: x,
      y: y,
    );
  }

  factory Building.timberMill(double x, double y) {
    return Building(
      name: timberMillData['name'] as String,
      description: timberMillData['description'] as String,
      image: timberMillData['image-path'] as String,
      x: x,
      y: y,
    );
  }
}
