import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/passwordProvider.dart';

class MyPassword extends StatelessWidget {
  final password;
  

  const MyPassword({Key key, this.password}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MyProvider>(
      create: (context) => MyProvider(),
      child: Consumer<MyProvider>(builder: (context, provider, child) {
       

        return TextFormField(
          obscureText: provider.hidePwd,
          decoration: InputDecoration(
             labelText: password,
              hintText: AutofillHints.password,
              suffixIcon: IconButton(
                icon: Builder(
                  builder: (context) {
                    if (provider.hidePwd) {
                      return Icon(Icons.visibility_off);
                    }
                    return Icon(Icons.visibility);
                  },
                ),
                onPressed: () {
                  provider.setPassword();
                },
              ),
          ),
          validator: (value) {
            if (value.isEmpty) {
              return 'Please enter the password';
            }
            return null;
          },
        );
      }),
    );
  }
}
