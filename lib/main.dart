import 'package:flutter/material.dart';
import 'package:the_indian_souls/utils/constants/constants.dart';
import 'package:the_indian_souls/utils/route/route_constants.dart';
import 'package:the_indian_souls/utils/route/router.dart';
import 'package:the_indian_souls/utils/theme/app_theme.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: themeNotifier,
      builder: (_, mode, _) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'The Indian Souls',
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: mode,
          onGenerateRoute: generateRoute,
          initialRoute:dashboardScreenRoute,
        );
      },
    );
  }
}
