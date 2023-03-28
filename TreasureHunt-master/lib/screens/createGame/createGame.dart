import 'package:U_of_G_Treasure_Hunt/services/database.dart';
import 'package:U_of_G_Treasure_Hunt/states/currentUser.dart';
import 'package:U_of_G_Treasure_Hunt/widgets/ourContainer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../root/root.dart';

class OurCreateGame extends StatefulWidget {
  const OurCreateGame({Key? key}) : super(key: key);

  @override
  State<OurCreateGame> createState() => _OurCreateGameState();
}

class _OurCreateGameState extends State<OurCreateGame> {
  void _createGame(BuildContext context, String gameName) async {
    CurrentUser _currentUser = Provider.of<CurrentUser>(context, listen: false);
    String _returnString = await OurDatabase()
        .createGame(gameName, _currentUser.getCurrentUser.uid);
    if (_returnString == "Success") {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => MyRoot(),
          ),
          (route) => false);
    }
  }

  TextEditingController _gameNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create New Game"),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 25),
            child: Image.asset("assets/logo.png"),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: OurContainer(
              child: Column(
                children: <Widget>[
                  TextFormField(
                    controller: _gameNameController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.group),
                      hintText: "Game Name",
                    ),
                  ),
                  SizedBox(height: 20.0),
                  ElevatedButton(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 100),
                      child: Text(
                        "Create",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                    onPressed: () =>
                        _createGame(context, _gameNameController.text),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
