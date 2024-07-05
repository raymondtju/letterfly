import 'dart:io';

import 'package:Letterfly/components/textstylefont.dart';
import 'package:Letterfly/provider/letterfly_provider.dart';
import 'package:Letterfly/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<LetterFlyProvider>(context);

    TextEditingController usernameController = TextEditingController(text: prov.username);
    TextEditingController emailController = TextEditingController(text: prov.email);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile', style: subheadlineStyle),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: GestureDetector(
                onTap: () async {
                  XFile? result = await ImagePicker().pickImage(
                    source: ImageSource.gallery,
                    maxWidth: 1800,
                    maxHeight: 1800,
                  );
                  if (result != null) {
                    File imagePath = File(result.path);
                    prov.setImageProfile = imagePath;
                  }
                },
                child: prov.imageProfile == null ? Container(
                  width: 100,
                  height: 100,
                  decoration: const BoxDecoration(
                    color: Colors.black,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: SvgPicture.asset(
                      'assets/logo/Logo.svg',
                      color: Colors.white,
                    ),
                  ),
                ) : CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(prov.imageProfile!.path),
                ),
              ),
            ),
            const Text(
              'Username',
              style: DefaultStyles.labelStyle,
            ),
            const SizedBox(
              height: 8,
            ),
            TextField(
              controller: usernameController,
              decoration: DefaultStyles.inputDecoration.copyWith(
                hintText: 'Enter new username',
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Email',
              style: DefaultStyles.labelStyle,
            ),
            const SizedBox(
              height: 8,
            ),
            TextField(
              controller: emailController,
              decoration: DefaultStyles.inputDecoration.copyWith(
                hintText: 'Enter new work email',
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    backgroundColor: const Color.fromRGBO(40, 42, 45, 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0),
                    )),
                onPressed: () {
                  if (emailController.text.endsWith('@gmail.com')) {
                    prov.setEmail = emailController.text;
                    prov.setUsername = usernameController.text;
                    Navigator.pushNamed(context, '/sukses');
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('Email must be in the format example@gmail.com'),
                      duration: Duration(seconds: 2),
                    ));
                  }
                },
                child: const Text(
                  'Edit Profile',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}