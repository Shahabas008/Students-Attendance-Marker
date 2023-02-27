import 'package:collegeproject/controller/attendancecontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AttendanceStudents extends StatelessWidget {
  AttendanceStudents({super.key, required this.classname});
  final String classname;

  final data = Get.put(Countercontroller());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        appBar: AppBar(
          title: const Text('Attendance Record'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Obx(
                      () => Text(
                        'Number of days : ${data.count}',
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                Table(
                  columnWidths: const {
                    0: FlexColumnWidth(1),
                    1: FlexColumnWidth(1),
                    
                  },
                  border: TableBorder.all(
                      color: const Color.fromARGB(255, 161, 46, 46),
                      width: 2.5),
                  children: const [
                     TableRow(
                      children: [
                        TableCell(
                          verticalAlignment: TableCellVerticalAlignment.middle,
                          child: Center(
                            child: Text(
                              'Name',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        TableCell(
                          verticalAlignment: TableCellVerticalAlignment.middle,
                          child: Center(
                            child: Text(
                              'Attended',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                         TableCell(
                            verticalAlignment:
                                TableCellVerticalAlignment.middle,
                            child: Center(child: Text('Row 2, Column 1'))),
                         TableCell(
                            verticalAlignment:
                                TableCellVerticalAlignment.middle,
                            child: Center(child: Text('Row 2, Column 1'))),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
