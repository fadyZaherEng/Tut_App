import 'package:flutter_cleanarchi_with_mvvm_finished/app/app_prefs.dart';
import 'package:flutter_cleanarchi_with_mvvm_finished/app/di.dart';
import 'package:flutter_cleanarchi_with_mvvm_finished/presentation/resources/theme_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../presentation/resources/routes_manager.dart';

class MyApp extends StatefulWidget {
  // named constructor
  MyApp._internal();
  int appState = 0;

  static final MyApp _instance =
      MyApp._internal(); // singleton or single instance

  factory MyApp() => _instance; // factory

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  AppPreferences _appPreferences=instance<AppPreferences>();
  @override
  void didChangeDependencies() {
    _appPreferences.getLocale().then((locale) =>{context.setLocale(locale)} );
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: context.locale,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouteGenerator.getRoute,
      initialRoute: Routes.splashRoute,
      theme: getApplicationTheme(),
    );
  }
}
