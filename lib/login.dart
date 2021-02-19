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
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height
          ),
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
                          'Login',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        FlatButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => SignUp()),
                            );
                          },
                          child: Text(
                            'Sign Up',
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
                              vertical: 6
                          ),
                          child: TextFormField(
                            decoration: InputDecoration(
                                hintText: 'Username or email address',
                                labelStyle: TextStyle(
                                    color: Color(0xff666666)
                                ),
                                hintStyle: TextStyle(
                                    color: Color(0xff666666)
                                )
                            ),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter username or email address';
                              }
                              return null;
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 32,
                              vertical: 6
                          ),
                          child: MyPassword(),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 32,
                              vertical: 16
                          ),
                          child: MaterialButton(
                            color: Colors.white,
                            elevation: 6,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16)
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                    Icons.check
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Text(
                                    'LOG IN'
                                ),
                              ],
                            ),
                            onPressed: (){

                            },
                            textColor: Colors.indigoAccent,
                          ),
                        ),
                      ],
                    ),



                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'Login with',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Color(0xff999999)
                          ),
                        ),

                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 32
                          ),
                          child: Row(
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
                        ),
                      ],
                    )

                    // Container(
                    //   decoration: BoxDecoration(
                    //     color: Colors.transparent,
                    //   ),
                    //   margin: EdgeInsets.all(30),
                    //   padding: EdgeInsets.all(30),
                    //   child: Column(
                    //     children: [
                    //
                    //       TextFormField(
                    //         decoration: InputDecoration(
                    //           labelText: 'Username or email address',
                    //           hintText: AutofillHints.email,
                    //         ),
                    //         validator: (value) {
                    //           if (value.isEmpty) {
                    //             return 'Please enter username or email address';
                    //           }
                    //           return null;
                    //         },
                    //       ),
                    //       SizedBox(
                    //         height: 16,
                    //       ),
                    //
                    //       SizedBox(
                    //         height: 40,
                    //       ),
                    //       MaterialButton(
                    //         child: Text(
                    //           'LOG IN',
                    //           style: TextStyle(
                    //             fontSize: 20,
                    //             color: Colors.indigo,
                    //           ),
                    //         ),
                    //         elevation: 16,
                    //         color: Colors.white,
                    //         shape: RoundedRectangleBorder(
                    //           borderRadius: BorderRadius.circular(16),
                    //         ),
                    //         onPressed: () {
                    //           if (_formKey.currentState.validate()) {
                    //             Navigator.pop(context);
                    //           }
                    //         },
                    //       ),
                    //       SizedBox(
                    //         height: 40,
                    //       ),
                    //       Text('Login with'),
                    //       SizedBox(
                    //         height: 18,
                    //       ),
                    //       Row(
                    //         mainAxisAlignment: MainAxisAlignment.spaceAround,
                    //         children: [
                    //           Image.asset(
                    //             'assets/images/google+.png',
                    //             height: 50,
                    //           ),
                    //           Image.asset(
                    //             'assets/images/twitter.png',
                    //             height: 50,
                    //             //   width: 90,
                    //           ),
                    //           Image.asset(
                    //             'assets/images/facebook.png',
                    //             height: 50,
                    //             // width: 90,
                    //           ),
                    //         ],
                    //       ),
                    //     ],
                    //   ),
                    // ),
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
