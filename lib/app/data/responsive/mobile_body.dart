import 'package:backdrop/backdrop.dart';
import 'package:flutter/material.dart';
import 'package:landsurvey/app/views/drawer.dart';

class MobileBody extends StatelessWidget {
  final Widget body;
  final PreferredSizeWidget appBar;
  const MobileBody({
    super.key,
    required this.body,
    required this.appBar,
  });

  @override
  Widget build(BuildContext context) => BackdropScaffold(
      extendBodyBehindAppBar: true,
      appBar: appBar,
      stickyFrontLayer: true,
      backLayer: const DrawerView(),
      frontLayer: body);
}
