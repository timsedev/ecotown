import 'dart:async';
import 'dart:developer';

import 'package:ecotown/app/app.dialogs.dart';
import 'package:ecotown/app/app.locator.dart';
import 'package:ecotown/core/models/building.dart';
import 'package:ecotown/ui/common/app_strings.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {
  final _dialogService = locator<DialogService>();

  // coordinates of the bird (player)
  double birdX = 0;
  double birdY = 0;

  Timer? timer;

  List<Building?>? buildingsMap;

  HomeViewModel() {
    buildingsMap = tempBuildingsMap;
  }

  // hit A will open menu
  // menu will have different options which depend on the current location of the player
  void hitA() {
    log('hit A');

    // check player location
    // go through buildingsMap to check
    // if player is at biofuel plant
    // buildingsMap!.firstWhere((building) {
    //   if (building != null) {
    //     if (building.x == birdX.toInt() && building.y == birdY.toInt()) {
    //       openMenuDialog(building);
    //       return true;
    //     }
    //   }
    //   return false;
    // });

    // open menu dialog
    _dialogService.showCustomDialog(
      variant: DialogType.menu,
      data: biofuelData,
      barrierDismissible: true,
    );
  }

  void hitB() {
    log('hit B');
  }

  void moveRight({bool? once}) {
    if (once != null) {
      if (once) {
        birdX += 0.05;
        rebuildUi();
      }
      checkBoundaries();
      return;
    }

    timer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
      birdX += 0.05;
      rebuildUi();
    });
    checkBoundaries();
  }

  void moveLeft({bool? once}) {
    if (once != null) {
      if (once) {
        birdX -= 0.05;
        rebuildUi();
      }
      checkBoundaries();
      return;
    }

    timer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
      birdX -= 0.05;
      rebuildUi();
    });
    checkBoundaries();
  }

  void moveDown({bool? once}) {
    if (once != null) {
      if (once) {
        birdY += 0.05;
        rebuildUi();
      }
      checkBoundaries();
      return;
    }

    timer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
      birdY += 0.05;
      rebuildUi();
    });
    checkBoundaries();
  }

  void moveUp({bool? once}) {
    if (once != null) {
      if (once) {
        birdY -= 0.05;
        rebuildUi();
      }
      checkBoundaries();
      return;
    }

    timer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
      birdY -= 0.05;
      rebuildUi();
    });
    checkBoundaries();
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

    if (birdY > 1) {
      birdY = 1;
    }

    if (birdY < -1) {
      birdY = -1;
    }

    rebuildUi();
  }
}
