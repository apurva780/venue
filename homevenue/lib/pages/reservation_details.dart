import 'package:flutter/material.dart';

import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';

class ReservationDetails extends StatefulWidget {
  const ReservationDetails({Key? key}) : super(key: key);

  @override
  State<ReservationDetails> createState() => _ReservationDetailsState();
}

class _ReservationDetailsState extends State<ReservationDetails> {
  void cancelReservation() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Reservation cancelled"),
          content: Text("Amount credited as points to credit points"),
          actions: [
            TextButton(
              onPressed: () {},
              child: Text("Ok"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Developer Meetup"),
        elevation: 2,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 25, top: 25),
          child: Column(
            children: [
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 0),
                child: Row(
                  children: [
                    Text(
                      "Event :   ",
                      style: TextStyle(fontSize: 17),
                    ),
                    Text(
                      "Developer Meetup",
                      style: TextStyle(fontSize: 17),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text(
                    "Room :   ",
                    style: TextStyle(fontSize: 17),
                  ),
                  Text(
                    "Room 2",
                    style: TextStyle(fontSize: 17),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text(
                    "Date :   ",
                    style: TextStyle(fontSize: 17),
                  ),
                  Text(
                    "March 30, 2023",
                    style: TextStyle(fontSize: 17),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text(
                    "Time :   ",
                    style: TextStyle(fontSize: 17),
                  ),
                  Text(
                    "10:00 AM to 2:00 AM",
                    style: TextStyle(fontSize: 17),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text(
                    "Duration :   ",
                    style: TextStyle(fontSize: 17),
                  ),
                  Text(
                    "4:00 Hours",
                    style: TextStyle(fontSize: 17),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  right: 30,
                  top: 10,
                ),
                child: Divider(
                  height: 1,
                  thickness: 2,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Row(
                  children: [
                    Text(
                      "Reservation Cost:",
                      style: TextStyle(fontSize: 17),
                    ),
                    Spacer(),
                    Text(
                      "\$300",
                      style: TextStyle(fontSize: 17),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Row(
                  children: [
                    Text(
                      "Extras Cost:",
                      style: TextStyle(fontSize: 17),
                    ),
                    Spacer(),
                    Text(
                      "\$50",
                      style: TextStyle(fontSize: 17),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Row(
                  children: [
                    Text(
                      "Subtotal:",
                      style: TextStyle(fontSize: 17),
                    ),
                    Spacer(),
                    Text(
                      "\$350",
                      style: TextStyle(fontSize: 17),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Row(
                  children: [
                    Text(
                      "Credit Applied:",
                      style: TextStyle(fontSize: 17),
                    ),
                    Spacer(),
                    Text(
                      "\$0",
                      style: TextStyle(fontSize: 17),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Row(
                  children: [
                    Text(
                      "Discount Applied:",
                      style: TextStyle(fontSize: 17),
                    ),
                    Spacer(),
                    Text(
                      "\$0",
                      style: TextStyle(fontSize: 17),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Row(
                  children: [
                    Text(
                      "Total Amount:",
                      style: TextStyle(fontSize: 17),
                    ),
                    Spacer(),
                    Text(
                      "\$350",
                      style: TextStyle(fontSize: 17),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 80,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: OutlinedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => DownloadingDialog(),
                    );
                  },
                  child: Text("Download PDF"),
                ),
              ),
              SizedBox(height: 25),
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: ElevatedButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text("Cancel reservation"),
                            content: Text(
                                "Are you sure you want to cancel reservation?"),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                  cancelReservation();
                                },
                                child: Text("Yes"),
                              ),
                              TextButton(
                                onPressed: () {},
                                child: Text("No"),
                              ),
                            ],
                          );
                        });
                  },
                  child: Text("Cancel Reservation"),
                  
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DownloadingDialog extends StatefulWidget {
  const DownloadingDialog({Key? key}) : super(key: key);

  @override
  _DownloadingDialogState createState() => _DownloadingDialogState();
}

class _DownloadingDialogState extends State<DownloadingDialog> {
  Dio dio = Dio();
  double progress = 0.0;

  void startDownloading() async {
    const String url =
        'https://images.unsplash.com/photo-1575936123452-b67c3203c357?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8aW1hZ2V8ZW58MHx8MHx8&w=1000&q=80';

    const String fileName = "TestingSample.jpg";

    String path = await _getFilePath(fileName);

    await dio.download(
      url,
      path,
      onReceiveProgress: (recivedBytes, totalBytes) {
        setState(() {
          progress = recivedBytes / totalBytes;
        });

        print(progress);
      },
      deleteOnError: true,
    ).then((_) {
      Navigator.pop(context);
    });
  }

  Future<String> _getFilePath(String filename) async {
    final dir = await getApplicationDocumentsDirectory();
    return "${dir.path}/$filename";
  }

  @override
  void initState() {
    super.initState();
    startDownloading();
  }

  @override
  Widget build(BuildContext context) {
    String downloadingprogress = (progress * 100).toInt().toString();

    return AlertDialog(
      backgroundColor: Colors.black,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const CircularProgressIndicator.adaptive(),
          const SizedBox(
            height: 20,
          ),
          Text(
            "Downloading: $downloadingprogress%",
            style: const TextStyle(
              color: Colors.white,
              fontSize: 17,
            ),
          ),
        ],
      ),
    );
  }
}
