import 'dart:ffi';

import 'package:collegeproject/controller/countcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Attendance extends StatelessWidget {
  Attendance({super.key});
  final data = Get.put(Countercontroller());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Attendance Record'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Obx(
                    () => 
                    Text(
                      'Number of days : ${data.count}',
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w500),
                    ),),
                    IconButton(onPressed: () {
                       data.increment();
                    }, icon: const Icon(Icons.add_circle,
                    color: Colors.green,)),
                     IconButton(onPressed: () {
                       data.decrement();
                    }, icon: const Icon(Icons.remove_circle,
                    color: Colors.red,))
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              Table(
                columnWidths: const {
                  0 : FlexColumnWidth(4),
                  1 : FlexColumnWidth(4),
                  2 : FlexColumnWidth(1),
                  3 : FlexColumnWidth(1),


                },
                border: TableBorder.all(color: const  Color.fromARGB(255, 161, 46, 46),width: 2.5),
                children:  [
                  const TableRow(
                    children: [
                      
                      TableCell(
                        verticalAlignment:TableCellVerticalAlignment.middle ,
                        child: Center(
                          child: Text('Name',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold
                          ),),
                        ),
                      ),
                      Text('Attended',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold
                      ),),
                     
                      Text('Increment',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold
                      ),),
                      Text('Decrement',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold
                      ),),
                     
                    ],
                  ),
                  TableRow(
                    
                    children: [
                      const Text('Row 2, Column 1'),
                      const Text('Row 2, Column 2'),
                      IconButton(onPressed: () {
                       data.increment();
                    }, icon: const  Icon(Icons.add_circle,
                    color: Colors.green,)),
                     IconButton(onPressed: () {
                       data.decrement();
                    }, icon: const Icon(Icons.remove_circle,
                    color: Colors.red,))
                    ],
                  ),
                   TableRow(
                    children: [
                      const Text('Row 3, Column 1'),
                      const Text('Row 3, Column 2'),
                       IconButton(onPressed: () {
                       data.increment();
                    }, icon: const  Icon(Icons.add_circle,
                    color: Colors.green,)),
                     IconButton(onPressed: () {
                       data.decrement();
                    }, icon:  const Icon(Icons.remove_circle,
                    color: Colors.red,))
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
