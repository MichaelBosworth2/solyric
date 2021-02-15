import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:solyric_app/app/ui/base/BaseWidget.dart';
import 'package:solyric_app/app/ui/credentials/login/viewmodel/LoginViewModel.dart';
import 'package:solyric_app/app/utils/Resources.dart';
import 'package:solyric_app/app/utils/RouteNames.dart';
import 'package:solyric_app/app/utils/UIHelper.dart';
import 'package:solyric_app/app/utils/Validations.dart';
import 'package:solyric_app/domain/model/User.dart';

import 'RaisedGradientButton.dart';

class LoginAuthCard extends StatefulWidget {
  @override
  _LoginAuthCardState createState() => _LoginAuthCardState();
}

class _LoginAuthCardState extends State<LoginAuthCard> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final _passwordController = TextEditingController();
  final _emailController = TextEditingController();

  final _focusOutlineInputBorder = OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.white),
      borderRadius: BorderRadius.circular(40));
  final _normalOutlineInputBorder = OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.white24),
      borderRadius: BorderRadius.circular(40));
  final _errorOutlineInputBorder = OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.red),
      borderRadius: BorderRadius.circular(40));

  @override
  Widget build(BuildContext context) {
    return BaseWidget<LoginViewModel>(
      child: GestureDetector(
        onTap: () => Navigator.pushNamed(context, RouteNames.FORGOT_PASSWORD),
        child: const Text(
          Resources.FORGOT_LOGIN,
          style: TextStyle(color: Colors.white70, fontSize: 14),
        ),
      ),
      builder: (context, model, child) => Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.only(left: 60, right: 60),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildEmailTextField(),
              UIHelper.verticalSpace(15),
              _buildPasswordTextField(),
              UIHelper.verticalSpace(15),
              child,
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 5, right: 5),
                child: model.isLoading
                    ? CircularProgressIndicator()
                    : _buildRaisedGradientButton(model),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Builds Email text field
  _buildEmailTextField() => TextFormField(
      style: const TextStyle(color: Colors.white70),
      autofocus: false,
      controller: _emailController,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 5),
          filled: true,
          fillColor: Colors.black54,
          border: _normalOutlineInputBorder,
          focusedBorder: _focusOutlineInputBorder,
          enabledBorder: _normalOutlineInputBorder,
          errorBorder: _errorOutlineInputBorder,
          prefixIcon: Padding(
              padding: EdgeInsets.all(16),
              child: SvgPicture.asset(Resources.IC_USER,
                  height: 12, color: Colors.white60)),
          labelText: Resources.FORGOT_EMAIL_LABEL,
          labelStyle: const TextStyle(color: Colors.white)),
      keyboardType: TextInputType.emailAddress,
      validator: (value) => Validations.emailValidation(value));

  /// Builds password text field
  _buildPasswordTextField() => TextFormField(
      autofocus: false,
      obscureText: true,
      style: TextStyle(color: Colors.white70),
      controller: _passwordController,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 5),
          filled: true,
          fillColor: Colors.black54,
          border: _normalOutlineInputBorder,
          focusedBorder: _focusOutlineInputBorder,
          enabledBorder: _normalOutlineInputBorder,
          errorBorder: _errorOutlineInputBorder,
          prefixIcon: Padding(
              padding: EdgeInsets.all(16),
              child: SvgPicture.asset(Resources.IC_LOCK,
                  height: 12, color: Colors.white70)),
          labelText: Resources.PASSWORD_LOGIN,
          labelStyle: TextStyle(color: Colors.white)),
      keyboardType: TextInputType.visiblePassword,
      validator: (value) => Validations.passwordValidation(value));

  /// Builds login Button
  _buildRaisedGradientButton(LoginViewModel model) => RaisedGradientButton(
        onPressed: () async {
          if (!_formKey.currentState.validate()) return;
          _formKey.currentState.save();

          await model.login(User(
                  email: _emailController.text,
                  password: _passwordController.text))
              ? Navigator.pushNamed(context, RouteNames.HOME)
              : UIHelper.showMessage(
                  context, Resources.EMAIL_PASSWORD_IS_INCORRECT_LOGIN);
        },
        height: 44,
        child: Text(
          Resources.SIGN_IN,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        gradient: LinearGradient(
          colors: <Color>[Colors.blueAccent, Colors.purpleAccent],
        ),
      );

  @override
  void dispose() {
    _passwordController.dispose();
    _emailController.dispose();
    super.dispose();
  }
}
