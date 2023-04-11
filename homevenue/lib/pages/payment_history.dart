import 'package:flutter/material.dart';

import 'package:awesome_card/awesome_card.dart';

class PaymentHistory extends StatefulWidget {
  const PaymentHistory({Key? key}) : super(key: key);

  @override
  State<PaymentHistory> createState() => _PaymentHistoryState();
}

class PaymentHistoryData{
  final String eventName;
  final String dateTime;
  final String amount;

  PaymentHistoryData(this.eventName, this.dateTime, this.amount);
}

class _PaymentHistoryState extends State<PaymentHistory> {

  String cardNumber = '3742454554001266';
  String cardHolderName = 'PAUL SMITH';
  String expiryDate = '12/27';
  String cvv = '877';
  bool showBack = false;

  late FocusNode _focusNode;
  TextEditingController cardNumberCtrl = TextEditingController();
  TextEditingController expiryFieldCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(() {
      setState(() {
        _focusNode.hasFocus ? showBack = true : showBack = false;
      });
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }
  

List<PaymentHistoryData> paymentHistoryData = [
  PaymentHistoryData("Developer Meetup","March 24, 2023","\$350",),
  PaymentHistoryData("Yoga Classes","March 16, 2023","\$200",),
  PaymentHistoryData("Zumba Classes","March 8, 2023","\$150",),
];  

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Column(
        children: [
          CreditCard(
            cardNumber: cardNumber,
            cardExpiry: expiryDate,
            cardHolderName: cardHolderName,
            cvv: cvv,
            // bankName: '',
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
            width: 320,
            height: 35,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              color: Colors.blue,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal:20,vertical: 10),
              child: Row(
                children: [
                  Text(
                    "My Credits",
                    style: TextStyle(fontSize: 16),
                  ),
                  Spacer(),
                  Text(
                    "\$350",
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
            itemCount: paymentHistoryData.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(
                  paymentHistoryData[index].eventName,
                  style: TextStyle(fontSize: 20),
                ),
                trailing: Text(
                  paymentHistoryData[index].amount,
                  style: TextStyle(fontSize: 20),
                ),
                subtitle: Text(
                  paymentHistoryData[index].dateTime,
                  style: TextStyle(fontSize: 17),
                ),
              );
            },
          )),
        ],
      ),
    );
  }
}
