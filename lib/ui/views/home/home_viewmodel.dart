import 'dart:async';
import 'dart:developer' as d;
import 'dart:math';

import 'package:ecotown/app/app.dialogs.dart';
import 'package:ecotown/app/app.locator.dart';
import 'package:ecotown/core/models/building.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {
  final _dialogService = locator<DialogService>();

  // coordinates of the bird (player)
  double birdX = 0;
  double birdY = 0;

  Timer? timer;
  final random = Random();

  List<Building?>? buildingsMap;

  HomeViewModel() {
    buildingsMap = tempBuildingsMap;
    timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      // randomly move the bird around
      final randX = random.nextBool();
      final randY = random.nextBool();

      if (randX) {
        birdX += 0.05;
      } else {
        birdX -= 0.05;
      }

      if (randY) {
        birdY += 0.05;
      } else {
        birdY -= 0.05;
      }

      checkBoundaries();
    });
  }

  void cancelTimer() {
    timer?.cancel();
  }

  void checkBoundaries() {
    if (birdX > 1) {
      birdX = 1;
    }

    if (birdX < -1) {
      birdX = -1;
    }

    if (birdY > 0.75) {
      birdY = 0.75;
    }

    if (birdY < -1) {
      birdY = -1;
    }

    rebuildUi();
  }

  void openBuildingDialog(Building building) {
    _dialogService.showCustomDialog(
      variant: DialogType.menu,
      barrierDismissible: true,
      data: {
        'name': building.name,
        'description': building.description,
        'image-path': building.image,
      },
    );
  }

  void openBuildBuildingDialog() {
    _dialogService.showCustomDialog(
      variant: DialogType.build,
      barrierDismissible: true,
    );
  }
}
