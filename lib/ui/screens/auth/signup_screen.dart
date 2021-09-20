import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/bloc/authenication/auth_cubit.dart';
import '../../../core/utilities/app_local_storage.dart';
import '../../resources/app_routes.dart';
import '../../helper/app_validator.dart';
import '../../helper/navigator.dart';
import '../../resources/index.dart';
import '../../widgets/app_padding.dart';
import '../../widgets/app_size_boxes.dart';
import '../../widgets/form_fields/index.dart';
import '../../widgets/index.dart';
import '../../helper/index.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen();

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return AppPadding(
      padding: EdgeInsets.only(top: 70.h),
      child: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: AppPadding(
            child: Column(
              children: [
                32.heightBox,
                _buildSignUpToAccount(),
                32.heightBox,
                _buildEmailInput(),
                16.heightBox,
                _buildPasswordInput(),
                32.heightBox,
                _buildSignUpButton(),
                16.heightBox,
                _buildOrText(),
                16.heightBox,
                _buildGoogleLogin(),
                16.heightBox,
                _buildFacebookButton(),
                16.heightBox,
                _buildHaveAccount(),
                _buildBlocListener()
              ],
            ),
          ),
        ),
      ),
    );
  }

  AppText _buildSignUpToAccount() {
    return AppText(
      translation: AppStrings.signUpToYourAccount,
      style: AppTextStyles.h2,
    );
  }

  _buildEmailInput() {
    return AppTextInputField(
      controller: _emailController,
      hintText: AppStrings.yourEmail,
      validator: (value) {
        return AppValidator.validatorEmail(value!, context);
      },
    );
  }

  _buildPasswordInput() {
    return AppPasswordInputField(
      controller: _passwordController,
      hintText: AppStrings.password,
      validator: (value) {
        return AppValidator.validatorPassword(value!, context);
      },
    );
  }

  _buildSignUpButton() {
    return !isLoading
        ? AppButton(
            translation: AppStrings.signUp,
            onTap: () {
              if (formKey.currentState!.validate()) {
                formKey.currentState!.save();
                AuthCubit.get(context).createWithEmailAndPassword(
                    email: _emailController.text,
                    password: _passwordController.text);
              }
              setState(() {
                isLoading = true;
              });
            },
          )
        : Center(
            child: CircularProgressIndicator(),
          );
  }

  _buildOrText() {
    return AppText(
      translation: AppStrings.or,
      style: AppTextStyles.title1.copyWith(
        color: AppPalette.textColor,
      ),
    );
  }

  Widget _buildGoogleLogin() {
    return AppButton(
      translation: AppStrings.continueWithGoogle,
      iconData: AppImages.googleLogo,
      color: Colors.transparent,
      borderColor: AppPalette.borderColor,
      textColor: AppPalette.textColor,
      onTap: () {
        AuthCubit.get(context).signWithGoogle();
      },
    );
  }

  Widget _buildFacebookButton() {
    return AppButton(
      translation: AppStrings.signUpWithFacebook,
      iconData: AppImages.facebookLogo,
      color: Colors.blue,
    );
  }

  Widget _buildHaveAccount() {
    return InkWell(
      onTap: () => pushName(context, AppRoute.login),
      child: AppText(
        translation: AppStrings.alreadyHaveAccountLogin,
        style: AppTextStyles.title2.copyWith(color: AppPalette.primaryColor),
      ),
    );
  }

  _buildBlocListener() {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthLoaded) {
          AppLocalStorage.saveString('uid', state.uid);
          pushNameReplacement(context, AppRoute.home);
        }
      },
      child: Container(),
    );
  }
}
