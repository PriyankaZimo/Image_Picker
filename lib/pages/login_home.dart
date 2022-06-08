import 'package:flutter/material.dart';
import 'package:login_project/pages/Components/login_container.dart';
import 'Components/my_clipper.dart';
import 'Components/upper_clipper.dart';

class LoginHome extends StatelessWidget {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: SingleChildScrollView(
        child: Stack(

          children: [
            /// 1st Clipper
            ClipPath(
              clipper: MyClipper(),
              child: Container(
                height: 400,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xFFee3d7e).withOpacity(0.8),
                        Color(0xFFf99d1c).withOpacity(0.9)
                      ]),
                ),
              ),
            ),

            ///  2nd homeContainer
            Positioned(
              bottom: -20,
              right: -470,
              child: Container(
                height: 800,
                width: 600,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xFFf99d1c).withOpacity(0.8),
                        Color(0xFFee3d7e).withOpacity(0.9)
                      ]),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 580, right: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 50),
                    height: 70,
                    width: 100,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.redAccent),
                    child: Center(
                        child: Text(
                      'G+',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    )),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 60),
                    height: 70,
                    width: 100,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.blueAccent),
                    child: Center(
                        child: Text(
                      'f',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold),
                    )),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 140),
                    height: 70,
                    width: 100,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.blue.withOpacity(0.4)),
                    child: Center(
                        child: Text(
                      't',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold),
                    )),
                  ),
                ],
              ),
            ),

            /// Upper Icon Container

            Transform.rotate(
              angle: 0.5,
              child: Container(
                margin: EdgeInsets.only(top: 780, left: 200),
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.only(topLeft: Radius.circular(20)),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black12,
                          blurRadius: 10,
                          offset: Offset(5, 5)),
                      BoxShadow(
                          color: Colors.black12,
                          blurRadius: 10,
                          offset: Offset(0, 3)),
                    ]),
                child: Column(
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      margin: EdgeInsets.only(
                        top: 20,
                        right: 120,
                      ),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.orangeAccent),
                      child: Icon(
                        Icons.arrow_upward,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            /// down loginContainer
            LoginContainer()
          ],
        ),
      ),
    );
  }
}
