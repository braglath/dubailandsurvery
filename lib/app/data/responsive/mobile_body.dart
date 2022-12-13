import 'package:backdrop/backdrop.dart';
import 'package:flutter/material.dart';
import 'package:landsurvey/app/views/drawer.dart';

class MobileBody extends StatefulWidget {
  final Widget body;
  final PreferredSizeWidget appBar;
  const MobileBody({
    super.key,
    required this.body,
    required this.appBar,
  });

  @override
  State<MobileBody> createState() => _MobileBodyState();
}

class _MobileBodyState extends State<MobileBody> {
  bool isShowingBackLayer = false;
  @override
  Widget build(BuildContext context) => BackdropScaffold(
      extendBodyBehindAppBar: true,
      appBar: widget.appBar,
      stickyFrontLayer: true,
      backLayer: const DrawerView(),
      frontLayerShape: RoundedRectangleBorder(
          borderRadius: isShowingBackLayer
              ? const BorderRadius.only(
                  topLeft: Radius.circular(16), topRight: Radius.circular(16))
              : BorderRadius.zero),
      onBackLayerRevealed: () => setState(() => isShowingBackLayer = true),
      onBackLayerConcealed: (() => setState(() => isShowingBackLayer = false)),
      frontLayer: widget.body);
}
