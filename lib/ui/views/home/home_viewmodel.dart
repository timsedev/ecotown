import 'dart:async';
import 'dart:developer';

import 'package:ecotown/app/app.dialogs.dart';
import 'package:ecotown/app/app.locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {
  final _dialogService = locator<DialogService>();

  // coordinates of the bird (player)
  double birdX = 0;
  double birdY = 0;

  Timer? timer;

  // hit A will open menu
  // menu will have different options which depend on the current location of the player
  void hitA() {
    log('hit A');

    // open menu dialog
    _dialogService.showCustomDialog(
      variant: DialogType.menu,
      data: {
        'name': 'Biofuel Plant',
        'description':
            'Biofuel is a sustainable alternative to fossil fuels. It is produced from organic materials such as plants and animals. It is a renewable source of energy and helps reduce greenhouse gas emissions. Biofuel can be used in vehicles, planes, and even power plants. It is a great way to reduce our carbon footprint.',
        'image-path': 'assets/images/biofuel_plant.png',
      },
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
