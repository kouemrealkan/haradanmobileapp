import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:haradan/services/google_login_services.dart';
import 'package:haradan/services/login_user_model.dart';
import 'package:provider/provider.dart';

class ProfilePic extends StatefulWidget {
  @override
  _ProfilePicState createState() => _ProfilePicState();
}

class _ProfilePicState extends State<ProfilePic> {


  @override
  Widget build(BuildContext context) {
    LoginService loginService =Provider.of<LoginService>(context,listen: false);
    LoginUserModel userModel = loginService.loggedInUserModel;
    String userImg =userModel != null ? userModel.photoUrl :'';
    return SizedBox(
      height: 115,
      width: 115,
      child: Stack(
        fit: StackFit.expand,
        overflow: Overflow.visible,
        children: [
               CircleAvatar(
                  backgroundImage: NetworkImage(userImg),
                ),
               Positioned(
                  right: -16,
                  bottom: 0,
                  child: SizedBox(
                    height: 46,
                    width: 46,
                    child: FlatButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                        side: BorderSide(color: Colors.white),
                      ),
                      color: Color(0xFFF5F6F9),
                      onPressed: () {},
                      child: SvgPicture.asset("assets/icons/Camera Icon.svg"),
                    ),
                  ),
                )
        ],
      ),
    );
  }
}
