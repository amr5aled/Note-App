// // import 'package:firebase_crashlytics/firebase_crashlytics.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';


// import '../../core/bloc/authentication/authentication_bloc.dart';
// import '../../core/bloc/authentication/authentication_event.dart';
// import '../../core/bloc/authentication/authentication_state.dart';
// import '../resources/app_routes.dart';
// import '../resources/index.dart';

// class SplashScreen extends StatefulWidget {
//   @override
//   _SplashScreenState createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen> {
//   @override
//   void initState() {
//     Future.delayed(Duration(seconds: 3), () {
//       final AuthenticationBloc authenticationBloc = BlocProvider.of(context);
//       authenticationBloc.add(AuthenticationEventAppStarted());
//     });
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(backgroundColor: AppPalette.primaryColor, body: _buildScreen());
//   }

//   Widget _buildScreen() {
//     return BlocListener<AuthenticationBloc, AuthenticationState>(
//         listener: authenticationListener,
//         child: Center(
//           child: Image.asset(
//             "assets/images/splash_g.gif",
//             fit: BoxFit.cover,
//           ),
//         ));
//   }

//   void authenticationListener(BuildContext context, AuthenticationState state) {
//     if (state is AuthenticationStateAuthenticated) {
//       // FirebaseCrashlytics.instance.setUserIdentifier('${state.user!.id}');
//       // pushNameReplacement(context, AppRoute.home);
//     } else if (state is AuthenticationStateUnauthenticated) {
//       // FirebaseCrashlytics.instance.setUserIdentifier('unAutherizedUser');
//     //   if (state.isFirst) {
//     //     pushNameReplacement(context, AppRoute.onBoarding);
//     //   } else {
//     //     pushNameReplacement(context, AppRoute.login);
//     //   }
//     // }
//   }
// }
