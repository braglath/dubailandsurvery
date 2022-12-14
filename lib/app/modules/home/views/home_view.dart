import 'package:custom_date_range_picker/custom_date_range_picker.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../../data/resources/image_resources.dart';
import '../../../views/common_footer.dart';
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
            // SfDateRangePicker(
            //   view: DateRangePickerView.year,
            //   selectionMode: DateRangePickerSelectionMode.range,
            //   showActionButtons: true,
            // ),
            TotalProperty(),
            SPACING_MEDIUM_HEIGHT,
            Top5Areas(isMobile: true),
            SPACING_MEDIUM_HEIGHT,
            LineChart2View(),
            SPACING_MEDIUM_HEIGHT,
            BarChartView(),
            SPACING_MEDIUM_HEIGHT,
            CommonFooter(),
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
            TotalProperty(),
            SPACING_MEDIUM_HEIGHT,
            Top5Areas(isMobile: false),
            SPACING_MEDIUM_HEIGHT,
            LineChart2View(),
            SPACING_MEDIUM_HEIGHT,
            BarChartView(),
            SPACING_MEDIUM_HEIGHT,
            CommonFooter(),
          ],
        ),
      ));
}

class TotalProperty extends StatelessWidget {
  const TotalProperty({super.key});

  @override
  Widget build(BuildContext context) {
    final List<PropertyTypeModel> propertyTypeList = [
      PropertyTypeModel(propertyType: 'Villa', totalCount: 234),
      PropertyTypeModel(propertyType: 'Land', totalCount: 456),
      PropertyTypeModel(propertyType: 'Building', totalCount: 765),
      PropertyTypeModel(propertyType: 'Unit', totalCount: 890),
    ];
    return Container(
      height: 225,
      // width: 400,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), color: INPUT_FIELD_GREY),
      child: Column(
        mainAxisSize: MIN,
        mainAxisAlignment: MAIN_AXIS_CENTER,
        children: [
          Text('Total Property',
              style: h4_light(context)?.copyWith(
                  fontWeight: FontWeight.bold, color: APP_DARK_GREY_OPACITY_5)),
          SPACING_VSMALL_HEIGHT,
          TweenAnimationBuilder(
              curve: Curves.fastOutSlowIn,
              duration: const Duration(seconds: 2),
              tween: Tween(begin: 0.0, end: 5770.0),
              onEnd: () {},
              builder: (BuildContext context, double value, Widget? child) {
                return Text(value.toInt().toString(),
                    style: h1(context)?.copyWith(color: APP_MAIN_GREEN));
              }),
          SPACING_MEDIUM_HEIGHT,
          Expanded(
            child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: propertyTypeList.length,
                itemBuilder: (ctx, i) {
                  return HoverTextButton(
                    child: PropertyTypeCount(
                        propertyTypeModel: propertyTypeList[i]),
                  );
                }),
          )
        ],
      ),
    );
  }
}

class PropertyTypeCount extends StatelessWidget {
  final PropertyTypeModel propertyTypeModel;
  const PropertyTypeCount({super.key, required this.propertyTypeModel});

  @override
  Widget build(BuildContext context) => SizedBox(
        width: 100,
        height: 50,
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CROSS_AXIS_CENTER,
                mainAxisSize: MIN,
                children: [
                  Text(propertyTypeModel.propertyType,
                      style: h4_dark(context)?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: APP_DARK_GREY_OPACITY_5)),
                  SPACING_VSMALL_HEIGHT,
                  Text(propertyTypeModel.totalCount.toString(),
                      style: h3_dark(context)?.copyWith(color: APP_MAIN_GREEN)),
                ],
              ),
            ),
          ),
        ),
      );
}

class PropertyTypeModel {
  final String propertyType;
  final int totalCount;
  PropertyTypeModel({required this.propertyType, required this.totalCount});
}

class Top5Areas extends StatelessWidget {
  final bool isMobile;
  const Top5Areas({super.key, required this.isMobile});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(18)),
          color: INPUT_FIELD_GREY),
      margin: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          SPACING_VSMALL_HEIGHT,
          Text('Top 5 Areas',
              style: h4_dark(context)?.copyWith(
                  fontWeight: FontWeight.bold, color: APP_DARK_GREY_OPACITY_5)),
          SPACING_VSMALL_HEIGHT,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Row(
              mainAxisSize: MIN,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichT(text1: 'Date: ', text2: DateTime.now().formatDateTime),
                SPACER,
                HoverTextButton(
                    child: TextButton(
                        onPressed: () => showCustomDateRangePicker(
                              context,
                              dismissible: true,
                              minimumDate: DateTime.now(),
                              maximumDate: DateTime(DateTime.now().year + 10),
                              // endDate: endDate,
                              // startDate: startDate,
                              onApplyClick: (start, end) {
                                // setState(() {
                                //   endDate = end;
                                //   startDate = start;
                                // });
                              },
                              onCancelClick: () {
                                // setState(() {
                                //   endDate = null;
                                //   startDate = null;
                                // });
                              },
                            ),
                        child: Text(
                          'Pick Range',
                          style: caption(context)?.copyWith(
                              color: APP_MAIN_GREEN,
                              fontWeight: FontWeight.bold),
                        )))
              ],
            ),
          ),
          SPACING_VSMALL_HEIGHT,
          Top5AreaSlider(isMobile: isMobile),
          SPACING_VSMALL_HEIGHT,
        ],
      ),
    );
  }
}

