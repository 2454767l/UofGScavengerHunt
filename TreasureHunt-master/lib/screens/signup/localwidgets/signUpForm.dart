import 'package:U_of_G_Treasure_Hunt/states/currentUser.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../widgets/ourContainer.dart';

class MySignUpForm extends StatefulWidget {
  const MySignUpForm({Key? key}) : super(key: key);

  @override
  State<MySignUpForm> createState() => _MySignUpFormState();
}

class _MySignUpFormState extends State<MySignUpForm> {
  TextEditingController _cPController = TextEditingController();
  TextEditingController _eController = TextEditingController();
  TextEditingController _tNController = TextEditingController();
  TextEditingController _pController = TextEditingController();


  Future<void> _signUpUser(String email, String password, BuildContext context,
      String teamName) async {
    CurrentUser _currentUser = Provider.of<CurrentUser>(context, listen: false);
    try {
      String _returnString =
          await _currentUser.signUpUser(email, password, teamName);
      if (_returnString == "Success") {
        Navigator.pop(context);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Sign up error"),
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
          padding: const EdgeInsets.symmetric(vertical: 19.0, horizontal: 6.0),
          child: Text(
            "Sign up",
            style: TextStyle(
              color: Theme.of(context).secondaryHeaderColor,
              fontWeight: FontWeight.bold,
              fontSize: 24.0,
            ),
          ),
        ),
        TextFormField(
          controller: _tNController,
          decoration: const InputDecoration(
              prefixIcon: Icon(Icons.person_outline), hintText: "Team Name"),
        ),
        SizedBox(
          height: 19.0,
        ),
        TextFormField(
          controller: _eController,
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.alternate_email),
            hintText: "Email",
          ),
        ),
        SizedBox(
          height: 19.0,
        ),
        TextFormField(
          controller: _pController,
          decoration: const InputDecoration(
              prefixIcon: Icon(Icons.lock_outline), hintText: "Password"),
          obscureText: true,
        ),
        SizedBox(
          height: 19.0,
        ),
        TextFormField(
          controller: _cPController,
          decoration: InputDecoration(
              prefixIcon: Icon(Icons.lock_open), hintText: "Confirm Password"),
          obscureText: true,
        ),
        SizedBox(
          height: 19.0,
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Color.fromRGBO(0, 132, 61, 100),
          ),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 100),
            child: Text(
              "Sign Up",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 19.0,
              ),
            ),
          ),
          onPressed: () {
            if (_pController.text == _cPController.text) {
              _signUpUser(_eController.text, _pController.text,
                  context, _tNController.text);
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Passwords do not match"),
                  duration: Duration(seconds: 3),
                ),
              );
            }
          },
        ),
      ],
    ));
  }
}
