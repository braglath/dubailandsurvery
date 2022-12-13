import 'package:flutter/material.dart';

import '../../views/app_bar/common_appbar.dart';

class DesktopBody extends StatefulWidget {
  final Widget body;

  const DesktopBody({
    super.key,
    required this.body,
  });

  @override
  State<DesktopBody> createState() => _DesktopBodyState();
}

class _DesktopBodyState extends State<DesktopBody> {
  late ScrollController _scrollController;
  double _scrollControllerOffset = 0.0;

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
  Widget build(BuildContext context) => Scaffold(
        extendBodyBehindAppBar: true,
        appBar: CommonAppBar(
            isMobile: false, scrollOffset: _scrollControllerOffset),
        body: SingleChildScrollView(
            controller: _scrollController,
            physics: const BouncingScrollPhysics(),
            child: widget.body),
      );
}
