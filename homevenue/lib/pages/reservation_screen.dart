import 'package:flutter/material.dart';

import 'reservation_details.dart';

class ReservationHistory extends StatefulWidget {
  const ReservationHistory({Key? key}) : super(key: key);

  @override
  State<ReservationHistory> createState() => _ReservationHistoryState();
}

class ReservationHistoryData {
  String eventName;
  String reservationDate;
  String amount;
  ReservationHistoryData(this.eventName, this.reservationDate, this.amount);
}

class _ReservationHistoryState extends State<ReservationHistory> {
  List<ReservationHistoryData> history = [
    ReservationHistoryData(
      "Developer Meetup",
      "March 30, 2023",
      "\$350",
    ),
    ReservationHistoryData(
      "Yoga Classes",
      "March 23, 2023",
      "\$200",
    ),
    ReservationHistoryData(
      "Zumba Classes",
      "March 15, 2023",
      "\$150",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: history.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            ListTile(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ReservationDetails(),
                  ),
                );
              },
              title: Text(history[index].eventName),
              subtitle: Text(history[index].reservationDate),
              trailing: Text(history[index].amount),
            ),
            Divider(
              height: 1,
              thickness: 2,
            ),
          ],
        );
      },
    );
  }
}
