import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
  CollectionReference collectionreferenceprofile =
      FirebaseFirestore.instance.collection('Users-Profile-Picture');
  final currentUser = FirebaseAuth.instance.currentUser!.email;
  String profileurl = '' ;
  String firstname = '';
  String lastname = '' ;
  String email = '' ;

  final ImagePicker picker = ImagePicker();
  Future selectOrTakePhoto(ImageSource imageSource) async {
    final pickedFile = await picker.pickImage(source: imageSource);
    if (pickedFile != null) {
      _image = File(pickedFile.path);
      uploadFile();
    } else {
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
      final auth = FirebaseAuth.instance;
      final user = auth.currentUser!.email;
      await FirebaseFirestore.instance
          .collection('Users-Profile-Picture')
          .doc(user)
          .set({
        "Profile Picture": downloadUrls,
      });
    } on FirebaseException catch (e) {
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
   Widget buildprofilecover() {
    return GestureDetector(
      onTap: () {
        showPicker(context);
      },
      child: Container(
       decoration: BoxDecoration(
         color: const Color.fromARGB(255, 234, 234, 234),
          borderRadius: BorderRadius.circular(10)
        
       ),
        height: 150,
        width: 140,
       
        child: SizedBox(
          height: 130,
          width: 200,
          child:profileurl == ''
              ? Image.asset('assets/user.jpg')
              : Image.network(
                  profileurl,
                ),
        ),
      ),
    );
  }

  
  Widget buildusername() {
    return Text(
      '$firstname $lastname',
      style: const TextStyle(
          fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
    );
  }
}
