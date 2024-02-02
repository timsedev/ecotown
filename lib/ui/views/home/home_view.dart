import 'dart:developer';

import 'package:ecotown/core/models/ground.dart';
import 'package:ecotown/ui/views/widgets/background.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildDPad(context, viewModel),
                _buildActionButtons(context, viewModel),
              ],
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
            child: Ground(),
          ),
          Positioned(
            child: _buildBird(context, viewModel),
          ),
          // build buildings
          // ..._buildBuildings(context, viewModel),
        ],
      ),
    );
  }

  // List<Widget> _buildBuildings(BuildContext context, HomeViewModel viewModel) {

  // }

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

  Widget _buildActionButtons(BuildContext context, HomeViewModel viewModel) {
    return Container(
      margin: const EdgeInsets.only(
        right: 40,
        bottom: 20,
      ),
      color: Colors.transparent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          GestureDetector(
            onTap: viewModel.hitA,
            child: Container(
              height: 60,
              width: 60,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: Text(
                'A',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          GestureDetector(
            onTap: viewModel.hitB,
            child: Container(
              height: 60,
              width: 60,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: Text(
                'B',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
