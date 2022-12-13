import 'package:landsurvey/app/views/charts/bar_chart.dart';

import '../home_imports.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

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
          TweenAnimationBuilder(
              curve: Curves.fastOutSlowIn,
              duration: const Duration(seconds: 2),
              tween: Tween(begin: 0.0, end: 5770.0),
              onEnd: () {},
              builder: (BuildContext context, double value, Widget? child) {
                return Text(value.toInt().toString(), style: h4_light(context));
              }),
        ],
      );
}
