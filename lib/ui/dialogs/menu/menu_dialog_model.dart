import 'package:stacked/stacked.dart';

class MenuDialogModel extends BaseViewModel {
  bool showDescription = false;

  void toggleShowDescription() {
    showDescription = !showDescription;
    notifyListeners();
  }
}
