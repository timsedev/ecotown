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
        return 'assets/images/grass.png';
      case MapTileType.ground:
        return 'assets/images/grass_ground.png';
      case MapTileType.biofuelPlant:
        return 'assets/images/biofuel_plant.png';
      case MapTileType.solarPanel:
        return 'assets/images/solar_panel.png';
      case MapTileType.timberMill:
        return 'assets/images/timber_mill.png';
    }
  }

  static List<MapTile> defaultMapTiles() {
    return List.generate(150, (index) {
      if (index >= 140) {
        return MapTile(type: MapTileType.ground);
      }

      if (index < 140) {
        return MapTile(type: MapTileType.grass);
      }

      return MapTile(type: MapTileType.grass);
    });
  }
}
