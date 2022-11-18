import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instacl/Resourses/auth_Method.dart';
import 'package:instacl/utilities/utild.dart';

import '../Widgets/tex_field.dart';
import '../utilities/colors.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();
  final TextEditingController _userNameController = TextEditingController();
  Uint8List? _image;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _bioController.dispose();
    _userNameController.dispose();
  }

  void selectImage() async {
    Uint8List im = await pickImage(ImageSource.gallery);
    setState(() {
      _image = im;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              flex: 1,
              child: Container(),
            ),
            //logo,
            SvgPicture.asset(
              'assets/ic_instagram.svg',
              color: primaryColor,
              height: 60,
            ),
            const SizedBox(
              height: 34,
            ),
            Stack(
              children: [
                (_image != null
                    ? CircleAvatar(
                        radius: 56, backgroundImage: MemoryImage(_image!))
                    : const CircleAvatar(
                        radius: 56,
                        backgroundImage: NetworkImage(
                            "https://thumbs.dreamstime.com/b/default-avatar-profile-icon-vector-social-media-user-photo-183042379.jpg"),
                      )),
                const Positioned(
                    bottom: -10,
                    left: 76,
                    child: IconButton(
                      onPressed: null,
                      icon: Icon(
                        Icons.add_a_photo_sharp,
                        color: blueColor,
                      ),
                    ))
              ],
            ),
            const SizedBox(
              height: 44,
            ),
            TextFieldInput(
              hintText: "Enter Your UserName",
              textInputType: TextInputType.name,
              textEditingController: _userNameController,
            ),
            const SizedBox(
              height: 40,
            ),
            TextFieldInput(
              hintText: "Enter Your Email",
              textInputType: TextInputType.emailAddress,
              textEditingController: _emailController,
            ),
            const SizedBox(
              height: 40,
            ),
            TextFieldInput(
              textEditingController: _passwordController,
              hintText: "Enter Your Password",
              textInputType: TextInputType.visiblePassword,
              isPass: true,
            ),

            const SizedBox(
              height: 40,
            ),
            TextFieldInput(
              textEditingController: _bioController,
              hintText: "Enter Your bio",
              textInputType: TextInputType.text,
            ),

            const SizedBox(
              height: 25,
            ),
            InkWell(
              onTap: () async {
                String res = await AuthMethod().signUpUser(
                  email: _emailController.text,
                  password: _passwordController.text,
                  username: _userNameController.text,
                  bio: _bioController.text,

                );
                print(res);
              },
              child: Container(
                width: double.infinity,
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: const ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                    color: blueColor),
                child: const Text("Sign In"),
              ),
            ),
            const SizedBox(
              height: 14,
            ),
            Flexible(
              flex: 2,
              child: Container(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: const Text("Do you Have an Account?"),
                ),
                const SizedBox(
                  width: 5,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: const Text(
                      "Log In",
                      style: TextStyle(
                          fontWeight: FontWeight.w900, color: blueColor),
                    ),
                  ),
                ),
              ],
            ),
            Flexible(
              flex: 1,
              child: Container(),
            ),
          ],
        ),
      ),
    ));
  }
}
