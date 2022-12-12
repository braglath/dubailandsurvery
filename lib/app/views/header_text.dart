import 'package:flutter/material.dart';

import '../data/resources/constant_resources.dart';

class HeaderText extends StatelessWidget {
  final String? text;
  const HeaderText({super.key, this.text});

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 15.0),
        child: Text(
          text ?? 'Dubai Real Estate\nTransaction Overview',
          textAlign: TextAlign.center,
          style: h4_dark(context)?.copyWith(fontWeight: FontWeight.bold),
        ),
      );
}
