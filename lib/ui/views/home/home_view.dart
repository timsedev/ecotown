import 'dart:developer';

import 'package:ecotown/core/models/building.dart';
import 'package:ecotown/ui/views/widgets/ground.dart';
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
            child: Background(child: _buildMap(context, viewModel)),
          ),
          // controller
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
          const Positioned.fill(
            child: Ground(),
          ),
          // build buildings
          Positioned.fill(
            child: _buildBuildings(context, viewModel),
          ),
          Positioned(
            child: _buildBird(context, viewModel),
          ),
        ],
      ),
    );
  }

  Widget _buildBuildings(BuildContext context, HomeViewModel viewModel) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(10),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 5,
      ),
      itemBuilder: (context, index) {
        final building = viewModel.buildingsMap![index];
        if (building == null) return Container();
        return _buildSingleBuilding(building);
      },
      itemCount: viewModel.buildingsMap!.length,
    );
  }

  Widget _buildSingleBuilding(Building building) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(building.image),
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
