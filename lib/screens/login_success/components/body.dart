

import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:haradan/components/default_button.dart';
import 'package:haradan/screens/home/home_screen.dart';
import 'package:haradan/screens/sign_in/components/body.dart';
import 'package:haradan/screens/sign_in/components/sign_form.dart';
import 'package:haradan/screens/sign_in/sign_in_screen.dart';
import 'package:haradan/services/google_login_services.dart';
import 'package:haradan/services/login_user_model.dart';
import 'package:haradan/size_config.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:google_sign_in/google_sign_in.dart';



class BodyScreen extends StatelessWidget{

MediaQuery _mediaQueryData;
  @override
  Widget build(BuildContext context) {
    LoginService loginService =Provider.of<LoginService>(context,listen: false);
    LoginUserModel userModel = loginService.loggedInUserModel;
    String userImg =userModel != null ? userModel.photoUrl :'';
    String userName = userModel != null ? userModel.displayName : '';
    String userEmail= userModel != null ? userModel.email : '';
    return Column(

      children: [
        Image.asset("assets/images/logo.png",
            height: SizeConfig.screenHeight*0.4

        ),
        SizedBox(height: SizeConfig.screenHeight * 0.08),
        Text(
          "Giriş Başarılı",
          style: TextStyle(
            fontSize:  getProportionateScreenWidth(20),
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),

         Text(
            userName,
           //user.displayName,
          style: TextStyle(
            fontSize: getProportionateScreenWidth(20),
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        Text(

          userEmail,
          style: TextStyle(
            fontSize: getProportionateScreenWidth(20),
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        Spacer(),
        SizedBox(
          width: SizeConfig.screenWidth*0.6,
          child: DefaultButton(
            text: "Anasayfa'ya git",
            press: () {
              Navigator.push(context, MaterialPageRoute(builder: (ctx)=>HomeScreen()));
            },
          ),
        ),
        SizedBox(
          height: 10,
        ),
        SizedBox(
          width: SizeConfig.screenWidth*0.6,
          child: DefaultButton(
            text: "Çıkış Yap",
            press: () async{
              loginService.signOut();
              Navigator.push(context, MaterialPageRoute(builder: (ctx)=>SignInScreen()));
            },
          ),
        ),
        Spacer(),


      ],
    );
  }
}
