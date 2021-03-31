import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:keep_note/controller/google_auth.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final text =
        MediaQuery.of(context).platformBrightness == Brightness.dark ? '' : '';
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          left: 40,
          right: 40,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  "assets/logoo.svg",
                  height: height * .08,
                ),
              ],
            ),
            SizedBox(
              height: height * .024,
            ),
            Text(
              "This is a Note App you can keep your Note in this App. $text",
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                  // color: Colors.white.withOpacity(.5),
                  fontSize: height * .024,
                  height: 1.4,
                  fontWeight: FontWeight.w400),
            ),
            SizedBox(
              height: height * .04,
            ),
            //GOOGLE BUTTON
            InkWell(
              onTap: () {
                signInWithGoogle(context);
              },
              child: Container(
                height: height * .07,
                width: width * .6,
                decoration: BoxDecoration(
                  color: Color(0xff5375AB),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Sign in with Google",
                      style: GoogleFonts.lato(
                          color: Colors.white,
                          fontSize: height * .022,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      width: width * .02,
                    ),
                    SvgPicture.asset(
                      "assets/google.svg",
                      height: height * .027,
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: height * .04,
            ),
            //SKIP
            // InkWell(
            //   onTap: () {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //         builder: (context) => HomePage(),
            //       ),
            //     );
            //   },
            //   child: Container(
            //     height: height * .07,
            //     width: width * .6,
            //     decoration: BoxDecoration(
            //       color: Color(0xff5375AB),
            //       borderRadius: BorderRadius.circular(6),
            //     ),
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.center,
            //       children: [
            //         Text(
            //           "Skip",
            //           style: GoogleFonts.lato(
            //               color: Colors.white,
            //               fontSize: height * .022,
            //               fontWeight: FontWeight.w600),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
