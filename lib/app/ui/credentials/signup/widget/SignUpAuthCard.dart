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
import 'package:solyric_app/app/utils/AuthStatus.dart';


class SignUpAuthCard extends StatefulWidget {
  @override
  _SignUpAuthCardState createState() => _SignUpAuthCardState();
}

class _SignUpAuthCardState extends State<SignUpAuthCard> {
  final _passwordConfirmationController = TextEditingController();
  final _passwordController = TextEditingController();
  final _emailController = TextEditingController();
  final _usernameController = TextEditingController();
   bool isAvailableUsername = false;
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
              style: TextStyle(color: Colors.white),
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
                style: const TextStyle(color: Colors.white),
                controller: _usernameController,
                onChanged: (value) => usernameAvailableState(value, model),
                decoration:  InputDecoration(
                    enabledBorder: const UnderlineInputBorder(            
                        borderSide: BorderSide(color: Colors.white70)),
                    labelText: Resources.USERNAME.toUpperCase(),
                    labelStyle: const TextStyle(color: Colors.white),
                   /* errorStyle: TextStyle(
                      color: isAvailableUsername? Colors.green : Colors.red
                    ),*/
                  ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) => Validations.usernameValidation(value, isAvailableUsername),
              ),
              UIHelper.verticalSpace(40),
              TextFormField(
                style: const TextStyle(color: Colors.white),
                controller: _emailController,
                decoration:  InputDecoration(
                    enabledBorder: const UnderlineInputBorder(
                      borderSide: const BorderSide(color: Colors.white70)),
                    labelText: Resources.FORGOT_EMAIL_LABEL.toUpperCase(),
                    labelStyle: const TextStyle(color: Colors.white)),
                keyboardType: TextInputType.emailAddress,
                validator: (value) => Validations.emailValidation(value),
              ),
              UIHelper.verticalSpaceLarge,
              TextFormField(
                obscureText: true,
                style: const TextStyle(color: Colors.white),
                controller: _passwordController,
                decoration:  InputDecoration(
                    enabledBorder: const UnderlineInputBorder(
                      borderSide: const BorderSide(color: Colors.white70)),
                    labelText: Resources.PASSWORD_LOGIN.toUpperCase(),
                    labelStyle: const TextStyle(color: Colors.white)),
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
                              AuthStatus _authStatus = await model.signUp(User(
                                      email: _emailController.text,
                                      password: _passwordController.text,
                                      username: _usernameController.text));

                              switch(_authStatus){
                                case AuthStatus.SIGNUP_SUCCESSFULLY:
                                  Navigator.pushNamed(context, RouteNames.WALL);
                                break;
                                case AuthStatus.EMAIL_EXIST:
                                  UIHelper.showMessage(context, Resources.EMAIL_EXIST);
                                break;
                                case AuthStatus.UNDEFINED_ERROR:
                                  UIHelper.showMessage(context, Resources.SIGN_UP_UNDEFINED);
                                break;
                                default:
                                  UIHelper.showMessage(context, Resources.SIGN_UP_UNDEFINED);
                                break;
                              }
                            },
                            child: Text(
                              Resources.SIGN_UP.toUpperCase(),
                              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                            ),
                            height: 44,
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

  void usernameAvailableState(String username, SignUpViewModel model) async{
    print(username);
    if(username != null && username.length >= 3){
        AuthStatus _authStatus = await model.isExistUsername(username);
        print(' existe username $_authStatus ');
        setState(() {
            if (_authStatus == AuthStatus.USERNAME_AVAILABLE){
              isAvailableUsername = true;
            } else {
              isAvailableUsername = false;
            }
        });
    }
  }
}
