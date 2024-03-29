import 'package:collegeproject/controller/createclassdetails.controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class Createclassdetails extends StatelessWidget {
  Createclassdetails({super.key});
  final controller = Get.put(Createclassdetailscontroller());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Class Details'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(15, 15, 15, 2),
            child: Form(
              key: controller.formkey,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Please Enter Class Details',
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: const EdgeInsets.all(0),
                      child: TextFormField(
                        textCapitalization: TextCapitalization.characters,
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
                        maxLength: 12,
                        inputFormatters: [LengthLimitingTextInputFormatter(15)],
                        textCapitalization: TextCapitalization.characters,
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
                      style: ElevatedButton.styleFrom(
                          minimumSize: const Size(395, 50)),
                      onPressed: () {
                        controller.registerclass(controller.classname.text,
                            controller.subjectname.text);

                        controller.subjectname.clear();
                        controller.classname.clear();
                      },
                      child: const Text('Create Class'),
                    ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
