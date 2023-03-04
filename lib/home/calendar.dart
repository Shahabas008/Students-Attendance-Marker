import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class Calendar extends StatelessWidget {
  const Calendar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calendar'),
      ),
      body: SfCalendar(
        
        headerStyle:
            const CalendarHeaderStyle(textStyle: TextStyle(fontSize: 20)),
        todayHighlightColor: const Color.fromARGB(255, 161, 46, 46),
        showNavigationArrow: true,
        selectionDecoration: BoxDecoration(
          border: Border.all(
            color: const Color.fromARGB(255, 161, 46, 46),
          ),
          borderRadius: const BorderRadius.all(Radius.circular(4)),
          shape: BoxShape.rectangle,
        ),
        // dataSource: MeetingDataSource(_getDataSource()),
        firstDayOfWeek: 1,
        view: CalendarView.month,
        monthViewSettings: const MonthViewSettings(
          appointmentDisplayMode: MonthAppointmentDisplayMode.appointment,
          showAgenda: true,
        ),
        timeSlotViewSettings: const TimeSlotViewSettings(
          startHour: 0,
          endHour: 24,
        ),
      ),
      //  floatingActionButton: FloatingActionButton(
      //       child: const Text('Add appointment'),
      //       onPressed: () {
      //         final Appointment app = Appointment(
      //             startTime: _controller.displayDate!,
      //             endTime:
      //                 _controller.displayDate!.add(const Duration(hours: 2)),
      //             subject: 'Add Appointment',
      //             color: Colors.pink);
      //         _events?.appointments!.add(app);
      //         _events?.notifyListeners(
      //             CalendarDataSourceAction.add, <Appointment>[app]);
      //       },
      //     ),
    );
  }
}

// List<Meeting> _getDataSource() {
//   final List<Meeting> meetings = <Meeting>[];
//   final DateTime today = DateTime.now();
//   final DateTime startTime =
//       DateTime(today.year, today.month, today.day, 9, 0, 0);
//   final DateTime endTime = startTime.add(const Duration(hours: 2));
//   meetings.add(Meeting(
//      "",startTime, endTime, const Color(0xFF0F8644), false,));
//   return meetings;
// }

// class MeetingDataSource extends CalendarDataSource {
//   MeetingDataSource(List<Meeting> source) {
//     appointments = source;
//   }

//   @override
//   DateTime getStartTime(int index) {
//     return appointments![index].from;
//   }

//   @override
//   DateTime getEndTime(int index) {
//     return appointments![index].to;
//   }

//   @override
//   String getSubject(int index) {
//     return appointments![index].eventName;
//   }

//   @override
//   Color getColor(int index) {
//     return appointments![index].background;
//   }

//   @override
//   bool isAllDay(int index) {
//     return appointments![index].isAllDay;
//   }
// }

// class Meeting {
//   Meeting(this.eventName, this.from, this.to, this.background, this.isAllDay);

//   String eventName;
//   DateTime from;
//   DateTime to;
//   Color background;
//   bool isAllDay;
// }
