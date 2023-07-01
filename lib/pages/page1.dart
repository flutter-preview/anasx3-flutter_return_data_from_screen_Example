// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Page1 extends StatefulWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  Map time = {"country": "Riyadh", "currentTime": "1:10 am"};
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 20, 58, 100),
        title: Text(
          "page1",
          style: TextStyle(fontSize: 33),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                dynamic receivedDateFromPage2 =
                    await Navigator.pushNamed(context, '/second');

                setState(() {
                  if (receivedDateFromPage2 == null) {
                    time = {
                      "country": "Please Try again later...",
                      "currentTime": ""
                    };
                  } else {
                    time = {
                      "country": receivedDateFromPage2["country"],
                      "currentTime": receivedDateFromPage2["currentTime"]
                    };
                  }
                });
              },
              child: Text(
                "Go  to page2",
                style: TextStyle(fontSize: 19),
              ),
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(Color.fromARGB(255, 20, 58, 100)),
                padding: MaterialStateProperty.all(EdgeInsets.all(19)),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(11))),
              ),
            ),
            SizedBox(
              height: 99,
            ),
            Text(
              time["currentTime"],
              style: TextStyle(fontSize: 44),
            ),
            SizedBox(
              height: 22,
            ),
            Text(
              time["country"],
              style: TextStyle(fontSize: 22),
            ),
          ],
        ),
      ),
    );
  }
}
