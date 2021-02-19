import 'package:flutter/material.dart';
import 'package:login_app/providers/passwordProvider.dart';
import 'package:login_app/signUp.dart';
import 'package:provider/provider.dart';
import 'myImage.dart';
import 'myPassword.dart';

class Login extends StatelessWidget {
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
                        onPressed: () {},
                        child: Text(
                          'Login',
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
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SignUp()),
                          );
                        },
                        child: Text(
                          'SignUp',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                          ),
                        ),
                        color: Colors.transparent,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 16,
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
                            labelText: 'Username or email address',
                            hintText: AutofillHints.email,
                          ),
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please enter username or email address';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        MyPassword(),
                        SizedBox(
                          height: 40,
                        ),
                        MaterialButton(
                          child: Text(
                            'LOG IN',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.indigo,
                            ),
                          ),
                          elevation: 16,
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          onPressed: () {
                            if (_formKey.currentState.validate()) {
                              Navigator.pop(context);
                            }
                          },
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Text('Login with'),
                        SizedBox(
                          height: 18,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Image.asset(
                              'assets/images/google+.png',
                              height: 50,
                            ),
                            Image.asset(
                              'assets/images/twitter.png',
                              height: 50,
                              //   width: 90,
                            ),
                            Image.asset(
                              'assets/images/facebook.png',
                              height: 50,
                              // width: 90,
                            ),
                          ],
                        ),
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
