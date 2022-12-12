import 'package:flutter/material.dart';
import 'package:landsurvey/app/data/responsive/dimensions.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget mobileBody, desktopBody;
  const ResponsiveLayout(
      {super.key, required this.mobileBody, required this.desktopBody});

  @override
  Widget build(BuildContext context) => LayoutBuilder(
          builder: ((BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth < Dimensions.mobileWidth) {
          return mobileBody;
        } else {
          return desktopBody;
        }
      }));
}
