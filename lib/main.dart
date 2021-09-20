import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note/core/utilities/app_local_storage.dart';
import 'core/utilities/bloc_observer.dart';
import 'ui/resources/app_routes.dart';
import 'app.dart';
import 'core/dependencies/bloc_provider.dart';
import 'core/dependencies/dependency_init.dart';

String? route;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  Bloc.observer = MyBlocObserver();

  configureDependencies();
  String? token = await AppLocalStorage.getString('uid');
  if (token == null) {
    route = AppRoute.signUp;
  } else {
    route = AppRoute.home;
  }

  runZonedGuarded(() async {
    runApp(AppMainBlocProvider(
        child: MyApp(
      route: route!,
    )));
  }, (_, __) {});
}
