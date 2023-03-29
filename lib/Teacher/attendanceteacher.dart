import 'package:collegeproject/Teacher/attendacelisteacher.dart';
import 'package:collegeproject/controller/attendancecontroller.dart';
import 'package:collegeproject/controller/attendanceteachercontroller.dart';
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
  final controller = Get.put(AttendanceTeacherController());
  
  
  final data = Get.put(Countercontroller());
  String? selectedDate;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: controller.dates.map((element) => MaterialButton(
              child:Container(
                  child: controller.dates.isEmpty
                      ? const Text('Select a date ')
                      : Text(element)
                ),
              onPressed: () {
                Get.to(() => const Attendancelistteacher());
              },
            )).toList(),
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

  //pop calendar 

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
