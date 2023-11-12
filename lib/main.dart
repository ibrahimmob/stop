// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:stop/timer.dart';

void main() {
  runApp(StopWatch());
}
class StopWatch extends StatelessWidget {
  const StopWatch({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TimerSet(),
    );
  }
}