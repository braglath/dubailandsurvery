import 'package:flutter/material.dart';

class DesktopBody extends StatelessWidget {
  final Widget body;
  final PreferredSizeWidget appBar;

  const DesktopBody({
    super.key,
    required this.body,
    required this.appBar,
  });

  @override
  Widget build(BuildContext context) => Scaffold(
        extendBodyBehindAppBar: true,
        appBar: appBar,
        body: body,
      );
}
