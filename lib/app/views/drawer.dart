import 'package:flutter/material.dart';
import 'package:landsurvey/app/data/resources/constant_resources.dart';

import '../data/resources/color_resources.dart';

class DrawerView extends StatelessWidget {
  const DrawerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SPACING_LARGE_HEIGHT,
        SPACING_LARGE_HEIGHT,
        const DrawerHeader(),
        Expanded(
            child: Container(
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        colors: [APP_MAIN_GREEN, WHITE],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter)),
                child: DrawerBody())),
      ],
    );
  }
}

class DrawerBody extends StatelessWidget {
  const DrawerBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<DrawerBodyModel> drawerBody = <DrawerBodyModel>[
      DrawerBodyModel(
        title: 'Home',
        isSelected: false,
        onTap: () => {},
      ),
      DrawerBodyModel(
        title: 'Dashboard',
        isSelected: false,
        onTap: () => {},
      ),
      DrawerBodyModel(
        title: 'Services',
        isSelected: false,
        onTap: () => {},
      ),
      DrawerBodyModel(
        title: 'About',
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
          return DrawerPages(drawerBody: drawerBody, i: i);
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
        title: Text(
          _drawerBody[i].title,
          style: h3_light(context)?.copyWith(color: WHITE),
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
      );
}

class DrawerBodyModel {
  final String title;
  final bool isSelected;
  final Function()? onTap;
  DrawerBodyModel({
    required this.title,
    required this.isSelected,
    required this.onTap,
  });
}
