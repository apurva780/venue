import 'package:flutter/material.dart';
import 'package:time_range/time_range.dart';

class NewReservationScreen extends StatefulWidget {
  const NewReservationScreen({Key? key}) : super(key: key);

  @override
  State<NewReservationScreen> createState() => _NewReservationScreenState();
}

class City {
  int cityId;
  String cityName;
  City({required this.cityId, required this.cityName});
}

class CountryState {
  int stateId;
  String stateName;
  List<City> cities;
  CountryState(
      {required this.stateId, required this.stateName, required this.cities});
}

class _NewReservationScreenState extends State<NewReservationScreen> {
  List<String> service = ["Yoga", "Zumba"];

  List<String> room = [
    "Fitness Studio 8",
    "Room 1",
    "Room 2",
    "Fitness Studio 2"
  ];

  List<String> extraEquipments = [
    "Dumbbells","Mats",
    "Speaker","Mic",
  ];
  int? selectedService;
  int? selectedRoom;
  int? selectedEquipments;

  TextEditingController dateCtl = TextEditingController();
  TextEditingController timeCtl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
        title: const Text(
          "New Reservation",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Form(
        child: Padding(
          padding: const EdgeInsets.only(left: 25, right: 25, top: 25),
          child: Column(
            children: <Widget>[
              DropdownButtonFormField<int>(
                hint: const Text(
                  "Select servicsdfsde",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                decoration: const InputDecoration(
                  labelText: 'Which service?',
                  labelStyle: TextStyle(fontSize: 20),
                ),
                value: selectedService,
                items: service.map((serv) {
                  return DropdownMenuItem<int>(
                    value: service.indexOf(serv),
                    child: Text(serv),
                  );
                }).toList(),
                onChanged: (val) {
                  setState(() {
                    selectedService = val!;
                  });
                },
              ),
              const SizedBox(
                height: 20,
              ),
              DropdownButtonFormField<int>(
                hint: const Text(
                  "Select Room",
                  style: TextStyle(fontSize: 16),
                ),
                decoration: const InputDecoration(
                  labelText: 'Which Room?',
                  labelStyle: TextStyle(fontSize: 20),
                ),
                value: selectedRoom,
                items: room.map((r) {
                  return DropdownMenuItem<int>(
                    value: room.indexOf(r),
                    child: Text(r),
                  );
                }).toList(),
                onChanged: (val) {
                  setState(() {
                    selectedRoom = val!;
                  });
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: dateCtl,
                decoration: const InputDecoration(
                  suffixIcon: Icon(Icons.calendar_month),
                  suffixIconColor: Colors.blue,
                  labelText: "Date",
                  labelStyle: TextStyle(fontSize: 20),
                  hintText: "Reservation date",
                ),
                onTap: () async {
                  DateTime date = DateTime(2023);
                  FocusScope.of(context).requestFocus(FocusNode());

                  date = (await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2023),
                      lastDate: DateTime(2100)))!;

                  dateCtl.text = "${date.month}-${date.day}-${date.year}";
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: timeCtl,
                decoration: const InputDecoration(
                  suffixIcon: Icon(Icons.access_time),
                  suffixIconColor: Colors.blue,
                  labelText: "Select Time",
                  labelStyle: TextStyle(fontSize: 20),
                  hintText: "Reservation time",
                ),
                readOnly: true,
              ),
              const SizedBox(
                height: 20,
              ),
              TimeRange(

                fromTitle: const Text(
                  'From',
                  style: TextStyle(fontSize: 18, color: Colors.grey),
                ),
                toTitle: const Text(
                  'To',
                  style: TextStyle(fontSize: 18, color: Colors.grey),
                ),
                
                textStyle: const TextStyle(
                    fontWeight: FontWeight.normal, color: Colors.black87),
                activeTextStyle:
                    const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                borderColor: Colors.black,
                backgroundColor: Colors.transparent,
                activeBackgroundColor: const Color.fromARGB(255, 9, 103, 179),
                firstTime: TimeOfDay.now(),
                lastTime: const TimeOfDay(hour: 23, minute: 00),
                timeStep: 120,
                timeBlock: 120,
                onRangeCompleted: (range) => setState(() {
                  timeCtl.text =
                      "${range!.start.format(context)}-${range.end.format(context)}";
                }),
              ),
              const SizedBox(height: 20,),
              DropdownButtonFormField<int>(
                hint: const Text(
                  "Extra",
                  style: TextStyle(fontSize: 16),
                ),
                decoration: const InputDecoration(
                  labelText: 'Equipments',
                  labelStyle: TextStyle(fontSize: 20),
                ),
                value: selectedEquipments,
                items: extraEquipments.map((extra) {
                  return DropdownMenuItem<int>(
                    value: extraEquipments.indexOf(extra),
                    child: Text(extra),
                  );
                }).toList(),
                onChanged: (val) {
                  setState(() {
                    selectedEquipments = val!;
                  });
                },
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: OutlinedButton(
                  onPressed: () {},
                  child: const Padding(
                    padding: EdgeInsets.only(left: 45,right: 45,top: 10,bottom: 10),
                    child: Text(
                      "Reserve now",
                      style: TextStyle(fontSize: 25),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
