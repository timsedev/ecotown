import 'dart:developer';

import 'package:ecotown/ui/common/app_strings.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class BuildDialogModel extends BaseViewModel {
  bool showDescription = false;
  String description = "";

  bool currentlySelectingBiofuel() {
    return description == biofuelData['description'] && showDescription;
  }

  bool currentlySelectingSolarPanel() {
    return description == solarPanelData['description'] && showDescription;
  }

  bool currentlySelectingTimberMill() {
    return description == timberMillData['description'] && showDescription;
  }

  void toggleBiofuelDescription() {
    if (currentlySelectingBiofuel() && showDescription) {
      description = "";
      showDescription = false;
      rebuildUi();
      return;
    }
    description = biofuelData['description'] as String;
    showDescription = true;
    rebuildUi();
  }

  void toggleSolarPanelDescription() {
    if (currentlySelectingSolarPanel() && showDescription) {
      description = "";
      showDescription = false;
      rebuildUi();
      return;
    }
    description = solarPanelData['description'] as String;
    showDescription = true;
    rebuildUi();
  }

  void toggleTimberMillDescription() {
    if (currentlySelectingTimberMill() && showDescription) {
      description = "";
      showDescription = false;
      rebuildUi();
      return;
    }
    description = timberMillData['description'] as String;
    showDescription = true;
    rebuildUi();
  }

  void buildBuilding(Function(DialogResponse<dynamic>) completer) {
    if (description.isEmpty) {
      return;
    }

    String buildingType;
    if (currentlySelectingBiofuel()) {
      buildingType = biofuelData['name'] as String;
    } else if (currentlySelectingSolarPanel()) {
      buildingType = solarPanelData['name'] as String;
    } else {
      buildingType = timberMillData['name'] as String;
    }

    completer(
      DialogResponse(data: {'build': buildingType}),
    );
  }
}
