import 'package:U_of_G_Treasure_Hunt/screens/root/root.dart';
import 'package:U_of_G_Treasure_Hunt/states/currentUser.dart';
import 'package:flutter/material.dart';
import 'package:U_of_G_Treasure_Hunt/widgets/ourContainer.dart';
import 'package:provider/provider.dart';

import '../../signup/signup.dart';

class MyLoginForm extends StatefulWidget {
  @override
  State<MyLoginForm> createState() => _MyLoginFormState();
}

class _MyLoginFormState extends State<MyLoginForm> {
  TextEditingController _cpController = TextEditingController();
  TextEditingController _pController = TextEditingController();
  TextEditingController _eController = TextEditingController();

  void _loginUser(String email, String password, BuildContext context) async {
    CurrentUser _currentUser = Provider.of<CurrentUser>(context, listen: false);

    try {
      String _returnString = await _currentUser.loginUser(email, password);
      if (_returnString == "Success") {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => MyRoot(),
          ),
          (route) => false,
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Incorrect Login Details"),
            duration: Duration(seconds: 3),
          ),
        );
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return OurContainer(
        child: Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(vertical: 19.0, horizontal: 6.0),
          child: Text(
            "Log In",
            style: TextStyle(
              color: Theme.of(context).secondaryHeaderColor,
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        TextFormField(
          controller: _eController,
          decoration: const InputDecoration(
              prefixIcon: Icon(Icons.alternate_email), hintText: "Email"),
        ),
        SizedBox(
          height: 20.0,
        ),
        TextFormField(
          controller: _pController,
          decoration: InputDecoration(
              prefixIcon: Icon(Icons.lock_outline), hintText: "Password"),
          obscureText: true,
        ),
        SizedBox(
          height: 20.0,
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Color.fromRGBO(0, 132, 61, 100),
          ),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 100),
              child: Text("Log in",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  )),
            ),
            onPressed: () {
              _loginUser(
                  _eController.text, _pController.text, context);
            }),
        TextButton(
          child: const Text("Don't have an account? Tap here to sign up"),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => MySignUp(),
              ),
            );
          },
        ),
      ],
    ));
  }
}
