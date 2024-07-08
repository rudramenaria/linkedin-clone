import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:linkedin_clone/common/assets/assets.dart';
import 'package:linkedin_clone/common/color/colors.dart';
import 'package:linkedin_clone/modules/home/view/home.screen.dart';
import 'package:linkedin_clone/modules/my%20networks/view/my-networks.screen.dart';

class MainPageViewScreen extends StatefulWidget {
  const MainPageViewScreen({super.key});

  @override
  State<MainPageViewScreen> createState() => _MainPageViewScreenState();
}

class _MainPageViewScreenState extends State<MainPageViewScreen> {
  final List<Widget> _screens = const [
    HomeScreen(),
    MyNetworksScreen(),
    SizedBox(),
    SizedBox(),
    SizedBox(),
  ];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[selectedIndex],
      bottomNavigationBar: _bottomBar(),
    );
  }

  BottomNavigationBar _bottomBar() {
    return BottomNavigationBar(
      fixedColor: Colors.black,
      showUnselectedLabels: true,
      unselectedItemColor: AppColors.grey,
      currentIndex: selectedIndex,
      onTap: (index) {
        setState(() {
          selectedIndex = index;
        });
      },
      items: [
        BottomNavigationBarItem(
          backgroundColor: Colors.white,
          label: "Home",
          icon: Image.asset(AppAssets.home),
        ),
        BottomNavigationBarItem(
          label: "My Network",
          icon: Image.asset(AppAssets.myNetwork),
        ),
        BottomNavigationBarItem(
          label: "Post",
          icon: Image.asset(AppAssets.post),
        ),
        BottomNavigationBarItem(
          label: "Notification",
          icon: Image.asset(AppAssets.notification),
        ),
        BottomNavigationBarItem(
          label: "Jobs",
          icon: Image.asset(AppAssets.jobs),
        ),
      ],
    );
  }
}
