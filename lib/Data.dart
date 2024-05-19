import 'package:flutter/material.dart';
import 'notif.dart';
import 'package:intl/intl.dart';
import 'Home.dart';
import 'package:shared_preferences/shared_preferences.dart';

void someFunction() {
  // call startCountdown function
}

class Data extends StatefulWidget {
  const Data({super.key});

  @override
  State<Data> createState() => _DataState();
}

class _DataState extends State<Data> {
  Color buttonColor = Colors.green;
  String dateText = "";

  void _onButtonPressed() async {
    final prefs = await SharedPreferences.getInstance();
    final date = DateFormat('yyyy-MM-dd').format(DateTime.now());

    setState(() {
      buttonColor = Colors.grey;
      dateText = date;
    });

    await prefs.setString('date', date);
  }

  @override
  void initState() {
    super.initState();
    _loadDate();
  }

  void _loadDate() async {
    final prefs = await SharedPreferences.getInstance();
    final date = prefs.getString('date');

    if (date != null) {
      setState(() {
        dateText = date;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        shadowColor: Colors.transparent,
        backgroundColor: Colors.white,
        title: Text(
          "Data Monitoring Section",
          style: TextStyle(color: Colors.black54, fontWeight: FontWeight.w500),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications_outlined),
            color: Colors.black54,
            iconSize: 28,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Notif()),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              width: 500,
              height: 250,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.brown.shade300,
                  width: 10,
                ),
              ),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      "57%",
                      style: TextStyle(
                        fontSize: 60,
                        fontWeight: FontWeight.w600,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                  Text(
                    "Filled",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            '*Tips : Fill the trash with 50-60 % water',
            style: TextStyle(
                color: Colors.black54,
                fontWeight: FontWeight.w500,
                fontSize: 15),
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(20.0, 25.0, 20.0, 25.0),
                margin: const EdgeInsets.fromLTRB(40.0, 15.0, 20.0, 20.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      spreadRadius: 0.5,
                      blurRadius: 5,
                      offset: const Offset(0, 1),
                    ),
                  ],
                  border: Border.all(
                    color: Colors.brown.shade300,
                    width: 0.5,
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Center(
                          child: Text.rich(
                            TextSpan(
                              text: 'Liquid pH',
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 24,
                                  fontWeight: FontWeight.normal),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Text(
                      '4.4',
                      style: TextStyle(
                          color: Colors.orange.shade400, fontSize: 22),
                    )
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(20.0, 25.0, 20.0, 25.0),
                margin: const EdgeInsets.fromLTRB(0.0, 15.0, 20.0, 20.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      spreadRadius: 0.5,
                      blurRadius: 5,
                      offset: const Offset(0, 1),
                    ),
                  ],
                  border: Border.all(
                    color: Colors.brown.shade300,
                    width: 0.5,
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Center(
                          child: Text.rich(
                            TextSpan(
                              text: 'Started on',
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 24,
                                  fontWeight: FontWeight.normal),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Text(
                      dateText,
                      style: TextStyle(
                          color: Colors.orange.shade400, fontSize: 22),
                    )
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 80,
          ),
          ElevatedButton(
            onPressed: () {
              _onButtonPressed();
            },
            style: ElevatedButton.styleFrom(
              primary: buttonColor,
              onPrimary: Colors.white,
              textStyle: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              padding: EdgeInsets.symmetric(
                vertical: 15,
                horizontal: 90,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: Text(
              'Start Production',
            ),
          )
        ],
      ),
    );
  }
}
