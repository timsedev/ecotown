import 'package:ecotown/ui/common/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:ecotown/ui/common/app_colors.dart';
import 'package:ecotown/ui/common/ui_helpers.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'build_dialog_model.dart';

const double _graphicSize = 60;

class BuildDialog extends StackedView<BuildDialogModel> {
  final DialogRequest request;
  final Function(DialogResponse) completer;

  const BuildDialog({
    Key? key,
    required this.request,
    required this.completer,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    BuildDialogModel viewModel,
    Widget? child,
  ) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      backgroundColor: Colors.grey[100],
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Build Something New!',
              style: TextStyle(
                color: Colors.green[900],
                fontSize: 24,
                fontFamily: 'Yoster',
              ),
            ),
            verticalSpaceMedium,
            SizedBox(
              height: 100,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: viewModel.toggleBiofuelDescription,
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: viewModel.currentlySelectingBiofuel()
                                ? Colors.green[900]!
                                : Colors.transparent,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.green[100],
                        ),
                        child: Image.asset(biofuelData['image-path'] as String),
                      ),
                    ),
                  ),
                  horizontalSpaceSmall,
                  Expanded(
                    child: GestureDetector(
                      onTap: viewModel.toggleSolarPanelDescription,
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.green[100],
                          border: Border.all(
                            color: viewModel.currentlySelectingSolarPanel()
                                ? Colors.green[900]!
                                : Colors.transparent,
                            width: 2,
                          ),
                        ),
                        child:
                            Image.asset(solarPanelData['image-path'] as String),
                      ),
                    ),
                  ),
                  horizontalSpaceSmall,
                  Expanded(
                    child: GestureDetector(
                      onTap: viewModel.toggleTimberMillDescription,
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.green[100],
                          border: Border.all(
                            color: viewModel.currentlySelectingTimberMill()
                                ? Colors.green[900]!
                                : Colors.transparent,
                            width: 2,
                          ),
                        ),
                        child:
                            Image.asset(timberMillData['image-path'] as String),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              height: viewModel.showDescription ? 100 : 0,
              margin: viewModel.showDescription
                  ? const EdgeInsets.only(top: 10)
                  : EdgeInsets.zero,
              child: Text(viewModel.description),
            ),
            verticalSpaceSmall,
            SizedBox(
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      viewModel.buildBuilding(completer);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.green[900],
                      ),
                      child: Text(
                        'Build',
                        style: TextStyle(
                          color: Colors.green[100],
                          fontSize: 20,
                          fontFamily: 'Yoster',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  BuildDialogModel viewModelBuilder(BuildContext context) => BuildDialogModel();
}
