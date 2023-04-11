import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'payment_history.dart';
import 'reservation_screen.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: TabBar(
          tabs: [
            Tab(
                child: Text(
                  "Reservation history",
                  style: TextStyle(color: Colors.black,fontSize: 16),
                ),
                height: 80),
            Tab(
              child: Text("Payment history",style: TextStyle(color: Colors.black,fontSize: 16),),
            ),
          ],
        labelPadding: EdgeInsets.only(top:80,bottom: 10),
        ),
        body: TabBarView(children: [
          ReservationHistory(),
          PaymentHistory(),
        ]),
      ),
    );
  }
}
