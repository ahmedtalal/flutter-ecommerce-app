import 'package:e_commerce/SplashScreen.dart';
import 'package:e_commerce/Provider/ModelHud.dart';
import 'package:e_commerce/Provider/UserTypeProvider.dart';
import 'package:e_commerce/Others/RoutingModel.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); // is used to interact with firebase engine >>
  await Firebase.initializeApp();
  runApp(EcommerceApp());
}
// ignore: must_be_immutable
class EcommerceApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ModelHud>(
          create: (context) => ModelHud(),
        ),
        ChangeNotifierProvider<UserTypeProvider>(
          create: (context) => UserTypeProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: SplashScreen.ID,
        routes: route,
      ),
    );
  }
}
