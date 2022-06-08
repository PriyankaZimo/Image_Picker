import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_project/Provider/login_provider.dart';
import 'package:provider/provider.dart';
import 'contain_clipper.dart';

class LoginContainer extends StatelessWidget {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var corporateController = TextEditingController();
  late LoginProvider loginProvider;
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    loginProvider = context.watch<LoginProvider>();
    loginProvider.setContext(context);
    return Center(
      child: ClipPath(
        clipper: ContainClipper(),
        child: Container(
          margin: EdgeInsets.only(top: 50, left: 20, right: 20),
          height: 700,
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [
                BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                    offset: Offset(5, 5)),
                BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                    offset: Offset(0, 3)),
              ]),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 50,
                ),
                TextLiquidFill(
                  text: 'Zimo One',
                  waveColor: Colors.pink,
                  boxBackgroundColor: Colors.white,
                  textStyle: GoogleFonts.italianno(
                    fontSize: 80.0,
                    fontWeight: FontWeight.w600,
                  ),
                  boxHeight: 100.0,
                ),
                const SizedBox(
                  height: 50,
                ),
                // Container(
                //   margin: EdgeInsets.only(left: 20, right: 20),
                //   child: TextFormField(
                //     textInputAction: TextInputAction.next,
                //     keyboardType: TextInputType.text,
                //     autovalidateMode: AutovalidateMode.onUserInteraction,
                //     controller: corporateController,
                //     decoration: InputDecoration(hintText: "Corporate id"),
                //     validator: (val) {
                //       if (val.toString().isEmpty) {
                //         return 'Enter corporate id ';
                //       }
                //     },
                //   ),
                // ),
                SizedBox(height: 20),
                Container(
                  margin: const EdgeInsets.only(left: 20, right: 20),
                  child: TextFormField(
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.emailAddress,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: emailController,
                    decoration: const InputDecoration(
                      hintText: "Email",
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.pink)),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.pink),
                      ),
                    ),
                    validator: (val) {
                      if (val!.isEmpty ||
                          !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(val))
                      {
                        return 'Enter correct email id';
                      }
                    },
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  margin: const EdgeInsets.only(left: 20, right: 20),
                  child: TextFormField(
                    obscureText: loginProvider.hidePassword,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: passwordController,
                    decoration: InputDecoration(
                        hintText: "Password",
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.pink)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.pink)),
                        suffixIcon: IconButton(
                            onPressed: () {
                              loginProvider.hidePass();
                            },
                            icon: Icon(
                              loginProvider.hidePassword
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: Colors.pink,
                            ))),
                    validator: (val) {
                      if (val.toString().isEmpty) {
                        return 'Please enter your password';
                      }
                    },
                  ),
                ),
                const SizedBox(height: 70),

                /// LoginButton Container
                Consumer<LoginProvider>(
                  builder: (context, val, child) => val.load
                      ? Center(child: CircularProgressIndicator())
                      : GestureDetector(
                          onTap: () {
                            if (formKey.currentState!.validate()) {
                              loginProvider.loginApi(
                                {
                                  "email": emailController.text.toString(),
                                  "password":
                                      passwordController.text.toString(),
                                  // "corporateId":
                                  //     corporateController.text.toString()
                                },
                              );
                            }
                          },
                          child: Container(
                            height: 50,
                            width: 140,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Colors.pink),
                            child: const Center(
                              child: Text(
                                'LOGIN',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 25),
                              ),
                            ),
                          ),
                        ),
                ),

                const SizedBox(
                  height: 60,
                ),
                Spacer(),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 20, right: 5),
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: Colors.pink),
                      child: const Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
