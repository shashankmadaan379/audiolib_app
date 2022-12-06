import 'package:audiolib_app/Resources/authentication_methods.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../utils.dart';
import '../HomeScreen/homescreen.dart';
import '../SignUp/signup_screen.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  AuthenticationMethods authenticationMethods = AuthenticationMethods();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      //physics: BouncingScrollPhysics(),
      child: Form(
        child: Column(
          children: [
            TextFormField(
              //keyboardType: TextInputType.emailAddress,
              //textInputAction: TextInputAction.next,
              cursorColor: kPrimaryColor,
              controller: emailController,
              decoration: InputDecoration(
                hintText: "Enter your email",
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(defaultPadding),
                  child: Icon(Icons.email),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: defaultPadding),
              child: TextFormField(
                //textInputAction: TextInputAction.done,
                obscureText: true,
                cursorColor: kPrimaryColor,
                controller: passwordController,
                decoration: InputDecoration(
                  hintText: "Enter your password",
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(defaultPadding),
                    child: Icon(Icons.lock),
                  ),
                ),
              ),
            ),
            const SizedBox(height: defaultPadding),
            Hero(
              tag: "login_btn",
              child: ElevatedButton(
                onPressed: () async {
                  String output = await authenticationMethods.signInUser(
                      email: emailController.text,
                      password: passwordController.text);
                  if (output == "success") {
                    //funtion
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => HomePage()));
                  } else {
                    //error stuffgit
                    Utils().showSnackBar(context: context, content: output);
                  }
                },
                child: Text(
                  "Login".toUpperCase(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 6.0, bottom: 6.0),
              child: Text(
                'Or'.toUpperCase(),
                style: TextStyle(fontWeight: FontWeight.w300),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 6.0),
              child: Hero(
                tag: "googlelogin",
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    "Continue With Google".toUpperCase(),
                  ),
                ),
              ),
            ),
            const SizedBox(height: defaultPadding),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Don't have an account?"),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SignUpScreen()));
                  },
                  child: const Text(
                    'SignUp',
                    style: TextStyle(
                        color: kPrimaryColor, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
