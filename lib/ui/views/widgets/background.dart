import 'package:animated_background/animated_background.dart';
import 'package:flutter/material.dart';

class Background extends StatefulWidget {
  final Widget child;
  const Background({super.key, required this.child});

  @override
  State<Background> createState() => _BackgroundState();
}

class _BackgroundState extends State<Background> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: double.infinity,
      child: AnimatedBackground(
        behaviour: SpaceBehaviour(),
        vsync: this,
        child: Align(
          alignment: Alignment.center,
          child: Container(
            margin:
                const EdgeInsets.only(top: 30, left: 30, right: 30, bottom: 50),
            height: 730,
            width: 400,
            // add shadow bellow
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 1,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: widget.child,
          ),
        ),
      ),
    );
  }
}
