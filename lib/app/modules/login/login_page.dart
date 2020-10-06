import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tmdb_get_pattern/app/modules/login/login_controller.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      builder: (_) => Scaffold(
        body: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Container(
            width: double.infinity,
            height: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Obx(
              () => Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CupertinoTextField(
                      keyboardType: TextInputType.emailAddress,
                      placeholder: 'Username',
                      onChanged: (text) => _.onChangeUsername(text)),
                  SizedBox(
                    height: 10,
                  ),
                  CupertinoTextField(
                      obscureText: true,
                      placeholder: 'Password',
                      onChanged: (text) => _.onChangePassword(text)),
                  SizedBox(
                    height: 10,
                  ),
                  CupertinoButton(
                    child: Text('Login'),
                    onPressed: () {
                      _.setLogging(true);
                      _.submit().whenComplete(() => _.setLogging(false),);
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  _.isLogging.value
                      ? CircularProgressIndicator(strokeWidth: 3)
                      : SizedBox(
                          height: 1,
                        ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
