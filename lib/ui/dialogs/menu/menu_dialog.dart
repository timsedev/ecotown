import 'package:flutter/material.dart';
import 'package:ecotown/ui/common/app_colors.dart';
import 'package:ecotown/ui/common/ui_helpers.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'menu_dialog_model.dart';

class MenuDialog extends StackedView<MenuDialogModel> {
  final DialogRequest request;
  final Function(DialogResponse) completer;

  const MenuDialog({
    Key? key,
    required this.request,
    required this.completer,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    MenuDialogModel viewModel,
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  request.data['name'] as String,
                  style: TextStyle(
                    color: Colors.green[900],
                    fontSize: 24,
                    fontFamily: 'Yoster',
                  ),
                ),
                GestureDetector(
                  onTap: viewModel.toggleShowDescription,
                  child: Icon(
                    Icons.help,
                    size: 20,
                    color: Colors.grey[400],
                  ),
                ),
              ],
            ),
            AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              height: viewModel.showDescription ? 100 : 0,
              margin: viewModel.showDescription
                  ? const EdgeInsets.only(top: 10)
                  : EdgeInsets.zero,
              child: Text(
                request.data['description'] as String,
              ),
            ),
            verticalSpaceMedium,
            Image.asset(
              request.data['image-path'] as String,
              scale: 0.5,
            ),
            verticalSpaceMedium,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            'assets/images/up.png',
                            scale: 2,
                          ),
                        ),
                        horizontalSpaceTiny,
                        Text(
                          'Upgrade',
                          style: TextStyle(
                            color: Colors.green[900],
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                horizontalSpaceMedium,
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            'assets/images/hatchet.png',
                            scale: 2,
                          ),
                        ),
                        horizontalSpaceTiny,
                        Text(
                          'Demolish',
                          style: TextStyle(
                            color: Colors.red[900],
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  MenuDialogModel viewModelBuilder(BuildContext context) => MenuDialogModel();
}
