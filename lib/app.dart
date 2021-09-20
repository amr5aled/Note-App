// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'core/bloc/index.dart';
import 'ui/helper/route_generator.dart';
import 'ui/localization/app_localizations.dart';
import 'ui/resources/index.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final String route;

  const MyApp({Key? key, required this.route}) : super(key: key);

  
  
  @override
  Widget build(BuildContext context) {
    // use the returned token to send messages to users from your custom server

    return RefreshConfiguration(
      headerBuilder: () => const MaterialClassicHeader(),
      child: ScreenUtilInit(
          designSize: const Size(360, 640),
          builder: () {
            return BlocBuilder<LanguageBloc, LanguageState>(
                builder: (BuildContext context, LanguageState snapshot) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                supportedLocales: const <Locale>[
                  AppLocalizations.arLocale,
                  AppLocalizations.enLocale
                ],
                locale: Locale(LanguageBloc.lang),
                localizationsDelegates: const <LocalizationsDelegate<dynamic>>[
                  AppLocalizations.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                  DefaultCupertinoLocalizations.delegate
                ],
                onGenerateRoute: RouteGenerator.generateRoute,
                // navigatorObservers: <NavigatorObserver>[
                //   FirebaseAnalyticsObserver(analytics: analytics),
                // ],
                initialRoute: route,

                theme: ThemeData(
                  backgroundColor: AppPalette.backgroundColor,
                  primaryColor: AppPalette.primaryColor,
                  // accentColor: AppPalette.accentColor,
                ),
              );
            });
          }),
    );
  }
}
