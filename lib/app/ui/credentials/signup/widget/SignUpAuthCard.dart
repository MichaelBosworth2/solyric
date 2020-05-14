import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:solyric_app/app/ui/base/BaseWidget.dart';
import 'package:solyric_app/app/ui/credentials/login/widget/RaisedGradientButton.dart';
import 'package:solyric_app/app/ui/credentials/signup/viewmodel/SignUpViewModel.dart';
import 'package:solyric_app/app/utils/Validations.dart';
import 'package:solyric_app/app/utils/Resources.dart';
import 'package:solyric_app/app/utils/RouteNames.dart';
import 'package:solyric_app/app/utils/UIHelper.dart';
import 'package:solyric_app/domain/model/User.dart';


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
    return BaseWidget<SignUpViewModel>(
      child: Expanded(
        child: GestureDetector(
          onTap: () => Navigator.pushNamed(context, RouteNames.LOGIN),
          child: Center(
              child: Text(
            Resources.MEMBER,
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
                    labelText: Resources.FORGOT_EMAIL_LABEL,
                    labelStyle: const TextStyle(color: Colors.white70)),
                keyboardType: TextInputType.emailAddress,
                validator: (value) => Validations.emailValidation(value),
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
                    labelText: Resources.PASSWORD_LOGIN,
                    labelStyle: const TextStyle(color: Colors.white70)),
                keyboardType: TextInputType.emailAddress,
                validator: (value) => Validations.passwordValidation(value)
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
                    labelText: Resources.CONFIRM_PASSWORD,
                    labelStyle: const TextStyle(color: Colors.white70)),
                keyboardType: TextInputType.emailAddress,
                validator: (value) => Validations.passwordValidation(value)
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
                                  ? Navigator.pushNamed(context, RouteNames.LOGIN)
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
