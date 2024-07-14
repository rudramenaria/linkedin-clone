import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:linkedin_clone/common/assets/assets.dart';
import 'package:linkedin_clone/common/color/colors.dart';
import 'package:linkedin_clone/modules/create%20post/view/create-post.screen.dart';
import 'package:linkedin_clone/modules/home/view/home.screen.dart';
import 'package:linkedin_clone/modules/my%20networks/view/my-networks.screen.dart';
import 'package:linkedin_clone/modules/notifications/view/notifications.screen.dart';

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
    NotificationsScreen(),
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
        if (index == 2) {
          Navigator.of(context).push(
            CustomPageRoute(
              widget: const CreatePostScreen(),
            ),
          );
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) => const CreatePostScreen(),
          //   ),
          // );
          return;
        }
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

class CustomPageRoute extends PageRouteBuilder {
  final Widget widget;

  CustomPageRoute({required this.widget})
      : super(
          // Define transition duration
          transitionDuration: const Duration(milliseconds: 200),
          // Specify transitionsBuilder for custom transition
          transitionsBuilder: (BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
              Widget child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0.0, 1.0), // Define begin offset
                end: Offset.zero, // Define end offset (0, 0)
              ).animate(animation),
              child: child,
            );
          },
          // Build the page widget
          pageBuilder: (BuildContext context, Animation<double> animation,
              Animation<double> secondaryAnimation) {
            return widget;
          },
        );
}
