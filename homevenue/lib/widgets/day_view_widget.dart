import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';

import '../model/event.dart';

import 'package:intl/intl.dart';

class DayViewWidget extends StatelessWidget {
  final GlobalKey<DayViewState>? state;
  final double? width;

  const DayViewWidget({
    Key? key,
    this.state,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DayView<Event>(
      heightPerMinute: 1.5,
      key: state,
      width: width,
//       timeStringBuilder: (date, {secondaryDate}) {
//         print("Date : $date");
//         DateFormat dateFormat =  DateFormat("HH");
//         print("Secondary Date : $secondaryDate");
//         if(int.parse(dateFormat.format(date))  >= 11 && int.parse(dateFormat.format(date)) <=20){
// return dateFormat.format(date);
//         } else {
//           return "";
//         }
        
//       },
    );
  }
}
