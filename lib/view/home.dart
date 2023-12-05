import 'package:adminservice/resources/constant/colors.dart';
import 'package:adminservice/view/status_page.dart';
import 'package:floating_tabbar/Models/tab_item.dart';
import 'package:floating_tabbar/floating_tabbar.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Widget floatingTabBarPageView() {
  
    List<TabItem> tabList() {
      List<TabItem> list = [
        TabItem(
          onTap: () {},
          selectedLeadingIcon: const Icon(Icons.dashboard),
          title: const Text("Dashboard"),
          tab: StatusPage()
         // badgeCount: 10,
        ),
        TabItem(
          onTap: () {},
          selectedLeadingIcon: const Icon(Icons.badge),
          title: const Text("Servicers"),
          tab: const Center(
              child: Text("Servicers", style: TextStyle(fontSize: 30))),
        ),
        TabItem(
          onTap: () {},
          selectedLeadingIcon: const Icon(Icons.settings),
          title: const Text("Settings"),
          tab: const Center(
              child: Text("Settings", style: TextStyle(fontSize: 30))),
        ),
      
        
      ];
      return list;
    }

    return FloatingTabBar(
      children: tabList(),
      useNautics: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return floatingTabBarPageView();
  }
}