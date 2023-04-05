 import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:table_calendar/table_calendar.dart';

class CalenderScreen extends StatefulWidget {
  const CalenderScreen({super.key});

  @override
  State<CalenderScreen> createState() => _CalenderScreenState();
}

class _CalenderScreenState extends State<CalenderScreen> {
  DateTime today = DateTime.now();
  void _onDaySelect(DateTime day, DateTime focusDay){
    setState(() {
      today = day;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Calender"),),
      body: content(),
    );
  }
  Widget content(){
    return Column(
      children: [
       // Text(today.toString().split(" ")[0]),
        Container(
          child: TableCalendar(
            rowHeight: 43,
            headerStyle: HeaderStyle(formatButtonVisible: false,titleCentered: true),
            availableGestures: AvailableGestures.all,
            selectedDayPredicate: (day) => isSameDay(day, today),
            focusedDay: today, 
            firstDay: DateTime.utc(2010,10,16), 
            lastDay: DateTime.utc(2050,3,14),
            onDaySelected: _onDaySelect,
            ),
        )
      ],
    );
  }
}