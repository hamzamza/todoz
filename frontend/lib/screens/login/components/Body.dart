import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../api/api.dart';
import '../../../components/RoundedInputfield.dart';
import '../../../components/colors.dart';
import '../../../components/customButton.dart';
import '../../../main.dart';
import '../../../models/User.dart';
import '../../register/register_screen.dart';
import 'Background.dart';

class Body extends StatelessWidget {
  late User credentials;
  Body({super.key});

  @override
  Widget build(BuildContext context) {
    credentials = User();
    final size = MediaQuery.of(context).size;
    return Background(
      child: SizedBox(
        width: double.infinity,
        height: size.height,
        child: SingleChildScrollView(
          child: Column(
            // ignore: sort_child_properties_last
            children: [
              SvgPicture.asset("assets/icons/login.svg"),
              RoundedInputField(
                hinttxt: "YOUR USERNAME",
                color: k2primaryColor,
                fun: (value) {
                  credentials.userName = value;
                  //TODO:
                },
                icon: const Icon(
                  Icons.person,
                  color: KprimaryColor,
                ),
                textcolor: Colors.black,
              ),
              RoundedSecretInputField(
                hinttxt: "YOUR PASSWORD",
                color: k2primaryColor,
                fun: (value) {
                  credentials.password = value;
                  //TODO:
                },
                icon: const Icon(
                  Icons.lock,
                  color: KprimaryColor,
                ),
                textcolor: Colors.black,
              ),
              const SizedBox(
                height: 4,
              ),
              CustommedButton(
                  color: KprimaryColor,
                  press: () async {
                    var isd =
                        await Login(credentials.userName, credentials.password);
                    if (isd) {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return const Main();
                      }));
                    } else {
                      print('not loged in ');
                    }
                  },
                  text: "Login",
                  textColor: Colors.white),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Already have an Account",
                    style: TextStyle(fontSize: 10),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return const RegisterScreen();
                      }));
                    },
                    child: const Text(
                      " Sign in",
                      style: TextStyle(color: KprimaryColor),
                    ),
                  )
                ],
              )
            ],
            mainAxisAlignment: MainAxisAlignment.center,
          ),
        ),
      ),
    );
  }
}

//
//
//
