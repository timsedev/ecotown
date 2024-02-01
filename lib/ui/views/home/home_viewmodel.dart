import 'dart:async';
import 'dart:developer';

import 'package:stacked/stacked.dart';

class HomeViewModel extends BaseViewModel {
  // coordinates of the bird (player)
  double birdX = 0;
  double birdY = 0;

  Timer? timer;

  void hitA() {
    log('hit A');
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
      return;
    }

    timer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
      birdX += 0.05;
      rebuildUi();
    });
  }

  void moveLeft({bool? once}) {
    if (once != null) {
      if (once) {
        birdX -= 0.05;
        rebuildUi();
      }
      return;
    }

    timer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
      birdX -= 0.05;
      rebuildUi();
    });
  }

  void moveDown({bool? once}) {
    if (once != null) {
      if (once) {
        birdY += 0.05;
        rebuildUi();
      }
      return;
    }

    timer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
      birdY += 0.05;
      rebuildUi();
    });
  }

  void moveUp({bool? once}) {
    if (once != null) {
      if (once) {
        birdY -= 0.05;
        rebuildUi();
      }
      return;
    }

    timer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
      birdY -= 0.05;
      rebuildUi();
    });
  }

  void cancelTimer() {
    timer?.cancel();
  }
}
