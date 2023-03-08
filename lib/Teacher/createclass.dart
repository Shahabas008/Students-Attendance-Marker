import 'package:collegeproject/Teacher/createclassdetails.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Createclass extends StatelessWidget {
  const Createclass({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Get Started'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'You Haven\'t Created Any classes For\n The College. ',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
              const SizedBox(
                height: 200,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                      elevation: 15,
                      backgroundColor:const  Color.fromARGB(255, 161, 46, 46),
                      minimumSize: const Size(15, 180)
                    ),
                    onPressed: () {
                      Get.to(() =>  Createclassdetails());
                    },
                    child: const Text(
                      'Create +',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700,
                      ),
                    ))
              ])
            ],
          ),
        ),
      ),
    );
  }
}
