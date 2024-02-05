import 'package:ecotown/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:ecotown/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:ecotown/ui/views/home/home_view.dart';
import 'package:ecotown/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:ecotown/ui/dialogs/menu/menu_dialog.dart';
import 'package:ecotown/ui/dialogs/build/build_dialog.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView),
    MaterialRoute(page: StartupView),
    // @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    // @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    // @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    StackedDialog(classType: MenuDialog),
    StackedDialog(classType: BuildDialog),
// @stacked-dialog
  ],
)
class App {}
