import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_2/app/components/colapseItem.dart';
import 'package:flutter_2/app/tabs/homeTab.dart';
import 'package:flutter_2/app/tabs/usersTab.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:expandable/expandable.dart';

import 'components/custom_menu_icon_button.dart';
import 'components/side_menu.dart';
import 'components/user_profile.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 2, initialIndex: 0);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResponsiveBuilder(
        builder: (context, sizingInformation) {
          if (sizingInformation.isDesktop) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SideMenu(tabController: _tabController),
                //RETIFICAR AQUI
                Expanded(
                  child: TabBarView(
                      //  physics: NeverScrollableScrollPhysics(),
                      controller: _tabController,
                      children: [
                        HomeTab(),
                        UserTab(),
                      ]),
                )
              ],

              //Outras Tabs
            );
          }

          if (sizingInformation.isMobile) {
            return Text("Is Mobile");
          }
          // if (sizingInformation.isTablet) {
          //   return Text("Is Tablet :)");
          // }

          return Text("Default");
        },
      ),
    );
  }
}

class SalesData {
  SalesData(this.year, this.sales);
  final String year;
  final double sales;
}
