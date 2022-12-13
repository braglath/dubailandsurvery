import 'package:backdrop/backdrop.dart';
import 'package:flutter/material.dart';
import 'package:landsurvey/app/views/drawer.dart';

import '../../views/app_bar/common_appbar.dart';

class MobileBody extends StatefulWidget {
  final Widget body;
  const MobileBody({
    super.key,
    required this.body,
  });

  @override
  State<MobileBody> createState() => _MobileBodyState();
}

class _MobileBodyState extends State<MobileBody> {
  late ScrollController _scrollController;
  double _scrollControllerOffset = 0.0;

  bool isShowingBackLayer = false;

  _scrollListener() =>
      setState(() => _scrollControllerOffset = _scrollController.offset);

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => BackdropScaffold(
      extendBodyBehindAppBar: true,
      appBar:
          CommonAppBar(isMobile: true, scrollOffset: _scrollControllerOffset),
      stickyFrontLayer: true,
      backLayer: const DrawerView(),
      frontLayerShape: RoundedRectangleBorder(
          borderRadius: isShowingBackLayer
              ? const BorderRadius.only(
                  topLeft: Radius.circular(16), topRight: Radius.circular(16))
              : BorderRadius.zero),
      onBackLayerRevealed: () => setState(() => isShowingBackLayer = true),
      onBackLayerConcealed: (() => setState(() => isShowingBackLayer = false)),
      frontLayer: SingleChildScrollView(
          controller: _scrollController,
          physics: const BouncingScrollPhysics(),
          child: widget.body));
}
