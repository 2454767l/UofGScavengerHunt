import 'package:U_of_G_Treasure_Hunt/screens/login/login.dart';
import 'package:U_of_G_Treasure_Hunt/screens/root/root.dart';
import 'package:U_of_G_Treasure_Hunt/states/currentUser.dart';
import 'package:flutter/material.dart';
import 'package:U_of_G_Treasure_Hunt/utils/theme.dart';
import 'package:flutter/widgets.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const GetMaterialApp(home: MyApp0()));
}

class MyApp0 extends StatelessWidget {
  const MyApp0({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CurrentUser(),
     child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Freshers_Treasure_Hunt',
          theme: newTheme().buildTheme(),
          home: MyRoot(),
      ),
    );
  }
}

