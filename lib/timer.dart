// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class TimerSet extends StatefulWidget {
  const TimerSet({super.key});

  @override
  State<TimerSet> createState() => _TimerState();
}

class _TimerState extends State<TimerSet> {
  Duration duration = Duration(minutes: 25);
  Timer? repeatedFunction;
  countDown() {
    repeatedFunction = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        int newScond = duration.inSeconds - 1;
        duration = Duration(seconds: newScond);
        if (duration.inSeconds == 0) {
          repeatedFunction!.cancel();
          setState(() {
            duration = Duration(minutes: 25);
            isrunning = false;
          });
        }
      });
    });
  }

  bool isrunning = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "promdorApp",
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.grey,
      ),
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
                CircularPercentIndicator(
                  progressColor: Colors.red,
                  backgroundColor: Colors.white,
                  animation: true,
                  lineWidth: 10,
                  animationDuration: 1000,
                  animateFromLastPercent: true,
                  percent: duration.inMinutes / 25,
                  radius: 100,
                  center: Text(
                    "${duration.inMinutes.remainder(60).toString().padLeft(2, "0")}:${duration.inSeconds.remainder(60).toString().padLeft(2, "0")}",
                    style: TextStyle(fontSize: 50, color: Colors.white),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            isrunning
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            if (repeatedFunction!.isActive) {
                              repeatedFunction!.cancel();
                            } else {
                              countDown();
                            }
                          },
                          child: Text(
                              repeatedFunction!.isActive ? "stop" : "resume",
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
                              duration = Duration(minutes: 25);
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
