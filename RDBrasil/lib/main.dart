import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:superhero_app/providers/app_provider.dart';
import 'package:superhero_app/screens/home.dart';
import 'package:superhero_app/screens/login.dart';
import 'package:superhero_app/util/const.dart';
import 'package:superhero_app/util/theme_config.dart';

void main() {
// comments => uso do provider como forma eficaz de gerenciamento de estado.

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AppProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(
      builder: (BuildContext context, AppProvider appProvider, Widget child) {
        return MaterialApp(
          key: appProvider.key,
          debugShowCheckedModeBanner: false,
          navigatorKey: appProvider.navigatorKey,
          title: Constants.appName,
          theme: appProvider.theme,
          darkTheme: ThemeConfig.darkTheme,
          home: Login(),
        );
      },
    );
  }
}
