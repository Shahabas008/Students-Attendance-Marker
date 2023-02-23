import 'package:collegeproject/controller/createclassdetails.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Createclassdetails extends StatelessWidget {
  Createclassdetails({super.key});
  final controller = Get.put(Createclassdetailscontroller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('class Details'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 15, 15, 2),
          child: Form(
            key: controller.formkey,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Text(
                'Please Enter Class Details',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
              const SizedBox(
                height: 120,
              ),
              Container(
                padding: const EdgeInsets.all(0),
                child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'The field is required';
                    }
                    return null;
                  },
                  controller: controller.teachername,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.person_4),
                    border: OutlineInputBorder(),
                    labelText: 'Teacher Name',
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.all(0),
                child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'The field is required';
                    }
                    return null;
                  },
                  controller: controller.classname,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.school),
                    border: OutlineInputBorder(),
                    labelText: 'Class Name',
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.all(0),
                child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'The field is required';
                    }
                    return null;
                  },
                  controller: controller.subjectname,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.book),
                    border: OutlineInputBorder(),
                    labelText: 'Subject Name',
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(minimumSize: const Size(395, 50)),
                onPressed: () {
                  controller.registerclass(controller.teachername.text,
                      controller.classname.text, controller.subjectname.text);
                },
                child: const Text('Create Class'),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
