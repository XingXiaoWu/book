import 'package:flutter/material.dart';

class NoGlowScrollBehavior extends ScrollBehavior{
  const NoGlowScrollBehavior();

  @override
  Widget buildViewportChrome(BuildContext context, Widget child, AxisDirection axisDirection) => child;
}
// class NoGlowScrollBehavior extends ScrollBehavior {
//   const NoGlowScrollBehavior();

//   @override
//   Widget buildViewportChrome(BuildContext _, Widget child, AxisDirection __) =>
//       child;
// }