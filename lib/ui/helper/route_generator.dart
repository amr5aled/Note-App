import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../screens/home/view/home_view.dart';
import '../screens/auth/login_screen.dart';
import '../screens/auth/signup_screen.dart';



// import '../../core/models/index.dart';
import '../resources/app_routes.dart';
import '../resources/index.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    final dynamic args = settings.arguments;
    switch (settings.name) {

      // Login Screen
      case AppRoute.login:
        return _screenInit(LoginScreen());
      // Signup Screen
      case AppRoute.signUp:
        return _screenInit(SignUpScreen());
      case AppRoute.home:
        return _screenInit(HomeView());

      default:
        // If there is no such named route in the switch statement, e.g. /third
        return _errorRoute();
    }
  }

  static MaterialPageRoute<dynamic> _screenInit(Widget screen) {
    return MaterialPageRoute<dynamic>(builder: (_) => screen);
  }

  static CupertinoPageRoute<dynamic> _screenPresent(Widget screen) {
    return CupertinoPageRoute<dynamic>(
      fullscreenDialog: true,
      builder: (_) => screen,
    );
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute<dynamic>(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
