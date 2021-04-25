import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:haradan/screens/login_success/login_success_screen.dart';
import 'package:haradan/screens/sign_in/sign_in_screen.dart';
import 'package:haradan/screens/splash/components/body.dart';
import 'package:haradan/size_config.dart';

import 'package:provider/provider.dart';
class SplashScreen extends StatelessWidget {
  static String routeName = "/splash";
  @override
  Widget build(BuildContext context) {
    // You have to call it on your starting screen
    SizeConfig().init(context);
    return Scaffold(
      body: Body(),
    );
  }
}



  /*child: Scaffold(
  body: ChangeNotifierProvider(
  create: (context) => GoogleSignInProvider(),
  child: StreamBuilder(
  stream: FirebaseAuth.instance.authStateChanges(),
  builder: (context,snapshot){
  final provider = Provider.of<GoogleSignInProvider>(context);

  if (provider.isSigningIn) {
  return buildLoading();
  } else if (snapshot.hasData) {
  return LoginSuccessScreen();
  } else {
  return SignInScreen();
  }

  },
  ),
  ),
  ),

   Widget buildLoading() => Stack(
    fit: StackFit.expand,
    children: [
      CustomPaint(painter: BackgroundPainter()),
      Center(child: CircularProgressIndicator()),
    ],
  );



  */



