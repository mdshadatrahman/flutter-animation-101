import 'dart:math' show pi;
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class RotationWithHooks extends HookWidget {
  const RotationWithHooks({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = useAnimationController(duration: const Duration(seconds: 2))..repeat();
    final animation = useAnimation(Tween(begin: 0.0, end: pi * 2).animate(controller));
    return Scaffold(
      backgroundColor: Colors.black12,
      body: Center(
        child: AnimatedBuilder(
            animation: controller,
            builder: (context, child) {
              return Transform(
                alignment: Alignment.center,
                transform: Matrix4.identity()..rotateZ(animation),
                child: Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 7,
                        spreadRadius: 5,
                        offset: const Offset(2, 2),
                        color: Colors.black.withOpacity(0.5),
                      )
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
