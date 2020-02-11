import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:solyric_app/core/constraints/app_constraints.dart';
import 'package:solyric_app/core/model/User.dart';
import 'package:solyric_app/ui/shared/Resources.dart';
import 'package:solyric_app/ui/shared/ui_helper.dart';
import 'package:solyric_app/ui/viewmodel/auth_viewmodel.dart';
import 'package:solyric_app/ui/widget/base_widget.dart';
import 'package:solyric_app/ui/widget/login/RaisedGradientButton.dart';

class SignUpAuthCard extends StatefulWidget {
  @override
  _SignUpAuthCardState createState() => _SignUpAuthCardState();
}

class _SignUpAuthCardState extends State<SignUpAuthCard> {
  final _passwordConfirmationController = TextEditingController();
  final _passwordController = TextEditingController();
  final _emailController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BaseWidget<AuthenticationViewModel>(
      model: AuthenticationViewModel(authService: Provider.of(context)),
      child: Expanded(
        child: GestureDetector(
          onTap: () => Navigator.pushNamed(context, Routes.login),
          child: Center(
              child: Text(
            Resources.member,
            style: TextStyle(color: Colors.white70),
          )),
        ),
      ),
      builder: (context, model, child) => Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.only(left: 45, right: 45),
          child: Column(
            children: [
              UIHelper.verticalSpace(40),
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
                validator: (value) => null,
              ),
              UIHelper.verticalSpaceLarge,
              TextFormField(
                obscureText: true,
                style: const TextStyle(color: Colors.white70),
                controller: _passwordController,
                decoration: const InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white70)),
                    prefixIcon: const Icon(
                      Icons.lock_open,
                      color: Colors.white70,
                    ),
                    labelText: Resources.loginPassword,
                    labelStyle: const TextStyle(color: Colors.white70)),
                keyboardType: TextInputType.emailAddress,
                validator: (value) => null,
              ),
              UIHelper.verticalSpaceLarge,
              TextFormField(
                obscureText: true,
                style: const TextStyle(color: Colors.white70),
                controller: _passwordConfirmationController,
                decoration: const InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white70)),
                    prefixIcon: const Icon(
                      Icons.lock_outline,
                      color: Colors.white70,
                    ),
                    labelText: Resources.confirmPassword,
                    labelStyle: const TextStyle(color: Colors.white70)),
                keyboardType: TextInputType.emailAddress,
                validator: (value) => null,
              ),
              UIHelper.verticalSpaceLarge,
              Row(
                children: <Widget>[
                  Expanded(
                    child: model.isLoading
                        ? Center(child: CircularProgressIndicator())
                        : RaisedGradientButton(
                            onPressed: () async {
                              if (!_formKey.currentState.validate()) return;
                              _formKey.currentState.save();

                              await model.signUp(User(
                                      email: _emailController.text,
                                      password: _passwordController.text))
                                  ? Navigator.pushNamed(context, Routes.login)
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
                  UIHelper.horizontalSpace(8),
                  child
                ],
              ),
              UIHelper.verticalSpaceLarge,
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _passwordConfirmationController.dispose();
    _passwordController.dispose();
    _emailController.dispose();
    super.dispose();
  }
}
