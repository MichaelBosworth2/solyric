import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:solyric_app/core/constraints/app_constraints.dart';
import 'package:solyric_app/core/model/User.dart';
import 'package:solyric_app/ui/shared/Resources.dart';
import 'package:solyric_app/ui/shared/form_validations.dart';
import 'package:solyric_app/ui/shared/ui_helper.dart';
import 'package:solyric_app/ui/viewmodel/auth_viewmodel.dart';
import 'package:solyric_app/ui/widget/base_widget.dart';

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
    return BaseWidget<AuthenticationViewModel>(
      model: AuthenticationViewModel(authService: Provider.of(context)),
      child: GestureDetector(
        onTap: () => Navigator.pushNamed(context, Routes.forgotPassword),
        child: const Text(
          Resources.loginForgot,
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
                    labelText: Resources.forgotEmailLabel,
                    labelStyle: const TextStyle(color: Colors.white70)),
                keyboardType: TextInputType.emailAddress,
                validator: (value) => FormValidations.emailValidation(value),
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
                    labelText: Resources.loginPassword,
                    labelStyle: TextStyle(
                        color: Colors.white70, fontStyle: FontStyle.italic)),
                keyboardType: TextInputType.visiblePassword,
                validator: (value) => FormValidations.passwordValidation(value),
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
                              ? Navigator.pushNamed(context, Routes.myWall)
                              : UIHelper.custom(context, model.error);
                        },
                        child: Text(
                          Resources.signIn,
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
