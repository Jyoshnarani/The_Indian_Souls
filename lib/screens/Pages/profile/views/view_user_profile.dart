import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:the_indian_souls/screens/Pages/profile/views/edit_user_profile.dart';
import 'package:the_indian_souls/screens/components/network_image_with_loader.dart';
import 'package:the_indian_souls/screens/network/dio_call/user_details_api_call.dart';
import 'package:the_indian_souls/screens/network/models/user_model.dart';
import 'package:the_indian_souls/utils/constants/constants.dart';
import 'package:the_indian_souls/utils/constants/icon_constants.dart';
import 'package:the_indian_souls/utils/constants/image_constants.dart';

class ViewUserProfileScreen extends StatefulWidget {
  final dynamic userData;

  const ViewUserProfileScreen({super.key, required this.userData});

  @override
  State<ViewUserProfileScreen> createState() => ViewUserProfileScreenState();
}

class ViewUserProfileScreenState extends State<ViewUserProfileScreen> {
  late UserData userData;

  @override
  void initState() {
    super.initState();
    userData = widget.userData;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        actions: [
          InkWell(
            onTap: null/*() async {
              final result = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      EditUserProfileScreen(userData: userData),
                ),
              );

              if (result == true) {
                _refreshUserData();
              }
            }*/,
            child: SvgPicture.asset(
              iconUserEdit,
              height: 24,
              width: 24,
              colorFilter: ColorFilter.mode(
                Theme.of(
                  context,
                ).textTheme.bodyLarge!.color!.withValues(alpha: 0.3),
                BlendMode.srcIn,
              ),
            ),
          ),
        ],
      ),
      body: LoaderOverlay(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(defaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: CircleAvatar(
                  radius: 200,
                  backgroundColor: whiteColor,
                  child: NetworkImageWithLoader(userImage, radius: 20),
                ),
              ),
              const SizedBox(height: defaultPadding),
              _buildProfileDetail(
                'Name',
                '${userData.firstName ?? ''} ${userData.middleInitial ?? ''} ${userData.lastName ?? ''}',
              ),
              _buildProfileDetail('Gender', userData.gender),
              _buildProfileDetail('Email Address', userData.emailAddress),
              _buildProfileDetail(
                'Phone Number',
                userData.phoneNumber ?? 'N/A',
              ),
              _buildProfileDetail(
                'Address',
                '${userData.addressLine1 ?? 'N/A'} ${userData.addressLine2 ?? 'N/A'} ${userData.addressLine3 ?? ''} ${userData.addressLine4 ?? ''}',
              ),
              _buildProfileDetail('City', userData.townCity ?? 'N/A'),
              _buildProfileDetail('Country', userData.country ?? 'N/A'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileDetail(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: Theme.of(context).textTheme.titleSmall),
          const SizedBox(height: 4),
          Text(value, style: Theme.of(context).textTheme.bodyLarge),
          const Divider(),
        ],
      ),
    );
  }

  void _refreshUserData() async {
    context.loaderOverlay.show();
    var userDetails = await UserDetailsAPI().getUserDetails();
    context.loaderOverlay.hide();
    if (userDetails.success && userDetails.data != null) {
      setState(() {
        userData = userDetails.data!;
      });
    }
  }
}
