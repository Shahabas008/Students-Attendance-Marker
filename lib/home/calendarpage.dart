import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendarpage extends StatefulWidget {
  const Calendarpage({super.key});

  @override
  State<Calendarpage> createState() => _CalendarpageState();
}

class _CalendarpageState extends State<Calendarpage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: TableCalendar(
        headerStyle: const HeaderStyle(
          headerPadding:  EdgeInsets.symmetric(vertical: 20),
          titleTextStyle: TextStyle(
            fontSize: 18,

            fontWeight: FontWeight.w800,
          ),
          formatButtonVisible: false,
          titleCentered: true,

        ),
        calendarStyle: const CalendarStyle(
          outsideDaysVisible: true,
          todayDecoration: BoxDecoration(
            color: Colors.black,
            shape: BoxShape.circle,
          ),
          selectedDecoration: BoxDecoration(
            color: Colors.grey,
            shape: BoxShape.circle,

          )

        ),
        startingDayOfWeek: StartingDayOfWeek.monday,
        daysOfWeekStyle: const DaysOfWeekStyle(  
          weekendStyle: TextStyle(
            fontWeight: FontWeight.w500,
            color: Colors.green,
          ),
          weekdayStyle: TextStyle(
            fontWeight: FontWeight.w500,
          )
        ),
        //shouldFillViewport: true,
          focusedDay: DateTime.now(),
          firstDay: DateTime.utc(2010, 1, 1),
          lastDay: DateTime.utc(2040, 1, 1)),
    ));
  }
}
