import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_app/myPassword.dart';
import 'package:provider/provider.dart';

import 'login.dart';
import 'myImage.dart';
import 'providers/passwordProvider.dart';

class SignUp extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext mainContext) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          constraints:
              BoxConstraints(minHeight: MediaQuery.of(mainContext).size.height),
          child: Form(
            key: _formKey,
            child: ChangeNotifierProvider<MyProvider>(
              create: (context) => MyProvider(),
              child: Consumer<MyProvider>(builder: (context, provider, child) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          'Sign Up',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            color: Colors.black,
                          ),
                        ),
                        FlatButton(
                          onPressed: () {
                            Navigator.pop(mainContext);
                          },
                          child: Text(
                            'Login',
                            style: TextStyle(
                              fontSize: 20,
                              color: Color(0xff999999),
                            ),
                          ),
                          color: Colors.transparent,
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        MyImage(),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 32,
                            vertical: 6,
                          ),
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: 'email address',
                              hintText: AutofillHints.email,
                            ),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter email';
                              }
                              return null;
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 32,
                            vertical: 6,
                          ),
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: 'username',
                              hintText: AutofillHints.username,
                            ),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter username';
                              }
                              return null;
                            },
                          ),
                        ),
                        Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 32,
                              vertical: 6,
                            ),
                            child: MyPassword(password: 'Password')),
                        Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 32,
                              vertical: 6,
                            ),
                            child: MyPassword(password: 'Confirm Password')),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 32,
                            vertical: 6,
                          ),
                          child: MaterialButton(
                            elevation: 6,
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.check,
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  'SIGN UP',
                                ),
                              ],
                            ),
                            textColor: Colors.indigoAccent,
                            onPressed: () {
                              if (_formKey.currentState.validate()) {
                                Navigator.pop(context);
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'Terms of service',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xff999999),
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}
