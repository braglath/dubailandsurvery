import 'package:backdrop/backdrop.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:landsurvey/app/data/resources/constant_resources.dart';
import 'package:landsurvey/app/views/hover_animations/hover_text_button.dart';

import '../data/resources/color_resources.dart';
import 'app_bar/cubit/app_bar_cubit.dart';

class DrawerView extends StatelessWidget {
  const DrawerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return Column(
        children: [
          SPACING_LARGE_HEIGHT,
          const DrawerHeader(),
          Expanded(
              child: Container(
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          colors: [APP_MAIN_GREEN, WHITE],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter)),
                  child: const DrawerBody())),
        ],
      );
    });
  }
}

class DrawerBody extends StatelessWidget {
  const DrawerBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentPageState = BlocProvider.of<AppBarCubit>(context);

    final List<DrawerBodyModel> drawerBody = <DrawerBodyModel>[
      DrawerBodyModel(
          title: 'Home',
          style: currentPageState.state.currentPage == 'home'
              ? h3_light(context)?.copyWith(
                  color: APP_DARK_GREY,
                  fontSize: 26,
                  fontWeight: FontWeight.bold)
              : h3_light(context)?.copyWith(color: WHITE),
          isSelected: false,
          onTap: () {
            BlocProvider.of<AppBarCubit>(context)
                .changePage(context, pageName: 'home');
          }),
      DrawerBodyModel(
        title: 'Dashboard',
        style: currentPageState.state.currentPage == 'dashboard'
            ? h3_light(context)?.copyWith(
                color: APP_DARK_GREY, fontSize: 26, fontWeight: FontWeight.bold)
            : h3_light(context)?.copyWith(color: WHITE),
        isSelected: false,
        onTap: () => BlocProvider.of<AppBarCubit>(context)
            .changePage(context, pageName: 'dashboard'),
      ),
      DrawerBodyModel(
        title: 'Services',
        style: currentPageState.state.currentPage == 'services'
            ? h3_light(context)?.copyWith(
                color: APP_DARK_GREY, fontSize: 26, fontWeight: FontWeight.bold)
            : h3_light(context)?.copyWith(color: WHITE),
        isSelected: false,
        onTap: () => {},
      ),
      DrawerBodyModel(
        title: 'API',
        style: currentPageState.state.currentPage == 'api'
            ? h3_light(context)?.copyWith(
                color: APP_DARK_GREY, fontSize: 26, fontWeight: FontWeight.bold)
            : h3_light(context)?.copyWith(color: WHITE),
        isSelected: false,
        onTap: () => {},
      ),
      DrawerBodyModel(
        title: 'About',
        style: currentPageState.state.currentPage == 'about'
            ? h3_light(context)?.copyWith(
                color: APP_DARK_GREY, fontSize: 26, fontWeight: FontWeight.bold)
            : h3_light(context)?.copyWith(color: WHITE),
        isSelected: false,
        onTap: () => {},
      ),
    ];
    return ListView.builder(
        cacheExtent: 9999,
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        itemCount: drawerBody.length,
        itemBuilder: (context, i) {
          return HoverTextButton(
              child: DrawerPages(drawerBody: drawerBody, i: i));
        });
  }
}

class DrawerPages extends StatelessWidget {
  const DrawerPages(
      {Key? key, required List<DrawerBodyModel> drawerBody, required int i})
      : _drawerBody = drawerBody,
        i = i,
        super(key: key);

  final List<DrawerBodyModel> _drawerBody;
  final int i;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: APP_LIGHT_GREEN,
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 25),
        horizontalTitleGap: 0,
        //? as we are adding login on top we have to minus 1 on index
        onTap: _drawerBody[i].onTap,
        title: Center(
          child: Text(
            _drawerBody[i].title,
            style: _drawerBody[i].style,
          ),
        ),
      ),
    );
  }
}

class DrawerHeader extends StatelessWidget {
  const DrawerHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 150,
      color: APP_MAIN_GREEN,
      padding: const EdgeInsets.only(top: 25),
      child: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CROSS_AXIS_CENTER,
            children: [
              NavProfileImage(),
              SPACING_MEDIUM_WIDTH,
              NavUserName(),
              SPACING_VVSMALL_HEIGHT,
              GestureDetector(
                onTap: () {},
                child: Text(
                  'Manage Profile',
                  style: h4_dark(context)?.copyWith(color: WHITE),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NavUserName extends StatelessWidget {
  const NavUserName({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Text(
        'my username',
        style: h3_dark(context)?.copyWith(color: WHITE),
        overflow: TextOverflow.ellipsis,
      );
}

class NavProfileImage extends StatelessWidget {
  const NavProfileImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => const CircleAvatar(
        radius: 35,
        backgroundColor: WHITE,
        child: Icon(
          Icons.person,
          color: APP_DARK_GREY,
        ),
      );
}

class DrawerBodyModel {
  final String title;
  final TextStyle? style;
  final bool isSelected;
  final Function()? onTap;
  DrawerBodyModel({
    required this.title,
    required this.style,
    required this.isSelected,
    required this.onTap,
  });
}
