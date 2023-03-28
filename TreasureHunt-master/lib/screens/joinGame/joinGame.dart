import 'package:U_of_G_Treasure_Hunt/widgets/ourContainer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import '../../services/database.dart';
import '../../states/currentUser.dart';
import '../root/root.dart';

class OurJoinGame extends StatefulWidget {
  const OurJoinGame({Key? key}) : super(key: key);

  @override
  State<OurJoinGame> createState() => _OurJoinGame();
}

class _OurJoinGame extends State<OurJoinGame> {
  void _joinGame(BuildContext context, String gameId) async {
    CurrentUser _currentUser = Provider.of<CurrentUser>(context, listen: false);
    String _returnString =
        await OurDatabase().joinGame(gameId, _currentUser.getCurrentUser.uid);
    if (_returnString == "Success") {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => MyRoot(),
          ),
          (route) => false);
    }
  }

  TextEditingController _gameIdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Join Game"),
      ),
      body: Column(
        children: <Widget>[
          //SizedBox( height: 20,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 25),
            child: Image.asset("assets/logo.png"),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: OurContainer(
              child: Column(
                children: <Widget>[
                  TextFormField(
                    controller: _gameIdController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.group),
                      hintText: "Game Id",
                    ),
                  ),
                  SizedBox(height: 20.0),
                  ElevatedButton(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 100),
                      child: Text(
                        "Join",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                    onPressed: () => _joinGame(context, _gameIdController.text),
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
