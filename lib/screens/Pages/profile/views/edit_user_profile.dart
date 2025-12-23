import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:quickalert/quickalert.dart';
import 'package:the_indian_souls/screens/Pages/dashboard.dart';
import 'package:the_indian_souls/screens/network/dio_call/user_details_api_call.dart';
import 'package:the_indian_souls/utils/constants/constants.dart';

class EditUserProfileScreen extends StatefulWidget {
  final dynamic userData;

  const EditUserProfileScreen({super.key, required this.userData});

  @override
  State<EditUserProfileScreen> createState() => _EditUserProfileScreenState();
}

class _EditUserProfileScreenState extends State<EditUserProfileScreen> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController _firstNameController;
  late TextEditingController _middleInitialController;
  late TextEditingController _lastNameController;
  late TextEditingController _genderController;
  late TextEditingController _emailController;
  late TextEditingController _phoneNumberController;
  late TextEditingController _addressLine1Controller;
  late TextEditingController _addressLine2Controller;

  String? _selectedCity;
  String? _selectedCountry;

  final List<String> _countries = ['India', 'USA'];
  final Map<String, List<String>> _cities = {
    'India': ['Bangalore', 'Mysore', 'Mumbai', 'Pune', 'New Delhi'],
    'USA': [
      'Los Angeles',
      'San Francisco',
      'Houston',
      'Austin',
      'Miami',
      'Orlando',
    ],
  };

  @override
  void initState() {
    super.initState();
    _firstNameController = TextEditingController(
      text: widget.userData?.firstName ?? '',
    );
    _middleInitialController = TextEditingController(
      text: widget.userData?.middleInitial ?? '',
    );
    _lastNameController = TextEditingController(
      text: widget.userData?.lastName ?? '',
    );
    _genderController = TextEditingController(
      text: widget.userData?.gender ?? '',
    );
    _emailController = TextEditingController(
      text: widget.userData?.emailAddress ?? '',
    );
    _phoneNumberController = TextEditingController(
      text: widget.userData?.phoneNumber ?? '',
    );
    _addressLine1Controller = TextEditingController(
      text: widget.userData?.addressLine1 ?? '',
    );
    _addressLine2Controller = TextEditingController(
      text: widget.userData?.addressLine2 ?? '',
    );

    _selectedCountry = widget.userData?.country;
    if (!_countries.contains(_selectedCountry)) {
      _selectedCountry = _countries.first;
    }

    final citiesForCountry = _cities[_selectedCountry] ?? [];
    _selectedCity = widget.userData?.townCity;
    if (!citiesForCountry.contains(_selectedCity)) {
      _selectedCity = citiesForCountry.isNotEmpty
          ? citiesForCountry.first
          : null;
    }
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _middleInitialController.dispose();
    _lastNameController.dispose();
    _genderController.dispose();
    _emailController.dispose();
    _phoneNumberController.dispose();
    _addressLine1Controller.dispose();
    _addressLine2Controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Edit Profile')),
      body: LoaderOverlay(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(defaultPadding),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildTextFormField(_firstNameController, 'First Name', true),
                _buildTextFormField(
                  _middleInitialController,
                  'Middle Initial',
                  false,
                ),
                _buildTextFormField(_lastNameController, 'Last Name', true),
                _buildTextFormField(_genderController, 'Gender', true),
                _buildTextFormField(_emailController, 'Email Address', true),
                _buildTextFormField(
                  _phoneNumberController,
                  'Phone Number',
                  true,
                ),
                _buildTextFormField(
                  _addressLine1Controller,
                  'Address Line 1',
                  false,
                ),
                _buildTextFormField(
                  _addressLine2Controller,
                  'Address Line 2',
                  false,
                ),
                _buildCountryDropdown(),
                _buildCityDropdown(),
                const SizedBox(height: defaultPadding),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 48),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      _updateUserProfile();
                    }
                  },
                  child: const Text('Update'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextFormField(
    TextEditingController controller,
    String label,
    bool readOnly,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
        readOnly: readOnly,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
          fillColor: Theme.of(
            context,
          ).colorScheme.onSurface.withValues(alpha: 0.05),
        ),
      ),
    );
  }

  Widget _buildCountryDropdown() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: DropdownButtonFormField<String>(
        value: _selectedCountry,
        iconEnabledColor: Theme.of(
          context,
        ).colorScheme.onSurface.withValues(alpha: 0.05),
        decoration: InputDecoration(
          labelText: 'Country',
          border: const OutlineInputBorder(),
          fillColor: Theme.of(
            context,
          ).colorScheme.onSurface.withValues(alpha: 0.05),
        ),
        dropdownColor: Theme.of(context).cardColor,
        icon: Icon(
          Icons.arrow_drop_down,
          color: Theme.of(context).colorScheme.onSurface,
        ),
        items: _countries.map((String country) {
          return DropdownMenuItem<String>(
            value: country,
            child: Text(country, style: Theme.of(context).textTheme.bodyLarge),
          );
        }).toList(),
        onChanged: (newValue) {
          setState(() {
            _selectedCountry = newValue;
            _selectedCity = null; // Reset city when country changes
          });
        },
      ),
    );
  }

  Widget _buildCityDropdown() {
    List<String> citiesForSelectedCountry = _selectedCountry != null
        ? (_cities[_selectedCountry] ?? [])
        : [];
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: DropdownButtonFormField<String>(
        value: _selectedCity,
        iconEnabledColor: Theme.of(
          context,
        ).colorScheme.onSurface.withValues(alpha: 0.05),
        decoration: InputDecoration(
          labelText: 'City',
          border: const OutlineInputBorder(),
          fillColor: Theme.of(
            context,
          ).colorScheme.onSurface.withValues(alpha: 0.05),
        ),
        dropdownColor: Theme.of(context).cardColor,
        icon: Icon(
          Icons.arrow_drop_down,
          color: Theme.of(context).colorScheme.onSurface,
        ),
        items: citiesForSelectedCountry.map((String city) {
          return DropdownMenuItem<String>(
            value: city,
            child: Text(city, style: Theme.of(context).textTheme.bodyLarge),
          );
        }).toList(),
        onChanged: (newValue) {
          setState(() {
            _selectedCity = newValue;
          });
        },
        disabledHint: Text(
          _selectedCountry == null
              ? 'Select a country first'
              : 'No cities available',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
    );
  }

  void _updateUserProfile() async {
    context.loaderOverlay.show();
    Map<String, dynamic> updatedData = {
      'middle_initial': _middleInitialController.text,
      'address_line_1': _addressLine1Controller.text,
      'address_line_2': _addressLine2Controller.text,
      'town_city': _selectedCity,
      'country': _selectedCountry,
    };

    bool success = await UserDetailsAPI().updateUserProfile(updatedData);
    context.loaderOverlay.hide();

    if (success) {
      QuickAlert.show(
        context: context,
        type: QuickAlertType.success,
        text: 'Profile updated successfully!',
        backgroundColor: Theme.of(context).cardColor,
        titleColor: Theme.of(context).colorScheme.onSurface,
        textColor: Theme.of(context).colorScheme.onSurface,
        onConfirmBtnTap: () {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => const Dashboard(initialIndex: 1),
            ),
            (Route<dynamic> route) => false,
          );
        },
      );
    } else {
      QuickAlert.show(
        context: context,
        type: QuickAlertType.error,
        text: 'Failed to update profile.',
        backgroundColor: Theme.of(context).cardColor,
        titleColor: Theme.of(context).colorScheme.onSurface,
        textColor: Theme.of(context).colorScheme.onSurface,
      );
    }
  }
}
