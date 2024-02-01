import 'dart:developer';

import 'package:ecotown/ui/views/widgets/background.dart';
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
            child: Background(child: _buildMap(context, viewModel)),
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
                  return _buildBottomGround(context);
                }

                if (index < 140) {
                  return _buildGrass(context);
                }

                return Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                  ),
                  child: Text(
                    '$index',
                  ),
                );
              }),
            ),
          ),
          Positioned(
            child: _buildBird(context, viewModel),
          ),
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

  Widget _buildDPad(BuildContext context, HomeViewModel viewModel) {
    return Container(
      margin: const EdgeInsets.only(
        left: 40,
        bottom: 20,
      ),
      color: Colors.transparent,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildButton(
              context, viewModel, viewModel.moveLeft, Icons.arrow_left_rounded),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildButton(context, viewModel, viewModel.moveUp,
                  Icons.arrow_drop_up_rounded),
              Container(
                height: 50,
              ),
              _buildButton(context, viewModel, viewModel.moveDown,
                  Icons.arrow_drop_down_rounded),
            ],
          ),
          _buildButton(context, viewModel, viewModel.moveRight,
              Icons.arrow_right_rounded),
        ],
      ),
    );
  }

  Widget _buildButton(BuildContext context, HomeViewModel viewModel,
      Function callback, IconData icon) {
    return GestureDetector(
      onTap: () => callback(once: true),
      onTapDown: (details) => callback(),
      onTapUp: (details) => viewModel.cancelTimer(),
      onPanEnd: (details) => viewModel.cancelTimer(),
      child: Container(
        height: 60,
        width: 60,
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          size: 30,
          color: Colors.black,
        ),
      ),
    );
  }
}
