import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class Meeting {
  Meeting(
      {required this.from,
      required this.to,
        this.id,
      this.recurrenceId,
      this.eventName = '',
      this.isAllDay = false,
      this.background,
      this.exceptionDates,
      this.recurrenceRule});
 
  DateTime from;
  DateTime to;
  Object? id;
  Object? recurrenceId;
  String eventName;
  bool isAllDay;
  Color? background;
  String? fromZone;
  String? toZone;
  String? recurrenceRule;
  List<DateTime>? exceptionDates;
}

void calendarTapped(CalendarTapDetails details, BuildContext context) {
  if (details.targetElement == CalendarElement.appointment ||
      details.targetElement == CalendarElement.agenda) {
    final Meeting _meeting = details.appointments![0];
 
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Appointment details'),
            content: Text("${_meeting.eventName}\nId: ${_meeting.id}\nRecurrenceId: ${_meeting.recurrenceId}"),
            actions: <Widget>[
               TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('close'))
            ],
          );
        });
  }
}

class MeetingDataSource extends CalendarDataSource<Meeting> {
  MeetingDataSource(List<Meeting> source) {
    appointments = source;
  }
 
  @override
  DateTime getStartTime(int index) {
    return appointments![index].from;
  }
 
  @override
  DateTime getEndTime(int index) {
    return appointments![index].to;
  }
 
  @override
  Object? getId(int index) {
    return appointments![index].id;
  }
 
  @override
  Object? getRecurrenceId(int index) {
    return appointments![index].recurrenceId as Object?;
  }
 
  @override
  Color getColor(int index) {
    return appointments![index].background as Color;
  }
 
  @override
  List<DateTime>? getRecurrenceExceptionDates(int index) {
    return appointments![index].exceptionDates as List<DateTime>?;
  }
 
  @override
  String? getRecurrenceRule(int index) {
    return appointments![index].recurrenceRule;
  }
 
  @override
  String getSubject(int index) {
    return appointments![index].eventName as String;
  }
 
  @override
  bool isAllDay(int index) {
    return appointments![index].isAllDay as bool;
  }
 
  @override
  Meeting? convertAppointmentToObject(
      Meeting? customData, Appointment appointment) {
    // TODO: implement convertAppointmentToObject
    return Meeting(
        from: appointment.startTime,
        to: appointment.endTime,
        eventName: appointment.subject,
        background: appointment.color,
        isAllDay: appointment.isAllDay,
        id: appointment.id,
        recurrenceRule: appointment.recurrenceRule,
        recurrenceId: appointment.recurrenceId,
        exceptionDates: appointment.recurrenceExceptionDates);
  }
}