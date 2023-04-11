import 'package:flutter/material.dart';
import 'package:awesome_card/awesome_card.dart';

import 'package:flutter/material.dart';
import 'package:venuebooking/views/payment_screen.dart';

class PaymentHistory extends StatefulWidget {
  const PaymentHistory({Key? key}) : super(key: key);

  @override
  State<PaymentHistory> createState() => _PaymentHistoryState();
}

class _PaymentHistoryState extends State<PaymentHistory> {
  String cardNumber = '5412341212122';
  String cardHolderName = 'Apurva Kanthraviya';
  String expiryDate = '12/27';
  String cvv = '223';
  bool showBack = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment History'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => PaymentScreen(title: "Payment"),
                ),
              );
            },
            icon: Icon(Icons.arrow_forward),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Column(
          children: [
            CreditCard(
              cardNumber: cardNumber,
              cardExpiry: expiryDate,
              cardHolderName: cardHolderName,
              cvv: cvv,
              bankName: 'Axis Bank',
              showBackSide: showBack,
              frontBackground: CardBackgrounds.black,
              backBackground: CardBackgrounds.white,
              showShadow: true,
              // mask: getCardTypeMask(cardType: CardType.americanExpress),
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              width: 310,
              height: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                color: Colors.blue,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      "My Credits",
                      style: TextStyle(fontSize: 16),
                    ),
                    Spacer(),
                    Text(
                      "₹1000",
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
                child: ListView.separated(
              separatorBuilder: (context, index) => Divider(
                height: 5,
                thickness: 5,
              ),
              itemCount: 10,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    "123213213",
                    style: TextStyle(fontSize: 20),
                  ),
                  trailing: Text(
                    "₹200",
                    style: TextStyle(fontSize: 20),
                  ),
                  subtitle: Text(
                    "April 16, 2020",
                    style: TextStyle(fontSize: 17),
                  ),
                );
              },
            )),
          ],
        ),
      ),
    );
  }
}
