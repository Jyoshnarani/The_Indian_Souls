import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:quickalert/quickalert.dart';
import 'package:the_indian_souls/screens/network/dio_call/api_constants.dart';
import 'package:the_indian_souls/screens/network/dio_call/login_api_call.dart';
import 'package:the_indian_souls/utils/constants/constants.dart';
import 'package:the_indian_souls/utils/constants/icon_constants.dart';
import 'package:the_indian_souls/utils/constants/image_constants.dart';
import 'package:the_indian_souls/utils/constants/validator.dart';
import 'package:the_indian_souls/utils/route/route_constants.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String emilId = "";
  String password = "";
  bool isLoadingPage = false;

  @override
  void initState() {
    super.initState();
    // GetCaptchaApi().getCaptcha();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return LoaderOverlay(
      child: Scaffold(
        body: Column(
          children: [
           Expanded(flex:1, child:  Image.network(width: MediaQuery.of(context).size.width,loginImage, fit: BoxFit.fill)),
            Expanded(flex:2, child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(defaultPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Welcome back!",
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const SizedBox(height: defaultPadding / 2),
                    const Text(
                      "Log in with your data that you interred during your registration.",
                    ),
                    const SizedBox(height: defaultPadding),
                    Form(
                      key: formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            onSaved: (value) {
                              emilId = value!;
                            },
                            validator: emailIdValidator.call,
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              hintText: "Email address",
                              prefixIcon: Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: defaultPadding * 0.75,
                                ),
                                child: SvgPicture.asset(
                                  iconMessage,
                                  height: 24,
                                  width: 24,
                                  colorFilter: ColorFilter.mode(
                                    Theme.of(context).textTheme.bodyLarge!.color!
                                        .withValues(alpha: 0.3),
                                    BlendMode.srcIn,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: defaultPadding),
                          TextFormField(
                            onSaved: (value) {
                              password = value!;
                            },
                            validator: passwordValidator.call,
                            obscureText: true,
                            decoration: InputDecoration(
                              hintText: "Password",
                              prefixIcon: Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: defaultPadding * 0.75,
                                ),
                                child: SvgPicture.asset(
                                  iconLock,
                                  height: 24,
                                  width: 24,
                                  colorFilter: ColorFilter.mode(
                                    Theme.of(context).textTheme.bodyLarge!.color!
                                        .withValues(alpha: 0.3),
                                    BlendMode.srcIn,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          /* const SizedBox(height: defaultPadding),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: defaultPadding * 0.75,
                          horizontal: defaultPadding * 0.75,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.grey.shade300),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "",
                              style: const TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 6,
                                fontStyle: FontStyle.italic,
                                decoration: TextDecoration.lineThrough,
                                color: Colors.blueGrey,
                              ),
                            ),
                            InkWell(
                              onTap: (){},
                              child: SvgPicture.asset(
                                iconRefresh,
                                height: 24,
                                width: 24,
                                colorFilter: ColorFilter.mode(
                                  Theme.of(context).textTheme.bodyLarge!.color!
                                      .withValues(alpha: 0.3),
                                  BlendMode.srcIn,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: defaultPadding),
                      TextFormField(
                        onSaved: (pass) {
                        },
                        validator: passwordValidator.call,
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: "Captcha",
                          prefixIcon: Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: defaultPadding * 0.75,
                            ),
                            child: SvgPicture.asset(
                              iconLock,
                              height: 24,
                              width: 24,
                              colorFilter: ColorFilter.mode(
                                Theme.of(context).textTheme.bodyLarge!.color!
                                    .withValues(alpha: 0.3),
                                BlendMode.srcIn,
                              ),
                            ),
                          ),
                        ),
                      ),*/
                        ],
                      ),
                    ),
                    // Align(
                    //   child: TextButton(
                    //     onPressed: null,
                    //     child: const Text("Forgot password"),
                    //   ),
                    // ),
                    SizedBox(
                      height: size.height > 700
                          ? size.height * 0.1
                          : defaultPadding,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          formKey.currentState!.save();

                          context.loaderOverlay.show();
                          LogInAPI()
                              .doLogIn(emilId, password)
                              .then(
                                (value) => {
                                  context.loaderOverlay.hide(),
                                  if (value.success)
                                    {
                                      ApiDeclaration.token = value.data.token,
                                      Navigator.pushNamedAndRemoveUntil(
                                        context,
                                        dashboardScreenRoute,
                                        ModalRoute.withName(logInScreenRoute),
                                      ),
                                    }
                                  else
                                    {
                                      QuickAlert.show(
                                        context: context,
                                        type: QuickAlertType.error,
                                        text: value.message,
                                      ),
                                    },
                                },
                              )
                              .catchError((error) {
                            context.loaderOverlay.hide();
                                QuickAlert.show(
                                  context: context,
                                  type: QuickAlertType.error,
                                  text: error,
                                );
                              });
                        }
                      },
                      child: const Text("Log in"),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Don't have an account?"),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, signUpScreenRoute);
                          },
                          child: const Text("Sign up"),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ))
          ],
        ),
      )
    );
  }
}
