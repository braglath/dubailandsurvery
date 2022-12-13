import 'package:flutter/material.dart';
import 'package:landsurvey/app/views/charts/bar_chart.dart';

import '../../../data/resources/color_resources.dart';
import '../../../data/resources/constant_resources.dart';
import '../../../data/responsive/desktop_body.dart';
import '../../../data/responsive/mobile_body.dart';
import '../../../data/responsive/responsive_layout.dart';
import '../../../views/app_bar/common_appbar.dart';
import '../../../views/charts/line_chart.dart';
import '../../../views/header_image.dart';
import '../../../views/header_text.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) => ResponsiveLayout(
      mobileBody: MobileBody(
        body: Column(
          children: const [
            HeaderImage(),
            SPACING_MEDIUM_HEIGHT,
            HeaderText(),
            SPACING_LARGE_HEIGHT,
            TotalPropertySale(),
            SPACING_MEDIUM_HEIGHT,
            LineChartView(),
            SPACING_MEDIUM_HEIGHT,
            BarChartView(),
            SPACING_MEDIUM_HEIGHT,
          ],
        ),
      ),
      desktopBody: DesktopBody(
        body: Column(
          children: const [
            HeaderImage(),
            SPACING_MEDIUM_HEIGHT,
            HeaderText(),
            SPACING_LARGE_HEIGHT,
            TotalPropertySale(),
            SPACING_MEDIUM_HEIGHT,
            LineChartView(),
            SPACING_MEDIUM_HEIGHT,
            BarChartView(),
            SPACING_MEDIUM_HEIGHT,
          ],
        ),
      ));
}

class TotalPropertySale extends StatelessWidget {
  const TotalPropertySale({super.key});

  @override
  Widget build(BuildContext context) => Column(
        mainAxisSize: MIN,
        mainAxisAlignment: MAIN_AXIS_CENTER,
        children: [
          Text('Total Property Sale Transactions', style: h4_light(context)),
          SPACING_SMALL_HEIGHT,
          Text(
            '5,770',
            style: h1(context)?.copyWith(color: APP_MAIN_GREEN, fontSize: 42),
          ),
        ],
      );
}
