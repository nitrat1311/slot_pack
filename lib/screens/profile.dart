import 'package:flutter/material.dart';
import 'package:slot_package/layout.dart';
import 'package:slot_package/models/tab.dart';
import 'package:slot_package/widgets/General/tab.dart';
import 'package:slot_package/widgets/profile/profile-list.dart';
import 'package:slot_package/widgets/profile/profile-meta.dart';

List<TabItem> tabItems = [
  TabItem(name: "My Profile", child: ProfileList()),
  TabItem(name: "Activity", child: ProfileList()),
  TabItem(name: "Settings", child: ProfileList()),
];

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return (AppLayout(
      showBottomNav: true,
      currentIndex: 3,
      child: SingleChildScrollView(
        child: Column(
          children: [
            ProfileImage(),
            ProfileDetails(),
            DefaultTabController(
                length: 3,
                child: CustomTab(
                  items: tabItems,
                )),
          ],
        ),
      ),
    ));
  }
}
