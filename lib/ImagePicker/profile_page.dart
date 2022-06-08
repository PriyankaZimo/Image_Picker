import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:login_project/local.dart';
import 'package:provider/provider.dart';

import 'Provider/pofile_provider.dart';

class ProfilePage extends StatelessWidget {
  late ProfileProvider provider;
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    provider = context.read<ProfileProvider>();
    provider.setContext(context);
    getProfile();
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: formKey,
        child: Consumer<ProfileProvider>(
          builder: (BuildContext context, val, Widget? child) => Column(
            children: [
              /// Image Container
              Container(
                height: 200,
                decoration: BoxDecoration(
                  gradient: LinearGradient(begin: Alignment.topCenter, colors: [
                    Color(0xFFee3d7e),
                    Color(0xFFf99d1c),
                  ]),
                  boxShadow: [
                    BoxShadow(color: Colors.grey, blurRadius: 5),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Stack(
                      children: [
                        val.imageLoad
                            ? CircularProgressIndicator()
                            : Container(
                                padding: EdgeInsets.all(10),
                                height: 120,
                                width: 120,
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.grey.shade200),
                                child: ClipOval(
                                  child: Image.network(
                                    val.imagePath.isEmpty
                                        ? 'https://www.spellbrand.com/wp-content/uploads/2013/10/children-clinic-logo-design-1.jpg'
                                        : val.imagePath,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                        Positioned(
                          bottom: -1,
                          right: 1,
                          child: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                  color: Colors.black26,
                                  shape: BoxShape.circle),
                              child: IconButton(
                                onPressed: () {
                                  pickImage(context);
                                },
                                icon: Icon(
                                  Icons.camera_alt_outlined,
                                  color: Colors.white,
                                ),
                              )),
                        )
                      ],
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Image Picker',
                      style: GoogleFonts.italianno(
                          fontWeight: FontWeight.w600,
                          fontSize: 50,
                          color: Colors.white),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 50,
              ),

              /// detail
              Container(
                padding: EdgeInsets.all(20),
                margin: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    gradient:
                        LinearGradient(begin: Alignment.topCenter, colors: [
                      Color(0xFFee3d7e),
                      Color(0xFFf99d1c),
                    ]),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.white24,
                          blurRadius: 5,
                          offset: Offset(-5, -5)),
                      BoxShadow(
                          color: Colors.black12,
                          blurRadius: 5,
                          offset: Offset(5, 5))
                    ]),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.all(10),
                      child: TextFormField(
                        style: TextStyle(color: Colors.white),
                        controller: provider.fNameController,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                            hintText: 'First Name',
                            hintStyle:
                                TextStyle(color: Colors.white, fontSize: 19),
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white))),
                        validator: (val) {
                          if (val.toString().isEmpty) return 'Enter First Name';
                        },
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.all(10),
                        child: TextFormField(
                          style: TextStyle(color: Colors.white),
                          controller: provider.lNameController,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                              hintText: 'Last Name',
                              hintStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 19,
                              ),
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white))),
                        )),
                    Container(
                        margin: EdgeInsets.all(10),
                        child: TextFormField(
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                              hintText: 'Email',
                              hintStyle:
                                  TextStyle(color: Colors.white, fontSize: 19),
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white))),
                        )),
                    Container(
                        margin: EdgeInsets.all(10),
                        child: TextFormField(
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                              hintText: 'Contact',
                              hintStyle:
                                  TextStyle(color: Colors.white, fontSize: 19),
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white))),
                        )),
                    SizedBox(
                      height: 60,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 200,
              ),
              val.loading
                  ? CircularProgressIndicator(
                      color: Colors.pink,
                    )
                  : GestureDetector(
                      onTap: () async {
                        var id = await getUserID();
                        val.updateProfileData({
                          'id': id,
                          "image": provider.imgPath.toString(),
                          'firstName': provider.fNameController.text,
                          'lastName': provider.lNameController.text,
                          "email": provider.emailController.text,
                          'mobile_no': provider.numberConroller.text
                        });
                      },
                      child: Container(
                        width: 150,
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Color(0xFFee3d7e),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            boxShadow: [
                              BoxShadow(
                                  color: Color(0x45000000),
                                  blurRadius: 5,
                                  offset: Offset(0, 5))
                            ]),
                        child: Text(
                          'Update',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    )
            ],
          ),
        ),
      ),
    );
  }

  Future getProfile() async {
    String? id = await getUserID();
    Future.delayed(Duration(microseconds: 30));
    provider.getProfileData({'id': id});
  }

  pickImage(BuildContext context) async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      print(image!.name);
      if (image == null) return;
      final imageTemporary = File(image.path);
      print(imageTemporary.path);
      provider.loadImage(imageTemporary);
    } on Exception catch (e) {
      var message = e.toString().replaceAll('Exception:', '');
      showMessage(message, context);
    }
  }

  showMessage(String msg, BuildContext context) {
    final snackBar = SnackBar(content: Text(msg));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
