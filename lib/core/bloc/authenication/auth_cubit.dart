import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../repository/user_repository.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final RepositoryAuth _repositoryAuth;
  AuthCubit(this._repositoryAuth) : super(AuthInitial());
  static AuthCubit get(BuildContext context) => BlocProvider.of(context);

  void loginWithEmailAndPassword(
      {required String email, required String password}) {
    emit(AuthLoading());
    _repositoryAuth.signWithEmail(email, password).then((value) {
      print(value!.uid);
      emit(AuthLoaded(value.uid));
    }).catchError((error) {
      emit(AuthError(error));
    });
  }

  void createWithEmailAndPassword(
      {required String email, required String password}) {
    emit(AuthLoading());
    _repositoryAuth.createWithEmail(email, password).then((value) {
      print(value!.uid);
      emit(AuthLoaded(value.uid));
    }).catchError((error) {
      emit(AuthError(error));
    });
  }

  void signWithGoogle() {
    emit(AuthLoading());
    _repositoryAuth.signInGoogle().then((value) {
      print(value!.uid);
      emit(AuthLoaded(value.uid));
    }).catchError((error) {
      emit(AuthError(error));
    });
  }
}
