import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:haradan/deneme.dart';
import 'package:haradan/routes.dart';
import 'package:haradan/screens/profile/profile_screen.dart';
import 'package:haradan/screens/sign_in/sign_in_screen.dart';
import 'package:haradan/screens/splash/splash_screen.dart';
import 'package:haradan/services/google_login_services.dart';
import 'package:haradan/theme.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

void main() {
  runApp(
    Provider(
      create: (_) => LoginService(),
      child: MaterialApp(
        theme: theme(),
        debugShowCheckedModeBanner: false,
        initialRoute: SplashScreen.routeName,
        routes: routes,
      ),
    ),
  );
}

