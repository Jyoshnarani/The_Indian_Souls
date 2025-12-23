import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:quickalert/quickalert.dart';
import 'package:the_indian_souls/screens/Pages/profile/views/view_user_profile.dart';
import 'package:the_indian_souls/screens/network/dio_call/api_constants.dart';
import 'package:the_indian_souls/screens/network/dio_call/logout_api_call.dart';
import 'package:the_indian_souls/screens/network/dio_call/user_details_api_call.dart';
import 'package:the_indian_souls/screens/network/models/user_model.dart';
import 'package:the_indian_souls/utils/constants/constants.dart';
import 'package:the_indian_souls/utils/constants/icon_constants.dart';
import 'package:the_indian_souls/utils/constants/image_constants.dart';
import 'package:the_indian_souls/utils/route/route_constants.dart';
import 'components/profile_card.dart';
import 'components/profile_menu_item_list_tile.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => ProfileScreenState();
}

class ProfileScreenState extends State<ProfileScreen> {
  UserData? userData;


  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => fetchUserDetails());
  }

  Future<void> fetchUserDetails() async {
    context.loaderOverlay.show();
    try {
      final response = await UserDetailsAPI().getUserDetails();
      if (mounted) {
        if (response.success) {
          setState(() {
            userData = response.data;
          });
        } else {
          QuickAlert.show(
            context: context,
            type: QuickAlertType.error,
            text: 'Failed to fetch user details',
          );
        }
      }
    } catch (e) {
      if (mounted) {
        QuickAlert.show(
          context: context,
          type: QuickAlertType.error,
          text: e.toString(),
        );
      }
    } finally {
      if (mounted) {
        context.loaderOverlay.hide();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoaderOverlay(
        duration: Duration(seconds: 10),
        overlayWidgetBuilder: (_) => Center(child: CircularProgressIndicator()),
        child: ListView(
          children: [
            ProfileCard(
              name: userData == null ? "": userData!.firstName ??"",
              email: userData == null ? "": userData!.emailAddress,
              imageSrc: userImage,
              press:  userData == null ? null:() {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return ViewUserProfileScreen(
                        userData: userData,
                      );
                    },
                  ),
                );
              },
            ),
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
            //   child: Text(
            //     "Account",
            //     style: Theme.of(context).textTheme.titleSmall,
            //   ),
            // ),
            // const SizedBox(height: defaultPadding / 2),
            // ProfileMenuListTile(
            //   text: "Addresses",
            //   svgSrc: iconAddress,
            //   press: () {},
            // ),
            const SizedBox(height: defaultPadding),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: defaultPadding,
                vertical: defaultPadding / 2,
              ),
              child: Text(
                "Settings",
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ),
            ProfileMenuListTile(
              text: "Display & Brightness",
              svgSrc: iconSetting,
              press: () {
                Navigator.pushNamed(context, displayBrightness);
              },
            ),
            // ProfileMenuListTile(
            //   text: "Language",
            //   svgSrc: iconLanguage,
            //   press: () {},
            // ),
            // const SizedBox(height: defaultPadding),
            // Padding(
            //   padding: const EdgeInsets.symmetric(
            //     horizontal: defaultPadding,
            //     vertical: defaultPadding / 2,
            //   ),
            //   child: Text(
            //     "Help & Support",
            //     style: Theme.of(context).textTheme.titleSmall,
            //   ),
            // ),
            // ProfileMenuListTile(
            //   text: "Get Help",
            //   svgSrc: iconHelp,
            //   press: () {},
            // ),
            const SizedBox(height: defaultPadding),
            ListTile(
              onTap: () {
                QuickAlert.show(
                  context: context,
                  type: QuickAlertType.confirm,
                  text: 'Do you want to logout',
                  confirmBtnText: 'Yes',
                  cancelBtnText: 'No',
                  confirmBtnColor: primaryColor,
                  onConfirmBtnTap: () {
                    Navigator.of(context).pop();
                    context.loaderOverlay.show();
                    LogOutAPI().doLogOut().then((value) {
                      context.loaderOverlay.hide();
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
                    }).catchError((error) {
                      context.loaderOverlay.hide();
                      QuickAlert.show(
                        context: context,
                        type: QuickAlertType.error,
                        text: error.toString(),
                      );
                    });
                  },
                );
              },
              minLeadingWidth: 24,
              leading: SvgPicture.asset(
                iconLogout,
                height: 24,
                width: 24,
                colorFilter: const ColorFilter.mode(
                  errorColor,
                  BlendMode.srcIn,
                ),
              ),
              title: const Text(
                "Log Out",
                style: TextStyle(color: errorColor, fontSize: 14, height: 1),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
