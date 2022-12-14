import 'package:backdrop/backdrop.dart';
import 'package:flutter/material.dart';
import 'package:landsurvey/app/data/resources/color_resources.dart';
import 'package:landsurvey/app/views/hover_animations/hover_text_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/resources/constant_resources.dart';
import '../../data/resources/image_resources.dart';
import 'cubit/app_bar_cubit.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final bool isMobile;
  final double scrollOffset;
  const CommonAppBar(
      {super.key,
      this.title,
      required this.isMobile,
      required this.scrollOffset});

  static final _appBar = AppBar();
  @override
  Size get preferredSize => _appBar.preferredSize;

  @override
  Widget build(BuildContext context) => Builder(builder: (context) {
        final currentPageState = BlocProvider.of<AppBarCubit>(context);
        return AppBar(
          backgroundColor: APP_DARK_GREY
              .withOpacity((scrollOffset / 350).clamp(0, 0.5).toDouble()),
          centerTitle: false,
          title: title == null
              ? AnimatedCrossFade(
                  alignment: Alignment.centerLeft,
                  duration: const Duration(milliseconds: 500),
                  crossFadeState:
                      (scrollOffset / 350).clamp(0, 1).toDouble() < 0.3
                          ? CrossFadeState.showFirst
                          : CrossFadeState.showSecond,
                  secondChild: SizedBox(
                      width: 50,
                      height: 50,
                      child: Image.asset(
                        Assets.logoThumbLight,
                        filterQuality: FilterQuality.high,
                        fit: BoxFit.contain,
                      )),
                  firstChild: RichText(
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
                  ),
                )
              : Text(title!),
          actions: isMobile
              ? [
                  const BackdropToggleButton(
                    icon: AnimatedIcons.close_menu,
                  )
                ]
              : [
                  HoverTextButton(
                    child: TextButton(
                        onPressed: () => currentPageState.changePage(context,
                            pageName: 'home'),
                        child: Text(
                          'Home',
                          style: h4_light(context)?.copyWith(
                              color: WHITE, fontWeight: FontWeight.normal),
                        )),
                  ),
                  HoverTextButton(
                    child: TextButton(
                        onPressed: () => currentPageState.changePage(context,
                            pageName: 'dashboard'),
                        child: Text(
                          'Dashboard',
                          style: h4_light(context)?.copyWith(
                              color: currentPageState.state.currentPage ==
                                      'dashboard'
                                  ? APP_MAIN_GREEN
                                  : WHITE,
                              fontWeight: FontWeight.normal),
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
                          'API',
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
      });
}
