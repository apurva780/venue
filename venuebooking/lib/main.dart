// import 'package:flutter/material.dart';

// import 'views/payment_screen.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         // This is the theme of your application.
//         //
//         // Try running your application with "flutter run". You'll see the
//         // application has a blue toolbar. Then, without quitting the app, try
//         // changing the primarySwatch below to Colors.green and then invoke
//         // "hot reload" (press "r" in the console where you ran "flutter run",
//         // or simply save your changes to "hot reload" in a Flutter IDE).
//         // Notice that the counter didn't reset back to zero; the application
//         // is not restarted.
//         primarySwatch: Colors.blue,
//       ),
//       home: const PaymentScreen(),
//     );
//   }
// }


import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:awesome_card/awesome_card.dart';
import 'package:venuebooking/views/payment_screen.dart';
import 'package:calendar_view/calendar_view.dart';
import 'views/home_screen.dart';
import 'views/new_reservation_screen.dart';
import 'views/payment_history.dart';

void main() => runApp( MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return CalendarControllerProvider(
      controller: EventController(),
      child: MaterialApp(
        title: 'Awesome Credit Card Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        // home: PaymentScreen(title: 'Payment'),
        home:NewReservationScreen(),
      ),
    );
  }
}

