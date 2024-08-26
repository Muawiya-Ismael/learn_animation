import 'dart:math';
import 'package:flutter/animation.dart';

class SineCurve extends Curve {
  final double count;
  const SineCurve({this.count = 1});

  @override
  double transformInternal(double t) => sin(count * 2 * pi * t) * 0.5 * 0.5;

}


class ShakeCurve extends Curve {
  @override
  double transform(double t) => sin(t * pi * 2);
}