import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:ecotown/ui/common/app_colors.dart';
import 'package:ecotown/ui/common/ui_helpers.dart';

import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: Column(
        children: [
          // game map
          Expanded(
            flex: 10,
            child: Container(
              color: Colors.green,
            ),
          ),
          // controller
          Expanded(
            flex: 3,
            child: Container(
              color: Colors.blue,
            ),
          ),
        ],
      ),
    );
  }

  @override
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeViewModel();
}
