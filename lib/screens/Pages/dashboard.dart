// ignore_for_file: unused_import

import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quickalert/quickalert.dart';
import 'package:the_indian_souls/screens/Pages/home/views/home_screen.dart';
import 'package:the_indian_souls/screens/Pages/profile/views/profile_screen.dart';
import 'package:the_indian_souls/screens/network/dio_call/api_constants.dart';
import 'package:the_indian_souls/screens/network/dio_call/logout_api_call.dart';
import 'package:the_indian_souls/utils/constants/constants.dart';
import 'package:the_indian_souls/utils/constants/icon_constants.dart';
import 'package:the_indian_souls/utils/route/route_constants.dart';

import 'profile/views/view_user_profile.dart';

class Dashboard extends StatefulWidget {
  // final int initialIndex;

  const Dashboard({super.key}); // this.initialIndex = 0

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final List _pages = const [
    HomeScreen(),
    // ProfileScreen(),
  ];
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    // _currentIndex = widget.initialIndex;
  }

  @override
  Widget build(BuildContext context) {
    SvgPicture svgIcon(String src, {Color? color}) {
      return SvgPicture.asset(
        src,
        height: 24,
        colorFilter: ColorFilter.mode(
          color ??
              Theme.of(context).iconTheme.color!.withValues(
                alpha: Theme.of(context).brightness == Brightness.dark
                    ? 0.3
                    : 1,
              ),
          BlendMode.srcIn,
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        leading: const SizedBox(),
        leadingWidth: 0,
        centerTitle: false,
        title: Text(
          "The Indian Souls",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        actions: <Widget>[
          PopupMenuButton<String>(
            onSelected: (String result) {
              switch (result) {
                case 'Profile':
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return ViewUserProfileScreen(); // userData: userData,
                      },
                    ),
                  );
                  break;
                case 'Settings':
                  Navigator.pushNamed(context, displayBrightness);
                  break;
                case 'Logout':
                  QuickAlert.show(
                    context: context,
                    type: QuickAlertType.confirm,
                    text: 'Do you want to logout',
                    confirmBtnText: 'Yes',
                    cancelBtnText: 'No',
                    confirmBtnColor: primaryColor,
                    onConfirmBtnTap: () {
                      Navigator.of(context).pop();
                      LogOutAPI()
                          .doLogOut()
                          .then((value) {
                            if (value.success) {
                              setState(() {
                                token = "";
                              });
                              Navigator.pushNamedAndRemoveUntil(
                                context,
                                logInScreenRoute,
                                (route) => false,
                              );
                            } else {
                              QuickAlert.show(
                                context: context,
                                type: QuickAlertType.error,
                                text: 'Logout failed. Please try again.',
                              );
                            }
                          })
                          .catchError((error) {
                            QuickAlert.show(
                              context: context,
                              type: QuickAlertType.error,
                              text: error.toString(),
                            );
                          });
                    },
                  );
                  break;
              }
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              PopupMenuItem<String>(
                value: 'Profile',
                child: Row(
                  children: <Widget>[
                    svgIcon(iconProfile, color: primaryColor),
                    const SizedBox(width: 8),
                    const Text('Profile'),
                  ],
                ),
              ),
              PopupMenuItem<String>(
                value: 'Settings',
                child: Row(
                  children: <Widget>[
                    svgIcon(iconSetting, color: primaryColor),
                    const SizedBox(width: 8),
                    const Text('Settings'),
                  ],
                ),
              ),
              PopupMenuItem<String>(
                value: 'Logout',
                child: Row(
                  children: <Widget>[
                    svgIcon(iconLogout, color: primaryColor),
                    SizedBox(width: 8),
                    Text('Log Out'),
                  ],
                ),
              ),
            ],
            icon: const Icon(Icons.more_vert), // Use a typical menu icon
          ),
        ],
      ),
      body: PageTransitionSwitcher(
        duration: defaultDuration,
        transitionBuilder: (child, animation, secondAnimation) {
          return FadeThroughTransition(
            animation: animation,
            secondaryAnimation: secondAnimation,
            child: child,
          );
        },
        child: _pages[_currentIndex],
      ),
      // bottomNavigationBar: Container(
      //   padding: const EdgeInsets.only(top: defaultPadding / 2),
      //   color: Theme.of(context).brightness == Brightness.light
      //       ? whiteColor
      //       : blackColor,
      //   child: BottomNavigationBar(
      //     currentIndex: _currentIndex,
      //     onTap: (index) {
      //       if (index != _currentIndex) {
      //         setState(() {
      //           _currentIndex = index;
      //         });
      //       }
      //     },
      //     backgroundColor: Theme.of(context).brightness == Brightness.light
      //         ? whiteColor
      //         : blackColor,
      //     type: BottomNavigationBarType.fixed,
      //     selectedFontSize: 12,
      //     selectedItemColor: primaryColor,
      //     unselectedItemColor: Colors.transparent,
      //     items: [
      //       BottomNavigationBarItem(
      //         icon: svgIcon(iconShop),
      //         activeIcon: svgIcon(iconShop, color: primaryColor),
      //         label: "Shop",
      //       ),
      //       // BottomNavigationBarItem(
      //       //   icon: svgIcon(iconProfile),
      //       //   activeIcon: svgIcon(iconProfile, color: primaryColor),
      //       //   label: "Profile",
      //       // ),
      //     ],
      //   ),
      // ),
    );
  }
}
