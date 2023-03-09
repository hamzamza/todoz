import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../api/api.dart';
import '../../../components/RoundedInputfield.dart';
import '../../../components/colors.dart';
import '../../../components/customButton.dart';
import '../../../models/User.dart';
import 'Background.dart';

class Body extends StatelessWidget {
  late User credentials;
  Body({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    credentials = User();
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
                hinttxt: "YOUR EMAIL",
                color: k2primaryColor,
                fun: (value) {
                  credentials.email = value;
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
                },
                icon: const Icon(
                  Icons.lock,
                  color: KprimaryColor,
                ),
                textcolor: Colors.black,
              ),
              RoundedInputField(
                hinttxt: "USER NAME",
                color: k2primaryColor,
                fun: (value) {
                  credentials.userName = value;
                },
                icon: const Icon(
                  Icons.person,
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
                    await Register(credentials.userName, credentials.password,
                        credentials.email);
                  },
                  text: "Register",
                  textColor: Colors.white)
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

