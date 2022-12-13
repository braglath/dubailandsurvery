import 'package:backdrop/backdrop.dart';
import 'package:flutter/material.dart';
import 'package:landsurvey/app/data/resources/color_resources.dart';
import 'package:landsurvey/app/views/hover_animations/hover_text_button.dart';

import '../data/resources/constant_resources.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final bool isMobile;
  const CommonAppBar({super.key, this.title, required this.isMobile});

  static final _appBar = AppBar();
  @override
  Size get preferredSize => _appBar.preferredSize;

  @override
  Widget build(BuildContext context) => AppBar(
        centerTitle: false,
        title: title == null
            ? RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Real Estate ',
                      style: h3_dark(context)?.copyWith(color: WHITE),
                    ),
                    TextSpan(
                      text: 'Analytics',
                      style: h3_light(context)?.copyWith(
                          color: WHITE, fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
              )
            : Text(title!),
        actions: isMobile
            ? [
                BackdropToggleButton(
                  icon: AnimatedIcons.close_menu,
                )
              ]
            : [
                HoverTextButton(
                  child: TextButton(
                      onPressed: () {},
                      child: Text(
                        'Home',
                        style: h4_light(context)?.copyWith(
                            color: WHITE, fontWeight: FontWeight.normal),
                      )),
                ),
                HoverTextButton(
                  child: TextButton(
                      onPressed: () {},
                      child: Text(
                        'Dashboard',
                        style: h4_light(context)?.copyWith(
                            color: WHITE, fontWeight: FontWeight.normal),
                      )),
                ),
                HoverTextButton(
                  child: TextButton(
                      onPressed: () {},
                      child: Text(
                        'Services',
                        style: h4_light(context)?.copyWith(
                            color: WHITE, fontWeight: FontWeight.normal),
                      )),
                ),
                HoverTextButton(
                  child: TextButton(
                      onPressed: () {},
                      child: Text(
                        'About',
                        style: h4_light(context)?.copyWith(
                            color: WHITE, fontWeight: FontWeight.normal),
                      )),
                ),
              ],
      );
}
