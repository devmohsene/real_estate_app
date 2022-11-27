import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:real_estate_app/utils/constants.dart';
import 'package:timeline_tile/timeline_tile.dart';

import '../custom/border_box.dart';
import '../src/showcase_timeline.dart';
import '../utils/widget_functions.dart';

class MainleveeTimelineScreen extends StatelessWidget {
  const MainleveeTimelineScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final ThemeData themeData = Theme.of(context);
    final double padding = 25;
    final sidePadding = EdgeInsets.symmetric(horizontal: padding);
    return SafeArea(
      child: Scaffold(
        body: Container(
            width: size.width,
            height: size.height,
            child: Stack(
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    addVerticalSpace(padding),
                    Padding(
                      padding: sidePadding,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          BorderBox(
                              height: 50,
                              width: 50,
                              child: Icon(
                                Icons.menu,
                                color: COLOR_BLACK,
                              )),
                          BorderBox(
                              height: 50,
                              width: 50,
                              child: Icon(
                                Icons.settings,
                                color: COLOR_BLACK,
                              ))
                        ],
                      ),
                    ),
                    addVerticalSpace(padding),
                    Padding(
                      padding: sidePadding,
                      child: Text(
                        "Suivi Dossier",
                        style: themeData.textTheme.bodyText2,
                      ),
                    ),
                    addVerticalSpace(10),
                    Padding(
                      padding: sidePadding,
                      child: Text(
                        "Suivi Dossier",
                        style: themeData.textTheme.headline1,
                      ),
                    ),
                    Padding(
                      padding: sidePadding,
                      child: Divider(
                        height: padding,
                        color: COLOR_GREY,
                      ),
                    ),
                    addVerticalSpace(10),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                    ),
                    addVerticalSpace(10),
                    Expanded(
                        child: Padding(
                      padding: sidePadding,
                      child: ListView.builder(
                        itemCount: examples.length,
                        itemBuilder: (BuildContext context, int index) {
                          final example = examples[index];

                          return TimelineTile(
                            alignment: TimelineAlign.manual,
                            lineXY: 0.1,
                            isFirst: index == 0,
                            isLast: index == examples.length - 1,
                            indicatorStyle: IndicatorStyle(
                              color: COLOR_GREY,
                              width: 40,
                              height: 40,
                              indicator: _IndicatorExample(number: ''),
                              drawGap: true,
                            ),
                            beforeLineStyle: LineStyle(
                              color: COLOR_BLACK,
                            ),
                            endChild: GestureDetector(
                              child: _RowExample(example: example),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute<ShowcaseTimeline>(
                                    builder: (_) =>
                                        ShowcaseTimeline(example: example),
                                  ),
                                );
                              },
                            ),
                          );
                        },
                      ),
                    ))
                  ],
                ),
                // BottomBarScreen(
                //   tabIconsList: tabIconsList,
                //   addClick: () {},
                //   changeIndex: (int index) {
                //     if (index == 0 || index == 2) {
                //       animationController?.reverse().then<dynamic>((data) {
                //         if (!mounted) {
                //           return;
                //         }
                //         setState(() {
                //           tabBody = MyDiaryScreen(
                //               animationController: animationController);
                //         });
                //       });
                //     } else if (index == 1 || index == 3) {
                //       animationController?.reverse().then<dynamic>((data) {
                //         if (!mounted) {
                //           return;
                //         }
                //         setState(() {
                //           tabBody = TrainingScreen(
                //               animationController: animationController);
                //         });
                //       });
                //     }
                //   },
                // ),
              ],
            )),
      ),
    );
  }
}

class _IndicatorExample extends StatelessWidget {
  const _IndicatorExample({Key? key, required this.number}) : super(key: key);

  final String number;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.fromBorderSide(
          BorderSide(
            color: COLOR_BLACK,
            width: 4,
          ),
        ),
      ),
      child: Center(
        child: Text(
          number,
          style: const TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}

class _RowExample extends StatelessWidget {
  const _RowExample({Key? key, required this.example, this.disabled = false})
      : super(key: key);

  final Example example;
  final bool disabled;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: <Widget>[
          Opacity(
            child: Image.asset('assets/delivery/order_placed.png', height: 50),
            opacity: disabled ? 0.5 : 1,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              example.name,
              style: GoogleFonts.jura(
                color: COLOR_BLACK,
                fontSize: 18,
              ),
            ),
          ),
          const Icon(
            Icons.navigate_next,
            color: COLOR_BLACK,
            size: 26,
          ),
        ],
      ),
    );
  }
}
