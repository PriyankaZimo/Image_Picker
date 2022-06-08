import 'package:flutter/material.dart';
import 'package:login_project/pages/login_home.dart';

import '../../local.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Theratap Login',
          style: TextStyle(fontSize: 25, color: Colors.teal),
        ),
        actions: [
          IconButton(
              onPressed: () {
                logoutPage(context);
              },
              icon: Icon(
                Icons.logout,
                color: Colors.teal,
                size: 30,
              ))
        ],
      ),
      backgroundColor: Colors.teal,
      body: Container(
        child: Center(
            child: Text(
          'Welcome To Home Page',
          style: TextStyle(
              fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold),
        )),
      ),
    );
  }

  void logoutPage(context) {
    showDialog(
        context: context,
        builder: (context) => Dialog(
          elevation: 0,
          backgroundColor: Colors.transparent,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            padding: EdgeInsets.all(10),
            height: 120,
            width: 250,
            child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(height: 10,),
                Text(
                  'Are you sure you want to logout ?',
                  style:
                  TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
                ),
                Row(
                  children: [
                    Spacer(),
                    TextButton(
                        onPressed: () {
                          clearLocalData();
                          // Navigator.pushAndRemoveUntil(
                          //     context,
                          //     MaterialPageRoute(
                          //       builder: (context) => LoginHome(),
                          //     ),
                          //         (route) => false);
                        },
                        child: Text('Yes')),
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('No')),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
