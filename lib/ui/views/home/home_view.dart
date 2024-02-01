import 'dart:developer';

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
            child: _buildMap(context, viewModel),
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

  Widget _buildMap(BuildContext context, HomeViewModel viewModel) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.brown[900],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        children: [
          Positioned.fill(
            child: GridView(
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.all(10),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 10,
              ),
              children: List.generate(150, (index) {
                if (index >= 140) {
                  return Container(
                    child: Text('grass with soil'),
                  );
                }

                if (index < 140) {
                  return Container(
                    child: Text('grass'),
                  );
                }

                return Container(
                  child: Text('$index'),
                );
              }),
            ),
          ),
          Positioned(
              child: Container(
            child: Text('bird'),
          )),
        ],
      ),
    );
  }

  Widget _buildBottomGround(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/grass_ground.png'),
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  Widget _buildGrass(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/grass.png'),
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  Widget _buildBird(BuildContext context, HomeViewModel viewModel) {
    log('moved: ${viewModel.birdX}, ${viewModel.birdY}');

    return Align(
      alignment: Alignment(viewModel.birdX, viewModel.birdY),
      child: Container(
        height: 30,
        width: 30,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bird_idle.png'),
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
