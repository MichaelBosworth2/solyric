import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:solyric_app/app/ui/base/BaseWidget.dart';
import 'package:solyric_app/app/ui/credentials/login/viewmodel/LoginViewModel.dart';
import 'package:solyric_app/app/utils/Validations.dart';
import 'package:solyric_app/app/utils/Resources.dart';
import 'package:solyric_app/app/utils/RouteNames.dart';
import 'package:solyric_app/app/utils/UIHelper.dart';
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

  @override
  Widget build(BuildContext context) {
    return BaseWidget<LoginViewModel>(
      child: GestureDetector(
        onTap: () => Navigator.pushNamed(context, RouteNames.FORGOT_PASSWORD),
        child: const Text(
          Resources.FORGOT_LOGIN,
          style: TextStyle(color: Colors.white70, fontSize: 18),
        ),
      ),
      builder: (context, model, child) => Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.only(left: 45, right: 45),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                style: const TextStyle(color: Colors.white70),
                controller: _emailController,
                decoration: const InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white70)),
                    prefixIcon: const Icon(
                      Icons.supervised_user_circle,
                      color: Colors.white70,
                    ),
                    labelText: Resources.FORGOT_EMAIL_LABEL,
                    labelStyle: const TextStyle(color: Colors.white70)),
                keyboardType: TextInputType.emailAddress,
                validator: (value) => Validations.emailValidation(value),
                onSaved: (value) => null,
              ),
              UIHelper.verticalSpaceLarge,
              TextFormField(
                obscureText: true,
                style: TextStyle(color: Colors.white70),
                controller: _passwordController,
                decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white70)),
                    prefixIcon: Icon(Icons.lock_outline, color: Colors.white70),
                    labelText: Resources.PASSWORD_LOGIN,
                    labelStyle: TextStyle(
                        color: Colors.white70, fontStyle: FontStyle.italic)),
                keyboardType: TextInputType.visiblePassword,
                validator: (value) => Validations.passwordValidation(value),
                onSaved: (value) => null,
              ),
              UIHelper.verticalSpaceLarge,
              child,
              Padding(
                padding: const EdgeInsets.only(left: 45, right: 45, top: 20),
                child: model.isLoading
                    ? CircularProgressIndicator()
                    : RaisedGradientButton(
                        onPressed: () async {
                          if (!_formKey.currentState.validate()) return;
                          _formKey.currentState.save();

                          await model.login(User(
                                  email: _emailController.text,
                                  password: _passwordController.text))
                              ? Navigator.pushNamed(context, RouteNames.WALL)
                              : UIHelper.errorMessage(context);
                        },
                        child: Text(
                          Resources.SIGN_IN,
                          style: TextStyle(color: Colors.white70),
                        ),
                        gradient: LinearGradient(
                          colors: <Color>[
                            Colors.blueAccent,
                            Colors.purpleAccent
                          ],
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _passwordController.dispose();
    _emailController.dispose();
    super.dispose();
  }
}
