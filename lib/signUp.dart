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
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Form(
        key: _formKey,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
          ),
          body: ChangeNotifierProvider<MyProvider>(
            create: (context) => MyProvider(),
            child: Consumer<MyProvider>(builder: (context, provider, child) {
              return ListView(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      FlatButton(
                        onPressed: (){

                        },
                        child: Text(
                          'SignUp',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        color: Colors.transparent,
                      ),
                      FlatButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          'Login',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                          ),
                        ),
                        color: Colors.transparent,
                      ),
                    ],
                  ),
                  MyImage(),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                    ),
                    margin: EdgeInsets.all(30),
                    padding: EdgeInsets.all(30),
                    child: Column(
                      children: [
                        TextFormField(
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
                        SizedBox(
                          height: 16,
                        ),
                        TextFormField(
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
                        SizedBox(
                          height: 16,
                        ),
                        MyPassword(password: 'Password'),
                        MyPassword(password: 'Confirm Password'),
                        SizedBox(
                          height: 30,
                        ),
                        MaterialButton(
                          child: Text(
                            'SIGN UP',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.indigo,
                            ),
                          ),
                          minWidth: 200,
                          height: 50,
                          elevation: 16,
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          onPressed: () {
                            if (_formKey.currentState.validate()) {
                              Navigator.pop(context);
                            }
                          },
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Text('Terms of service'),
                      ],
                    ),
                  ),
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}
