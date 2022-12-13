import 'package:flutter/material.dart';

import '../data/resources/color_resources.dart';
import '../data/resources/constant_resources.dart';
import '../data/resources/image_resources.dart';
import 'hover_animations/hover_text_button.dart';

class CommonFooter extends StatelessWidget {
  const CommonFooter({super.key});

  @override
  Widget build(BuildContext context) => AspectRatio(
        aspectRatio: 16 / 6,
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              colorFilter: ColorFilter.mode(APP_DARK_GREY, BlendMode.screen),
              opacity: 0.3,
              fit: BoxFit.cover,
              image: AssetImage(
                Assets.footerImage,
              ),
            ),
          ),
          child: Column(
            mainAxisSize: MIN,
            crossAxisAlignment: CROSS_AXIS_CENTER,
            children: [
              SPACER,
              Text(
                'Real Estate data tracking made simple',
                style: h4_dark(context)?.copyWith(color: WHITE),
              ),
              SPACING_VSMALL_HEIGHT,
              Text(
                'Join over 4000+ startups already growing',
                style: caption(context)?.copyWith(color: WHITE),
              ),
              SPACING_SMALL_HEIGHT,
              Row(
                mainAxisSize: MIN,
                mainAxisAlignment: MAIN_AXIS_CENTER,
                children: [
                  HoverTextButton(
                      child: TextButton(
                          onPressed: () {},
                          child: Text(
                            'Chat to us',
                            style: caption(context)
                                ?.copyWith(color: APP_MAIN_GREEN),
                          ))),
                  HoverTextButton(
                      child: TextButton(
                          onPressed: () {},
                          child: Text('Get started',
                              style: caption(context)
                                  ?.copyWith(color: APP_MAIN_GREEN)))),
                ],
              ),
              SPACING_MEDIUM_HEIGHT,
              Row(
                mainAxisSize: MIN,
                mainAxisAlignment: MAIN_AXIS_CENTER,
                children: [
                  HoverTextButton(
                      child: TextButton(
                          onPressed: () {},
                          child: Text('Home',
                              style:
                                  caption(context)?.copyWith(color: WHITE)))),
                  HoverTextButton(
                      child: TextButton(
                          onPressed: () {},
                          child: Text('Dashboard',
                              style:
                                  caption(context)?.copyWith(color: WHITE)))),
                  HoverTextButton(
                      child: TextButton(
                          onPressed: () {},
                          child: Text('Services',
                              style:
                                  caption(context)?.copyWith(color: WHITE)))),
                  HoverTextButton(
                      child: TextButton(
                          onPressed: () {},
                          child: Text('API',
                              style:
                                  caption(context)?.copyWith(color: WHITE)))),
                  HoverTextButton(
                      child: TextButton(
                          onPressed: () {},
                          child: Text('About',
                              style:
                                  caption(context)?.copyWith(color: WHITE)))),
                ],
              ),
              SPACER,
            ],
          ),
        ),
      );
}
