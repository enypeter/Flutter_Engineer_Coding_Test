
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../helpers/assets.dart';
import 'home.dart';
import '../../helpers/theme.dart';

class AppNav extends StatefulWidget {
  AppNav({Key? key}) : super(key: key);

  @override
  _AppNavState createState() => _AppNavState();
}

class _AppNavState extends State<AppNav> {
  Widget _getTabView(int tabIndex) {
    List tabViews = [
      HomeScreen(),
      Container(),
      Container(),
      Container(),
    ];

    return tabViews[tabIndex];
  }

  //Initialize selected tab

  int _selectedTab = 0;

  void _setActiveTab(int index) {
    setState(() {
      _selectedTab = index;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _getTabView(_selectedTab),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: WHITE,
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 12,
        elevation: 2,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w500),
        unselectedLabelStyle:
        const TextStyle(fontWeight: FontWeight.w300, color: GREY),
        unselectedFontSize: 12,
        items: [
          BottomNavigationBarItem(
              activeIcon:
              bottomNavIcon(AppIcons.home_fill, color: PRIMARYCOLOR),
              icon: bottomNavIcon(AppIcons.home),
              label: "Home"),
          BottomNavigationBarItem(
              activeIcon:
              bottomNavIcon(AppIcons.voucher_fill, color: PRIMARYCOLOR),
              icon: bottomNavIcon(AppIcons.voucher),
              label: "Voucher"),
          BottomNavigationBarItem(
              activeIcon:
              bottomNavIcon(AppIcons.wallet_fill, color: PRIMARYCOLOR),
              icon: bottomNavIcon(AppIcons.wallet),
              label: "Wallet"),
          BottomNavigationBarItem(
            activeIcon:
            bottomNavIcon(AppIcons.setting_fill, color: PRIMARYCOLOR),
            icon: bottomNavIcon(AppIcons.setting),
            label: "Settings",
          ),
        ],
        selectedItemColor: DARK,
        currentIndex: _selectedTab,
        onTap: (int index) {
          _setActiveTab(index);
        },
      ),
    );
  }
}

Widget bottomNavIcon(image, {color}) {
  return Padding(
    padding: const EdgeInsets.all(5.0),
    child: SvgPicture.asset(
      image,
      height: 23,
      width: 23,
      color: color,
    ),
  );
}