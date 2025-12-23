import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:quickalert/quickalert.dart';
import 'package:the_indian_souls/screens/network/dio_call/register_api_call.dart';
import 'package:the_indian_souls/screens/network/models/general_model.dart';
import 'package:the_indian_souls/utils/constants/constants.dart';
import 'package:the_indian_souls/utils/constants/icon_constants.dart';
import 'package:the_indian_souls/utils/constants/image_constants.dart';
import 'package:the_indian_souls/utils/constants/validator.dart';
import 'package:the_indian_souls/utils/route/route_constants.dart';
import 'package:the_indian_souls/utils/variables/sign_in_variables.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  static TextEditingController firstNameController = TextEditingController();
  static TextEditingController middleNameController = TextEditingController();
  static TextEditingController lastNameController = TextEditingController();

  Gender? selectedGender = Gender.male;
  static TextEditingController emailController = TextEditingController();
  static TextEditingController phoneController = TextEditingController();

  static TextEditingController addressLine1Controller = TextEditingController();
  static TextEditingController addressLine2Controller = TextEditingController();

  // static TextEditingController pinCodeController = TextEditingController();

  final List<String> countries = ['India', 'USA'];

  // final Map<String, List<String>> _states = {
  //   'India': ['Delhi', 'Maharashtra', 'Karnataka'],
  //   'USA': ['California', 'Texas', 'Florida'],
  // };
  final Map<String, List<String>> cities = {
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

  String? selectedCountry;

  // String? selectedState;
  String? selectedCity;

  // List<String> statesForCountry = [];
  List<String> citiesForState = [];

  @override
  Widget build(BuildContext context) {
    return LoaderOverlay(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              flex: 1,
              child: Image.network(
                loginImage,
                height: MediaQuery.of(context).size.height * 0.35,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              flex: 2,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(defaultPadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Let’s get started!",
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      const SizedBox(height: defaultPadding / 2),
                      const Text(
                        "Please enter your valid data in order to create an account.",
                      ),
                      const SizedBox(height: defaultPadding),
                      // SignUpForm(formKey: _formKey),
                      Form(
                        key: formKey,
                        child: Column(
                          children: [
                            TextFormField(
                              onSaved: (value) {},
                              controller: firstNameController,
                              validator: fieldValidator.call,
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.text,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(16),
                                FilteringTextInputFormatter.allow(
                                  RegExp("[a-zA-Z]"),
                                ),
                                FilteringTextInputFormatter.deny(RegExp(r'\s')),
                              ],
                              decoration: InputDecoration(
                                hintText: "First Name *",
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: defaultPadding * 0.75,
                                  ),
                                  child: SvgPicture.asset(
                                    iconProfile,
                                    height: 24,
                                    width: 24,
                                    colorFilter: ColorFilter.mode(
                                      Theme.of(context)
                                          .textTheme
                                          .bodyLarge!
                                          .color!
                                          .withValues(alpha: 0.3),
                                      BlendMode.srcIn,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: defaultPadding),
                            TextFormField(
                              onSaved: (value) {},
                              controller: middleNameController,
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.text,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(16),
                                FilteringTextInputFormatter.allow(
                                  RegExp("[a-zA-Z]"),
                                ),
                                FilteringTextInputFormatter.deny(RegExp(r'\s')),
                              ],
                              decoration: InputDecoration(
                                hintText: "Middle Name",
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: defaultPadding * 0.75,
                                  ),
                                  child: SvgPicture.asset(
                                    iconProfile,
                                    height: 24,
                                    width: 24,
                                    colorFilter: ColorFilter.mode(
                                      Theme.of(context)
                                          .textTheme
                                          .bodyLarge!
                                          .color!
                                          .withValues(alpha: 0.3),
                                      BlendMode.srcIn,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: defaultPadding),
                            TextFormField(
                              onSaved: (value) {},
                              controller: lastNameController,
                              validator: fieldValidator.call,
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.text,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(16),
                                FilteringTextInputFormatter.allow(
                                  RegExp("[a-zA-Z]"),
                                ),
                                FilteringTextInputFormatter.deny(RegExp(r'\s')),
                              ],
                              decoration: InputDecoration(
                                hintText: "Last Name *",
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: defaultPadding * 0.75,
                                  ),
                                  child: SvgPicture.asset(
                                    iconProfile,
                                    height: 24,
                                    width: 24,
                                    colorFilter: ColorFilter.mode(
                                      Theme.of(context)
                                          .textTheme
                                          .bodyLarge!
                                          .color!
                                          .withValues(alpha: 0.3),
                                      BlendMode.srcIn,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: defaultPadding),
                            TextFormField(
                              readOnly: true,
                              controller: null,
                              decoration: InputDecoration(
                                hintText: "Gender *",
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: defaultPadding * 0.75,
                                  ),
                                  child: SvgPicture.asset(
                                    iconGender,
                                    height: 24,
                                    width: 24,
                                    colorFilter: ColorFilter.mode(
                                      Theme.of(context)
                                          .textTheme
                                          .bodyLarge!
                                          .color!
                                          .withValues(alpha: 0.3),
                                      BlendMode.srcIn,
                                    ),
                                  ),
                                ),
                              ),
                            ),

                            RadioGroup<Gender>(
                              groupValue: selectedGender,
                              onChanged: (Gender? value) {
                                setState(() {
                                  selectedGender = value;
                                });
                              },
                              child: Column(
                                children: [
                                  for (var gender in Gender.values)
                                    RadioListTile<Gender>(
                                      title: Text(
                                        gender.name[0].toUpperCase() +
                                            gender.name.substring(1),
                                      ),
                                      // Capitalize for display
                                      value: gender,
                                    ),
                                ],
                              ),
                            ),
                            const SizedBox(height: defaultPadding),
                            TextFormField(
                              onSaved: (value) {},
                              controller: emailController,
                              validator: emailIdValidator.call,
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.emailAddress,
                              inputFormatters: [
                                FilteringTextInputFormatter.deny(RegExp(r'\s')),
                              ],
                              decoration: InputDecoration(
                                hintText: "Email address *",
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: defaultPadding * 0.75,
                                  ),
                                  child: SvgPicture.asset(
                                    iconMessage,
                                    height: 24,
                                    width: 24,
                                    colorFilter: ColorFilter.mode(
                                      Theme.of(context)
                                          .textTheme
                                          .bodyLarge!
                                          .color!
                                          .withValues(alpha: 0.3),
                                      BlendMode.srcIn,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: defaultPadding),
                            TextFormField(
                              onSaved: (value) {},
                              controller: phoneController,
                              validator: phoneNumberValidator.call,
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.phone,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(10),
                                FilteringTextInputFormatter.digitsOnly,
                                FilteringTextInputFormatter.deny(RegExp(r'\s')),
                              ],
                              decoration: InputDecoration(
                                hintText: "Phone Number *",
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: defaultPadding * 0.75,
                                  ),
                                  child: SvgPicture.asset(
                                    iconPhone,
                                    height: 24,
                                    width: 24,
                                    colorFilter: ColorFilter.mode(
                                      Theme.of(context)
                                          .textTheme
                                          .bodyLarge!
                                          .color!
                                          .withValues(alpha: 0.3),
                                      BlendMode.srcIn,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: defaultPadding),
                            TextFormField(
                              onSaved: (value) {},
                              controller: addressLine1Controller,
                              validator: fieldValidator.call,
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.text,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(16),
                              ],
                              decoration: InputDecoration(
                                hintText: "Address Line 1 *",
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: defaultPadding * 0.75,
                                  ),
                                  child: SvgPicture.asset(
                                    iconAddress,
                                    height: 24,
                                    width: 24,
                                    colorFilter: ColorFilter.mode(
                                      Theme.of(context)
                                          .textTheme
                                          .bodyLarge!
                                          .color!
                                          .withValues(alpha: 0.3),
                                      BlendMode.srcIn,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: defaultPadding),
                            TextFormField(
                              onSaved: (value) {},
                              controller: addressLine2Controller,
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.text,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(16),
                              ],
                              decoration: InputDecoration(
                                hintText: "Address Line 2 *",
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: defaultPadding * 0.75,
                                  ),
                                  child: SvgPicture.asset(
                                    iconAddress,
                                    height: 24,
                                    width: 24,
                                    colorFilter: ColorFilter.mode(
                                      Theme.of(context)
                                          .textTheme
                                          .bodyLarge!
                                          .color!
                                          .withValues(alpha: 0.3),
                                      BlendMode.srcIn,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: defaultPadding),
                            DropdownButtonFormField<String>(
                              initialValue: selectedCountry,
                              hint: const Text(
                                "Country *",
                                style: TextStyle(fontWeight: FontWeight.w400),
                              ),
                              isExpanded: true,
                              decoration: InputDecoration(
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: defaultPadding * 0.75,
                                  ),
                                  child: SvgPicture.asset(
                                    iconAddress,
                                    height: 24,
                                    width: 24,
                                    colorFilter: ColorFilter.mode(
                                      Theme.of(context)
                                          .textTheme
                                          .bodyLarge!
                                          .color!
                                          .withValues(alpha: 0.3),
                                      BlendMode.srcIn,
                                    ),
                                  ),
                                ),
                              ),
                              items: countries.map((String country) {
                                return DropdownMenuItem<String>(
                                  value: country,
                                  child: Text(
                                    country,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                setState(() {
                                  selectedCountry = newValue;
                                  // selectedState = null;
                                  selectedCity = null;
                                  // _statesForCountry = _states[newValue!] ?? [];
                                  citiesForState = cities[newValue!] ?? [];
                                });
                              },
                              validator: (value) => value == null
                                  ? 'Please select a country'
                                  : null,
                            ),
                            // const SizedBox(height: defaultPadding),
                            // DropdownButtonFormField<String>(
                            //   initialValue: selectedState,
                            //   hint: const Text("State *",style: TextStyle(fontWeight: FontWeight.w400)),
                            //   isExpanded: true,
                            //   decoration: InputDecoration(
                            //     prefixIcon: Padding(
                            //       padding: const EdgeInsets.symmetric(
                            //         vertical: defaultPadding * 0.75,
                            //       ),
                            //       child: SvgPicture.asset(
                            //         iconAddress,
                            //         height: 24,
                            //         width: 24,
                            //         colorFilter: ColorFilter.mode(
                            //           Theme.of(context)
                            //               .textTheme
                            //               .bodyLarge!
                            //               .color!
                            //               .withValues(alpha: 0.3),
                            //           BlendMode.srcIn,
                            //         ),
                            //       ),
                            //     ),
                            //   ),
                            //   items: _statesForCountry.map((String state) {
                            //     return DropdownMenuItem<String>(
                            //       value: state,
                            //       child: Text(state,style: TextStyle(fontWeight: FontWeight.w400)),
                            //     );
                            //   }).toList(),
                            //   onChanged: selectedCountry == null
                            //       ? null
                            //       : (String? newValue) {
                            //     setState(() {
                            //       selectedState = newValue;
                            //       selectedCity = null;
                            //       _citiesForState = _cities[newValue!] ?? [];
                            //     });
                            //   },
                            //   validator: (value) =>
                            //   value == null ? 'Please select a state' : null,
                            // ),
                            const SizedBox(height: defaultPadding),
                            DropdownButtonFormField<String>(
                              initialValue: selectedCity,
                              hint: const Text(
                                "City *",
                                style: TextStyle(fontWeight: FontWeight.w400),
                              ),
                              isExpanded: true,
                              decoration: InputDecoration(
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: defaultPadding * 0.75,
                                  ),
                                  child: SvgPicture.asset(
                                    iconAddress,
                                    height: 24,
                                    width: 24,
                                    colorFilter: ColorFilter.mode(
                                      Theme.of(context)
                                          .textTheme
                                          .bodyLarge!
                                          .color!
                                          .withValues(alpha: 0.3),
                                      BlendMode.srcIn,
                                    ),
                                  ),
                                ),
                              ),
                              items: citiesForState.map((String city) {
                                return DropdownMenuItem<String>(
                                  value: city,
                                  child: Text(
                                    city,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                );
                              }).toList(),
                              onChanged: selectedCountry == null
                                  ? null
                                  : (String? newValue) {
                                      setState(() {
                                        selectedCity = newValue;
                                      });
                                    },
                              validator: (value) =>
                                  value == null ? 'Please select a city' : null,
                            ),

                            // const SizedBox(height: defaultPadding),
                            // TextFormField(
                            //   onSaved: (value) {},
                            //   controller: pinCodeController,
                            //   validator: fieldValidator.call,
                            //   textInputAction: TextInputAction.next,
                            //   keyboardType: TextInputType.emailAddress,
                            //   inputFormatters: [
                            //     LengthLimitingTextInputFormatter(6),
                            //   ],
                            //   decoration: InputDecoration(
                            //     hintText: "Pin code",
                            //     prefixIcon: Padding(
                            //       padding: const EdgeInsets.symmetric(
                            //         vertical: defaultPadding * 0.75,
                            //       ),
                            //       child: SvgPicture.asset(
                            //         iconAddress,
                            //         height: 24,
                            //         width: 24,
                            //         colorFilter: ColorFilter.mode(
                            //           Theme.of(context)
                            //               .textTheme
                            //               .bodyLarge!
                            //               .color!
                            //               .withValues(alpha: 0.3),
                            //           BlendMode.srcIn,
                            //         ),
                            //       ),
                            //     ),
                            //   ),
                            // ),
                            const SizedBox(height: defaultPadding),
                            TextFormField(
                              onSaved: (value) {},
                              controller: passwordController,
                              validator: passwordValidator.call,
                              textInputAction: TextInputAction.next,
                              inputFormatters: [
                                FilteringTextInputFormatter.deny(RegExp(r'\s')),
                              ],
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                hintText: "New Password *",
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: defaultPadding * 0.75,
                                  ),
                                  child: SvgPicture.asset(
                                    iconLock,
                                    height: 24,
                                    width: 24,
                                    colorFilter: ColorFilter.mode(
                                      Theme.of(context)
                                          .textTheme
                                          .bodyLarge!
                                          .color!
                                          .withValues(alpha: 0.3),
                                      BlendMode.srcIn,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: defaultPadding),
                            TextFormField(
                              onSaved: (pass) {},
                              controller: confirmPasswordController,
                              validator: confirmPasswordValidator.call,
                              textInputAction: TextInputAction.done,
                              keyboardType: TextInputType.text,
                              inputFormatters: [
                                FilteringTextInputFormatter.deny(RegExp(r'\s')),
                              ],
                              obscureText: true,
                              decoration: InputDecoration(
                                hintText: "Confirm Password *",
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: defaultPadding * 0.75,
                                  ),
                                  child: SvgPicture.asset(
                                    iconLock,
                                    height: 24,
                                    width: 24,
                                    colorFilter: ColorFilter.mode(
                                      Theme.of(context)
                                          .textTheme
                                          .bodyLarge!
                                          .color!
                                          .withValues(alpha: 0.3),
                                      BlendMode.srcIn,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: defaultPadding * 2),
                      ElevatedButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            formKey.currentState!.save();

                            context.loaderOverlay.show();
                            final data = json.encode({
                              "first_name": firstNameController.text,
                              "middle_name": middleNameController.text,
                              "last_name": lastNameController.text,
                              "email_address": emailController.text,
                              "phone_number": phoneController.text,
                              "gender": selectedGender!.name.toUpperCase(),
                              "login_password": confirmPasswordController.text,
                              "address": {
                                "line1": addressLine1Controller.text,
                                "line2": addressLine2Controller.text,
                                "line3": "",
                                "line4": "",
                              },
                              "city": selectedCity,
                              "country": selectedCountry,
                            });
                            RegisterApiCall()
                                .registerUser(data)
                                .then((value) => {checkSuccessValue(value)})
                                .catchError((error) {
                                  checkErrorValue(error);
                                });
                          }
                        },
                        child: const Text("Continue"),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Already have an account?"),
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, logInScreenRoute);
                            },
                            child: const Text("Log in"),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void checkSuccessValue(GeneralModel value) {
    context.loaderOverlay.hide();
    if (value.success) {
      QuickAlert.show(
        context: context,
        type: QuickAlertType.success,
        text: value.message,
        onConfirmBtnTap: () {
          Navigator.pushNamedAndRemoveUntil(
            context,
            dashboardScreenRoute,
            ModalRoute.withName(logInScreenRoute),
          );
        },
      );
    } else {
      QuickAlert.show(
        context: context,
        type: QuickAlertType.error,
        text: value.message,
      );
    }
  }

  void checkErrorValue(dynamic error) {
    context.loaderOverlay.hide();
    QuickAlert.show(context: context, type: QuickAlertType.error, text: error);
  }
}
