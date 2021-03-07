import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_2/components/colapseItem.dart';
import 'package:flutter_2/tabs/homeTab.dart';
import 'package:flutter_2/tabs/usersTab.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:expandable/expandable.dart';

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
                Container(
                  color: Color(0xFF1e282c),
                  width: 240,
                  child: Theme(
                    data: ThemeData(highlightColor: Colors.red),
                    child: Scrollbar(
                      isAlwaysShown: true,
                      child: ListView(
                        children: [
                          SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(30),
                                  child: Image.network(
                                    "https://random.dog/3f62f2c1-e0cb-4077-8cd9-1ca76bfe98d5.jpg",
                                    width: 50,
                                    height: 50,
                                  ),
                                ),
                                SizedBox(
                                  width: 12,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Celestino Lopes",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.circle,
                                          color: Colors.green,
                                          size: 9,
                                        ),
                                        SizedBox(
                                          width: 4,
                                        ),
                                        Text(
                                          "Online",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 11,
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              children: [
                                Container(
                                  child: Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(2),
                                        color: Colors.white,
                                      ),
                                      height: 35,
                                      padding: const EdgeInsets.only(
                                          left: 10,
                                          right: 10,
                                          bottom: 10,
                                          top: 8),
                                      child: TextField(
                                        decoration: InputDecoration(
                                          hintStyle: TextStyle(
                                            fontSize: 15,
                                          ),
                                          hintText: "Search",
                                          border: InputBorder.none,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                _tabController.animateTo((0));
                              });
                            },
                            child: Container(
                              height: 40,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 5,
                              ),
                              width: double.infinity,
                              color: Color(0xFF1a2226),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.home,
                                    size: 18,
                                    color: Colors.white,
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    "Início",
                                    style: TextStyle(
                                      color: Colors.grey[400],
                                      fontSize: 13,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            height: 50,
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            width: double.infinity,
                            color: Color(0xFF1a2226),
                            child: Row(
                              children: [
                                Text(
                                  "Menu principal",
                                  style: TextStyle(
                                    color: Colors.grey[400],
                                    fontSize: 13,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            color: Color(0xFF1e282c),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 5,
                            ),
                            child: ExpandablePanel(
                                theme: ExpandableThemeData(
                                  iconColor: Colors.white,
                                  iconSize: 14,
                                ),
                                header: Container(
                                  decoration: BoxDecoration(
                                    border: Border(
                                      left: BorderSide(
                                        color: Colors.red[800],
                                        width: 2,
                                      ),
                                    ),
                                  ),
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        _tabController.animateTo((0));
                                      });
                                    },
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          width: 3,
                                        ),
                                        Icon(
                                          Icons.dashboard,
                                          color: Colors.white,
                                          size: 18,
                                        ),
                                        SizedBox(
                                          width: 7,
                                        ),
                                        Text(
                                          "Dashboard",
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                collapsed: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 10,
                                    vertical: 5,
                                  ),
                                  child: Column(
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            _tabController.animateTo((1));
                                          });
                                        },
                                        child: ColaspeItem(
                                            label: "Usuarios",
                                            icon: Icons.people),
                                      ),
                                      ColaspeItem(
                                          label: "Documentos",
                                          icon: Icons.credit_card),
                                      ColaspeItem(
                                        label: "Reivindicações",
                                        icon: Icons.bar_chart,
                                      ),
                                    ],
                                  ),
                                )),
                          ),
                          InkWell(
                            child: Container(
                              color: Color(0xFF1e282c),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 5,
                              ),
                              child: ExpandablePanel(
                                  theme: ExpandableThemeData(
                                    iconColor: Colors.white,
                                    iconSize: 14,
                                  ),
                                  header: Container(
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          width: 3,
                                        ),
                                        Icon(
                                          Icons.settings,
                                          color: Colors.white,
                                          size: 18,
                                        ),
                                        SizedBox(
                                          width: 7,
                                        ),
                                        Text(
                                          "Definições",
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  collapsed: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 10,
                                      vertical: 5,
                                    ),
                                    child: Column(
                                      children: [
                                        ColaspeItem(
                                            label: "Tema", icon: Icons.palette),
                                        ColaspeItem(
                                            label: "Idioma",
                                            icon: Icons.translate),
                                        ColaspeItem(
                                          label: "Acessibilidade",
                                          icon: Icons.accessible,
                                        ),
                                      ],
                                    ),
                                  )),
                            ),
                          ),
                          InkWell(
                            child: Container(
                              height: 50,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              width: double.infinity,
                              color: Color(0xFF1a2226),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.help,
                                    size: 18,
                                    color: Colors.white,
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    "Ajuda",
                                    style: TextStyle(
                                      color: Colors.grey[400],
                                      fontSize: 13,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          InkWell(
                            child: Container(
                              height: 50,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              width: double.infinity,
                              color: Color(0xFF1a2226),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.info,
                                    size: 18,
                                    color: Colors.white,
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    "Sobre nós",
                                    style: TextStyle(
                                      color: Colors.grey[400],
                                      fontSize: 13,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
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
          if (sizingInformation.isTablet) {
            return Text("Is Tablet :)");
          }

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
