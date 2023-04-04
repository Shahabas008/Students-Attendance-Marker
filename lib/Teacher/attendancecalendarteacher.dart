import 'package:collegeproject/Teacher/attendacelisteacher.dart';
import 'package:collegeproject/controller/addstudentscontroller.dart';
import 'package:collegeproject/controller/attendancecontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:flutter/scheduler.dart';
import 'package:intl/intl.dart';

class AttendanceTeacher extends StatefulWidget {
  const AttendanceTeacher({super.key});
  @override
  AttendanceTeacherState createState() => AttendanceTeacherState();
}

class AttendanceTeacherState extends State<AttendanceTeacher> {
  final controller = Get.put(Attendancecontroller());
  final data = Get.put(Countercontroller());
  final subname = Get.arguments["Subjectname"];
  String? selectedDate;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Attendance Date'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: controller.dates
              .map((element) => MaterialButton(
                    child: Container(
                        child: controller.dates.isEmpty
                            ? const Text('Select a date ')
                            : Text(element)),
                    onPressed: () {
                      Get.to(() => const Attendancelistteacher(),
                          arguments: {"selectedDate": element});
                    },
                  ))
              .toList(),
        ),
        floatingActionButton: FloatingActionButton(
            backgroundColor: const Color.fromARGB(255, 161, 46, 46),
            onPressed: () {
              opencalendar(context);
            },
            child: const Icon(Icons.add)),
      ),
    );
  }

  void selectionChanged(DateRangePickerSelectionChangedArgs args) {
    selectedDate = DateFormat('dd MMMM, yyyy').format(args.value);
    controller.addDate(selectedDate);

    SchedulerBinding.instance.addPostFrameCallback((duration) {
      setState(() {});
    });
  }

  Widget getDateRangePicker() {
    return SizedBox(
        height: 250,
        width: 350,
        child: Card(
            child: SfDateRangePicker(
          controller: DateRangePickerController(),
          view: DateRangePickerView.month,
          selectionMode: DateRangePickerSelectionMode.single,
          onSelectionChanged: selectionChanged,
        )));
  }

  void opencalendar(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: const Text('Select a Date'),
              content: SizedBox(
                height: 350,
                width: 350,
                child: Column(
                  children: <Widget>[
                    getDateRangePicker(),
                    MaterialButton(
                      child: const Text("OK"),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    )
                  ],
                ),
              ));
        });
  }
}
