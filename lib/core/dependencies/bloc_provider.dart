import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/authenication/auth_cubit.dart';
import '../bloc/index.dart';
import '../bloc/record/record_cubit.dart';
import '../repository/record_repository.dart';
import '../repository/user_repository.dart';
import 'dependency_init.dart';

class AppMainBlocProvider extends StatelessWidget {
  AppMainBlocProvider({this.child});
  final LanguageBloc languageBloc = getIt<LanguageBloc>();
  // final AuthenticationBloc authenticationBloc = getIt<AuthenticationBloc>();

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: <BlocProvider<dynamic>>[
        BlocProvider<LanguageBloc>(
            create: (BuildContext context) =>
                languageBloc..add(LanguageAppStartEvent())),
        BlocProvider<AuthCubit>(
            create: (BuildContext context) => AuthCubit(RepositoryAuth())),
        BlocProvider<RecordCubit>.value(
            value: RecordCubit(RecordRepository())..getVoices())
      ],
      child: child!,
    );
  }
}
