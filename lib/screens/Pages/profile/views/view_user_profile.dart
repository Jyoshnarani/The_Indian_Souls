import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:the_indian_souls/screens/components/network_image_with_loader.dart';
import 'package:the_indian_souls/screens/network/models/user_model.dart';
import 'package:the_indian_souls/utils/constants/constants.dart';
import 'package:the_indian_souls/utils/constants/image_constants.dart';

class ViewUserProfileScreen extends StatefulWidget {
  final dynamic userData;

  const ViewUserProfileScreen({super.key, required this.userData});

  @override
  State<ViewUserProfileScreen> createState() => ViewUserProfileScreenState();
}

class ViewUserProfileScreenState extends State<ViewUserProfileScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: LoaderOverlay(
        child: widget.userData == null
            ? const Center(child: Text('No user data available.'))
            : SingleChildScrollView(
                padding: const EdgeInsets.all(defaultPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: CircleAvatar(
                        radius: 200,
                        backgroundColor: whiteColor,
                        child: NetworkImageWithLoader(
                          userImage,
                          radius: 20,
                        ),
                      ),
                    ),
                    // Center(
                    //   child: CircleAvatar(
                    //     radius: 50,
                    //     // You can add a user image here if available
                    //     // backgroundImage: NetworkImage(widget.userData!.profileImageUrl),
                    //     // child: Text(
                    //     //   widget.userData!.firstName?.substring(0, 1) ?? 'U',
                    //     //   style: Theme.of(context).textTheme.headlineLarge,
                    //     // ),
                    //   ),
                    // ),
                    const SizedBox(height: defaultPadding),
                    _buildProfileDetail(
                      'Name',
                      '${widget.userData!.firstName ?? ''} ${widget.userData!.lastName ?? ''}',
                    ),
                    _buildProfileDetail('Email Id', widget.userData!.emailAddress),
                    _buildProfileDetail(
                      'Phone Number',
                      widget.userData!.phoneNumber ?? 'N/A',
                    ),
                    _buildProfileDetail(
                      'Address',
                      '${widget.userData!.addressLine1 ?? 'N/A'}',
                    ),
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
}
