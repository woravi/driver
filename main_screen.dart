import 'package:flutter/material.dart';
import 'package:untitled/tabPages/earning_tab.dart';
import 'package:untitled/tabPages/home_tab.dart';
import 'package:untitled/tabPages/profile_tab.dart';
import 'package:untitled/tabPages/ratings_tab.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
    with SingleTickerProviderStateMixin {
  TabController? tabController;
  int selectedIndex = 0;

  onItemClicked(int index) {
    setState(() {
      selectedIndex = index;
      tabController!.index = selectedIndex;
    });
  }

  @override
  void initState() {
    super.initState();

    tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        physics: const NeverScrollableScrollPhysics(),
        controller: tabController,
        children: const [
          HomeTabPage(),
          EarningsTabPage(),
          RatingsTabPage(),
          ProfileTabPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "หน้าแรก",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.credit_card),
            label: "รายได้",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: "ความนิยม",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "ผู้ใช้งาน",
          ),
        ],
        unselectedItemColor: Colors.white54,
        selectedItemColor: Colors.white,
        backgroundColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: const TextStyle(fontSize: 18),
        showUnselectedLabels: true,
        currentIndex: selectedIndex,
        onTap: onItemClicked,
      ),
    );
  }
}
