import 'package:calendar_view/calendar_view.dart';
import 'package:example/pages/history_screen.dart';
import 'package:flutter/material.dart';

import '../extension.dart';
import '../model/event.dart';
import '../widgets/day_view_widget.dart';
import 'create_event_page.dart';
import 'manage_profile.dart';

class DayViewPageDemo extends StatefulWidget {
  const DayViewPageDemo({Key? key}) : super(key: key);

  @override
  _DayViewPageDemoState createState() => _DayViewPageDemoState();
}

class _DayViewPageDemoState extends State<DayViewPageDemo> {

@override
  void initState() {
    selectedBottomIndex = 1;
    super.initState();
  }

int selectedBottomIndex = 1;

List<Widget> screen = [
  HistoryScreen(),
  DayViewWidget(),
  ManageProfile(),
];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        elevation: 8,
        onPressed: () async {
          final event =
              await context.pushRoute<CalendarEventData<Event>>(CreateEventPage(
            withDuration: true,
          ));
          if (event == null) return;
          CalendarControllerProvider.of<Event>(context).controller.add(event);
        },
      ),
      body: screen[selectedBottomIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedBottomIndex,
        onTap: (value) {
          setState(() {
            selectedBottomIndex = value;
          });
        },
        items: [
          
          BottomNavigationBarItem(
            icon: Icon(
              Icons.history,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: "",
            
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
            ),
            label: "",
          ),
        ],
      ),
    );
  }
}
