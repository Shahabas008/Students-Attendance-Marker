import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

class Profilepagecontroller extends GetxController {
  File? _image;
  String downloadUrls = '';
  CollectionReference collectionreferenceuser =
      FirebaseFirestore.instance.collection('User');
  final currentUser = FirebaseAuth.instance.currentUser!.email;
  final formkey = GlobalKey<FormState>();
  final firstname = TextEditingController();
  final lastname = TextEditingController();
  String profileurl = '';

  final ImagePicker picker = ImagePicker();
  Future selectOrTakePhoto(ImageSource imageSource) async {
    final pickedFile = await picker.pickImage(source: imageSource);
    if (pickedFile != null) {
      _image = File(pickedFile.path);
      uploadFile();
    } else {
      // ignore: avoid_print
      print('No image selected.');
    }
  }

  Future uploadFile() async {
    if (_image == null) return;
    var fileName = basename(_image!.path);
    final destination = 'profile Picture/$fileName';

    try {
      final uploadimage =
          FirebaseStorage.instance.ref(destination).child('Profile Picture/');
      await uploadimage.putFile(_image!);
      downloadUrls = await uploadimage.getDownloadURL();
      await FirebaseFirestore.instance
          .collection('User')
          .doc(FirebaseAuth.instance.currentUser!.email)
          .set({"Profile-Picture": downloadUrls}, SetOptions(merge: true));
    } on FirebaseException catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

  void showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            // ignore: avoid_unnecessary_containers
            child: Container(
              child: Wrap(
                children: <Widget>[
                  ListTile(
                      leading: const Icon(Icons.photo_library),
                      title: const Text('Gallery'),
                      onTap: () {
                        selectOrTakePhoto(ImageSource.gallery);
                        Navigator.of(context).pop();
                      }),
                  ListTile(
                    leading: const Icon(Icons.photo_camera),
                    title: const Text('Camera'),
                    onTap: () {
                      selectOrTakePhoto(ImageSource.camera);
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  //alertdialog to update the username
  void showUsernameupdate(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return SingleChildScrollView(
            child: AlertDialog(
              insetPadding:
                  const EdgeInsets.symmetric(vertical: 250, horizontal: 15),
              actions: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 153, 153, 153)),
                    onPressed: () {
                      usernameupdatefunction();
                      navigator!.pop();
                      firstname.clear();
                      lastname.clear();
                    },
                    child: const Text('Done'))
              ],
              elevation: 15,
              title: const Text(
                'Update User Name',
                style: TextStyle(color: Color.fromARGB(255, 153, 153, 153)),
              ),
              content: Form(
                key: formkey,
                child: Column(
                  children: [
                    TextFormField(
                      textCapitalization: TextCapitalization.words,
                      controller: firstname,
                      validator: ((value) {
                        if (value!.isEmpty) {
                          return 'The field is required';
                        } else {
                          return null;
                        }
                      }),
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.person),
                        border: OutlineInputBorder(),
                        labelText: 'Enter First name',
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      textCapitalization: TextCapitalization.words,
                      controller: lastname,
                      validator: ((value) {
                        if (value!.isEmpty) {
                          return 'The field is required';
                        } else {
                          return null;
                        }
                      }),
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.person),
                        border: OutlineInputBorder(),
                        labelText: 'Enter Last name',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  void usernameupdatefunction() {
    FirebaseFirestore.instance
        .collection("User")
        .doc(FirebaseAuth.instance.currentUser!.email)
        .update({"First Name": firstname.text});
    FirebaseFirestore.instance
        .collection("User")
        .doc(FirebaseAuth.instance.currentUser!.email)
        .update({"Last Name": lastname.text});
  }
}
