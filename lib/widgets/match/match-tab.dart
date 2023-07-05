import 'package:flutter/material.dart';
import 'package:slot_package/models/tab.dart';
import 'package:slot_package/utils/responsive.dart';
import 'package:slot_package/widgets/General/tab.dart';
import 'package:slot_package/widgets/match/match-lineup.dart';
import 'package:slot_package/widgets/match/match-stats.dart';

List<TabItem> items = [
  TabItem(name: "My Profile", child: MatchStats()),
  TabItem(name: "Activity", child: MatchDetailsLineup()),
  TabItem(name: "Settings", child: MatchStats()),
];

class MatchTabController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return (DefaultTabController(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(
              top: getResponsiveHeight(context: context, height: 3),
              bottom: getResponsiveHeight(context: context, height: 3),
            ),
            child: CustomTab(
              items: items,
            ),
          ),
        ],
      ),
      length: 3,
    ));
  }
}
