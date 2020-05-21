import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:solyric_app/app/ui/base/BaseWidget.dart';
import 'package:solyric_app/app/ui/credentials/forgot/viewmodel/ForgotPasswordViewModel.dart';
import 'package:solyric_app/app/utils/Validations.dart';
import 'package:solyric_app/app/utils/Resources.dart';
import 'package:solyric_app/app/utils/RouteNames.dart';
import 'package:solyric_app/app/utils/UIHelper.dart';

import '../../login/widget/RaisedGradientButton.dart';

class ForgotAuthCard extends StatefulWidget {
  @override
  _ForgotAuthCardState createState() => _ForgotAuthCardState();
}

class _ForgotAuthCardState extends State<ForgotAuthCard> {
  final _emailController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BaseWidget<ForgotPasswordViewModel>(
      builder: (context, model, child) => Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.only(left: 45, right: 45),
          child: Column(
            children: [
              UIHelper.verticalSpaceLarge,
              UIHelper.verticalSpaceSmall,
              TextFormField(
                style: const TextStyle(color: Colors.white70),
                controller: _emailController,
                 decoration:  InputDecoration(
                  enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white70)),
                  labelText: Resources.FORGOT_EMAIL_LABEL.toUpperCase(),
                  labelStyle: const TextStyle(color: Colors.white, )
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) => Validations.emailValidation(value),
              ),
              UIHelper.verticalSpaceLarge,
              UIHelper.verticalSpaceLarge,
              model.isLoading
                  ? const CircularProgressIndicator()
                  : Padding(
                padding: const EdgeInsets.only(right: 65, left: 65),
                child: RaisedGradientButton(
                  onPressed: () async {
                    if (!_formKey.currentState.validate()) return;
                    _formKey.currentState.save();

                    await model.forgotPassword(_emailController.text)
                        ? UIHelper.showMessage(context, Resources.EMAIL_SENT)
                        : UIHelper.showMessage(context, Resources.NO_USER_FOUND);
                  },
                  child: const Text(
                    Resources.SEND,
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  height: 44,
                  gradient: const LinearGradient(
                    colors: <Color>[Colors.blueAccent, Colors.purpleAccent],
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
    _emailController.dispose();
    super.dispose();
  }
}
