import 'package:flutter/material.dart';
import 'package:landsurvey/app/data/extensions/device_platform.dart';
import 'package:landsurvey/app/data/responsive/dimensions.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget desktopBody,mobileBody;
  const ResponsiveLayout(
      {super.key,
      required this.desktopBody,
      required this.mobileBody});

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
