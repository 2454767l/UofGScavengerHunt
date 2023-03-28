import 'package:flutter/material.dart';
import 'package:U_of_G_Treasure_Hunt/screens/login/localwidgets/loginForm.dart';

class MyLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
        Expanded(
          child: ListView(
            padding: EdgeInsets.all(19.0),
            children: <Widget>[
              Padding(padding: EdgeInsets.all(39.0),
              child: Image.asset("assets/logo.png"),
              ),
              SizedBox(height: 15.0,),
              MyLoginForm(),
            ],
          ),
        )
      ],
      ),
    );
  }
}
