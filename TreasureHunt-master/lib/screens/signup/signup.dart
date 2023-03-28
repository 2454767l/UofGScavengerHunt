import 'package:flutter/material.dart';
import 'package:U_of_G_Treasure_Hunt/screens/signup/localwidgets/signUpForm.dart';

import '../../widgets/ourContainer.dart';

class MySignUp extends StatelessWidget {
  const MySignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
        Expanded(
          child: ListView(
            padding: EdgeInsets.all(19.0),
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  BackButton(),
                ],
              ),
              SizedBox(height: 39.0,),
              MySignUpForm(),
            ],
          ),
        )
      ],
      ),
    );
  }
}
