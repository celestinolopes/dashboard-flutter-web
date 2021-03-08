import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

import '../../../components/colapseItem.dart';
import 'custom_menu_icon_button.dart';
import 'user_profile.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({
    Key key,
    @required TabController tabController,
  })  : _tabController = tabController,
        super(key: key);

  final TabController _tabController;

  @override
  _SideMenuState createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF1e282c),
      width: 240,
      child: Theme(
        data: ThemeData(highlightColor: Colors.red),
        child: Scrollbar(
          child: ListView(
            children: [
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: UserProfile(),
              ),
              SizedBox(
                height: 10,
              ),
              buildSearchSection(),
              SizedBox(height: 10),
              Column(
                children: [
                  CustomMenuIconButton(
                    title: 'Inicio',
                    icon: Icons.home,
                    onTap: () {
                      setState(() {
                        widget._tabController.animateTo((0));
                      });
                    },
                  ),
                  CustomMenuIconButton(
                    title: 'Atividades',
                    icon: Icons.access_time,
                    onTap: () {
                      setState(() {
                        widget._tabController.animateTo((0));
                      });
                    },
                  ),
                ],
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
              buildMenuPrincipalItens(),
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
                            ColaspeItem(label: "Tema", icon: Icons.palette),
                            ColaspeItem(label: "Idioma", icon: Icons.translate),
                            ColaspeItem(
                              label: "Acessibilidade",
                              icon: Icons.accessible,
                            ),
                          ],
                        ),
                      )),
                ),
              ),
              CustomSideMenuItem(
                title: 'Ajuda',
                icon: Icons.help,
              ),
              CustomSideMenuItem(
                title: 'Sobre nós',
                icon: Icons.info,
              )
            ],
          ),
        ),
      ),
    );
  }

  Container buildMenuPrincipalItens() {
    return Container(
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
                  widget._tabController.animateTo((0));
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
                      widget._tabController.animateTo((1));
                    });
                  },
                  child: ColaspeItem(label: "Usuarios", icon: Icons.people),
                ),
                ColaspeItem(label: "Documents", icon: Icons.credit_card),
                ColaspeItem(
                  label: "Option 2",
                  icon: Icons.bar_chart,
                ),
              ],
            ),
          )),
    );
  }

  Widget buildSearchSection() {
    return Container(
      height: 35,
      margin: EdgeInsets.symmetric(horizontal: 10),
      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10, top: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: TextField(
          decoration: InputDecoration(
            // icon: IconButton(
            //   icon: Icon(Icons.search),
            //   onPressed: () {},
            // ),
            hintStyle: TextStyle(
              fontSize: 15,
            ),
            hintText: "Search",
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}

class CustomSideMenuItem extends StatelessWidget {
  const CustomSideMenuItem({
    Key key,
    this.icon,
    this.iconSize = 18,
    this.iconColor = Colors.white,
    this.title,
    this.titleStyle,
    this.onTap,
  }) : super(key: key);

  final IconData icon;
  final double iconSize;
  final Color iconColor;

  final String title;
  final TextStyle titleStyle;

  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        height: 50,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        width: double.infinity,
        color: Color(0xFF1a2226),
        child: Row(
          children: [
            Icon(
              icon,
              size: iconSize,
              color: iconColor,
            ),
            SizedBox(
              width: 4,
            ),
            Text(
              title,
              style: titleStyle ??
                  TextStyle(
                    color: Colors.grey[400],
                    fontSize: 13,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
