import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CalendarPage extends StatefulWidget {
  CalendarPage({Key? key}) : super(key: key);

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.indigo,
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.indigo,
          child: Icon(Icons.add),
        ),
        appBar: AppBar(
          toolbarHeight: 80,
          title: Padding(
            padding: const EdgeInsets.all(7.0),
            child: Text(
              'Calendar',
              style: TextStyle(
                color: Colors.indigo,
                fontWeight: FontWeight.bold,
                fontSize: 32,
              ),
            ),
          ),
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        body: SfCalendar(
          todayHighlightColor: Colors.indigo,
          view: CalendarView.week,
          cellBorderColor: Colors.transparent,
          backgroundColor: Colors.white,
          selectionDecoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: Colors.indigo),
          timeSlotViewSettings: TimeSlotViewSettings(
              startHour: 8,
              endHour: 17,
              nonWorkingDays: <int>[DateTime.sunday, DateTime.saturday]),
        ));
  }
}
