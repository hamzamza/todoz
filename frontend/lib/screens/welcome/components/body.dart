import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../components/colors.dart';
import '../../login/login_screen.dart';
import '../../../components/customButton.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../register/register_screen.dart';
import 'Background.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("WELCOME TO TODOZ",
              style: GoogleFonts.dosis(
                  color: const Color.fromARGB(255, 139, 46, 124),
                  fontWeight: FontWeight.w900,
                  fontSize: 20)),
          const SizedBox(
            height: 10,
          ),
          SvgPicture.asset(
            "assets/icons/chat.svg",
            height: size.height * 0.45,
          ),
          const SizedBox(
            height: 20,
          ),
          CustommedButton(
            text: "LOGIN",
            textColor: Colors.white,
            color: KprimaryColor,
            press: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const LoginScreen();
              }));
            },
          ),
          const SizedBox(
            height: 10,
          ),
          CustommedButton(
            text: "SIGNIN",
            textColor: Colors.white,
            color: k2primaryColor,
            press: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const RegisterScreen();
              }));
            },
          ),
        ],
      ),
    );
  }
}
