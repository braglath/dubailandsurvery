import 'package:flutter/material.dart';
import 'package:landsurvey/app/data/resources/constant_resources.dart';

import '../data/resources/image_resources.dart';

class HeaderImage extends StatelessWidget {
  const HeaderImage({super.key});

  @override
  Widget build(BuildContext context) => SizedBox(
        width: double.infinity,
        height: deviceHeight(context) / 3,
        child: Image.asset(
          Assets.headerImage,
          fit: BoxFit.cover,
        ),
      );
}
