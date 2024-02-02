import 'package:ecotown/core/models/map_tile_type.dart';

class MapTile {
  final MapTileType type;
  String? imagePath;

  MapTile({
    required this.type,
  }) {
    imagePath = _getImagePath();
  }

  String _getImagePath() {
    switch (type) {
      case MapTileType.grass:
        return 'assets/grass.png';
      case MapTileType.ground:
        return 'assets/grass_ground.png';
      case MapTileType.biofuelPlant:
        return 'assets/biofuel_plant.png';
      case MapTileType.solarPanel:
        return 'assets/solar_panel.png';
      case MapTileType.timberMill:
        return 'assets/timber_mill.png';
    }
  }
}