class Top5AreaSlider extends StatefulWidget {
  final bool isMobile;
  const Top5AreaSlider({super.key, required this.isMobile});

  @override
  State<Top5AreaSlider> createState() => _Top5AreaSliderState();
}

class _Top5AreaSliderState extends State<Top5AreaSlider> {
  int _current = 0;
  final CarouselController _controller = CarouselController();
  @override
  Widget build(BuildContext context) {
    final List<Widget> imageSliders = [1, 2, 3, 4, 5]
        .map((item) => widget.isMobile
            ? const IndividualLandMobile()
            : const IndividualLandDesktop())
        .toList();
    return Column(
      children: [
        CarouselSlider(
            carouselController: _controller,
            options: CarouselOptions(
                scrollPhysics: const BouncingScrollPhysics(),
                height: 450.0,
                enableInfiniteScroll: false,
                autoPlay: false,
                enlargeCenterPage: true,
                onPageChanged: (index, reason) {
                  setState(() {
                    _current = index;
                  });
                }),
            items: imageSliders),
        SPACING_VSMALL_HEIGHT,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: imageSliders.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => _controller.animateToPage(entry.key),
              child: Container(
                width: 12.0,
                height: 12.0,
                margin:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: (Theme.of(context).brightness == Brightness.dark
                            ? Colors.white
                            : Colors.black)
                        .withOpacity(_current == entry.key ? 0.9 : 0.4)),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}

class IndividualLandMobile extends StatelessWidget {
  const IndividualLandMobile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
            child: Column(
          mainAxisSize: MIN,
          crossAxisAlignment: CROSS_AXIS_START,
          children: [
            const RichT(text1: 'Region: ', text2: 'Property region comes here'),
            SPACING_VSMALL_HEIGHT,
            const RichT(
                text1: 'Description: ',
                text2: 'This will be property description'),
            SPACING_VSMALL_HEIGHT,
            const Padding(
                padding: EdgeInsets.all(8.0), child: LineChart1View()),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              SmallCardView(
                  smallCardModel:
                      SmallCardModel(text: 'Total Transactions', count: '385')),
              SmallCardView(
                  smallCardModel:
                      SmallCardModel(text: 'Total Worth', count: '937.72M'))
            ]),
            SPACING_VSMALL_HEIGHT,
          ],
        )),
      ),
    );
  }
}

class IndividualLandDesktop extends StatelessWidget {
  const IndividualLandDesktop({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
            child: Column(
          mainAxisSize: MIN,
          crossAxisAlignment: CROSS_AXIS_CENTER,
          children: [
            RichT(text1: 'Region: ', text2: 'Property region comes here'),
            SPACING_VSMALL_HEIGHT,
            RichT(
                text1: 'Description: ',
                text2: 'This will be property description'),
            SPACING_SMALL_HEIGHT,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MIN,
              children: [
                const Expanded(child: LineChart1View()),
                SPACING_VSMALL_WIDTH,
                Column(
                    mainAxisAlignment: MAIN_AXIS_START,
                    mainAxisSize: MIN,
                    children: [
                      SmallCardView(
                          smallCardModel: SmallCardModel(
                              text: 'Total Transactions', count: '385')),
                      SPACING_SMALL_HEIGHT,
                      SmallCardView(
                          smallCardModel: SmallCardModel(
                              text: 'Total Worth', count: '937.72M')),
                    ]),
              ],
            ),
          ],
        )),
      ),
    );
  }
}

class SmallCardModel {
  final String text;
  final String count;
  SmallCardModel({required this.text, required this.count});
}

class SmallCardView extends StatelessWidget {
  final SmallCardModel smallCardModel;
  const SmallCardView({super.key, required this.smallCardModel});

  @override
  Widget build(BuildContext context) => Container(
        width: deviceWidth(context) / 3,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            border: Border.all(width: 1)),
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisSize: MIN,
          crossAxisAlignment: CROSS_AXIS_START,
          children: [
            Text(
              smallCardModel.count,
              style: h3_dark(context)?.copyWith(color: APP_DARK_GREY),
            ),
            SPACING_VSMALL_HEIGHT,
            Text(
              smallCardModel.text,
              style: caption(context)?.copyWith(color: APP_DARK_GREY),
            )
          ],
        ),
      );
}

class RichT extends StatelessWidget {
  final String text1, text2;
  const RichT({
    super.key,
    required this.text1,
    required this.text2,
  });

  @override
  Widget build(BuildContext context) => RichText(
          text: TextSpan(children: <TextSpan>[
        TextSpan(
            text: text1,
            style: caption(context)
                ?.copyWith(color: APP_DARK_GREY_OPACITY_5, fontSize: 14)),
        TextSpan(
            text: text2,
            style: caption(context)?.copyWith(color: APP_DARK_GREY_OPACITY_5)),
      ]));
}
