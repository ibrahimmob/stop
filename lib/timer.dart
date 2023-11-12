// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:async';

import 'package:flutter/material.dart';

class TimerSet extends StatefulWidget {
  const TimerSet({super.key});

  @override
  State<TimerSet> createState() => _TimerState();
}

class _TimerState extends State<TimerSet> {
  Duration duration = Duration(seconds: 0);
  Timer? repeatedFunction;
  countDown() {
    repeatedFunction = Timer.periodic(Duration(milliseconds: 1), (timer) {
      setState(() {
        int newScond = duration.inSeconds + 1;
        duration = Duration(seconds: newScond);
      });
    });
  }

  bool isrunning = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 22),
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: Text(
                        duration.inHours.toString().padLeft(2, "0"),
                        style: TextStyle(fontSize: 77),
                      ),
                    ),
                    Text("Hour",
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 22),
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: Text(
                        duration.inMinutes
                            .remainder(60)
                            .toString()
                            .padLeft(2, "0"),
                        style: TextStyle(fontSize: 77),
                      ),
                    ),
                    Text("minutes",
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 22),
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: Text(
                        duration.inSeconds
                            .remainder(60)
                            .toString()
                            .padLeft(2, "0"),
                        style: TextStyle(fontSize: 77),
                      ),
                    ),
                    Text("Seconds",
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ],
            ),
            isrunning
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            
                            if(repeatedFunction!.isActive){
                              repeatedFunction!.cancel();
                            }else{
                                 countDown();
                            }
                            
                          },
                          child: Text (repeatedFunction!.isActive ? "stop" : "resume",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white))),
                      SizedBox(
                        width: 10,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            repeatedFunction!.cancel();
                            setState(() {
                              duration = Duration(seconds: 0);
                              isrunning = false;
                            });
                          },
                          child: Text("Canel",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white))),
                    ],
                  )
                : ElevatedButton(
                    onPressed: () {
                      countDown();
                      setState(() {
                        isrunning = true;
                      });
                    },
                    child: Text("StartTimer",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white))),
          ],
        ),
      ),
    );
  }
}
