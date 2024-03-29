// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedDialogGenerator
// **************************************************************************

import 'package:stacked_services/stacked_services.dart';

import 'app.locator.dart';
import '../ui/dialogs/build/build_dialog.dart';
import '../ui/dialogs/info_alert/info_alert_dialog.dart';
import '../ui/dialogs/menu/menu_dialog.dart';

enum DialogType {
  infoAlert,
  menu,
  build,
}

void setupDialogUi() {
  final dialogService = locator<DialogService>();

  final Map<DialogType, DialogBuilder> builders = {
    DialogType.infoAlert: (context, request, completer) =>
        InfoAlertDialog(request: request, completer: completer),
    DialogType.menu: (context, request, completer) =>
        MenuDialog(request: request, completer: completer),
    DialogType.build: (context, request, completer) =>
        BuildDialog(request: request, completer: completer),
  };

  dialogService.registerCustomDialogBuilders(builders);
}
