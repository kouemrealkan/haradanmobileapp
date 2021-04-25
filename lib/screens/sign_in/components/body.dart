import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:haradan/components/no_account_text.dart';
import 'package:haradan/components/socal_card.dart';

import 'package:haradan/screens/login_success/login_success_screen.dart';
import 'package:haradan/services/google_login_services.dart';

import 'package:provider/provider.dart';
import '../../../size_config.dart';
import 'sign_form.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:haradan/screens/login_success/components/body.dart';

class Body extends StatefulWidget{
  @override
  _BodyState createState()=>_BodyState();
}




class _BodyState extends State<Body> {



  @override
  Widget build(BuildContext context) {
    LoginService loginService =Provider.of<LoginService>(context,listen: false);
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding:
                EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: SizeConfig.screenHeight * 0.04),
                  Text(
                    "Haradan.com\nHoşgeldiniz",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: getProportionateScreenWidth(24),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Email \nveya sosyal medya hesaplarınızla devam edin.",
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: SizeConfig.screenHeight * 0.08),
                  SignForm(),
                  SizedBox(height: SizeConfig.screenHeight * 0.08),
                  SizedBox(height: getProportionateScreenHeight(20)),
                  OutlineButton.icon(
                     label: Text('Google ile giriş',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                     shape: StadiumBorder(),
                     padding: EdgeInsets.symmetric(horizontal: 12,vertical: 8),
                    highlightedBorderColor: Colors.black,
                    borderSide: BorderSide(color: Colors.black),
                    textColor: Colors.black,
                    icon: FaIcon(FontAwesomeIcons.google, color: Colors.red),
                    onPressed: () async{
                    bool success =await loginService.signWithGoogle();
                    if(success){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginSuccessScreen()));
                    }
                    },


                  ),
                  NoAccountText(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
