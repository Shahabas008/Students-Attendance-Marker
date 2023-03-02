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
        view: CalendarView.month,
        timeSlotViewSettings:const  TimeSlotViewSettings(
          startHour: 9,
          endHour: 16,
        ),
      ),
    );
  }
}