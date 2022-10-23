import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ToolbarTime extends StatefulWidget {
  const ToolbarTime({Key? key}) : super(key: key);

  @override
  State<ToolbarTime> createState() => _ToolbarTimeState();
}

class _ToolbarTimeState extends State<ToolbarTime> {
  String _time = '';
  late Timer _timer;

  @override
  void initState() {
    super.initState();

    _initTime();

    _timer = Timer.periodic(const Duration(minutes: 1), (timer) {
      _initTime();
    });
  }

  void _initTime() {
    setState(() {
      _time = DateFormat.Hm().format(DateTime.now());
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      _time,
      style: const TextStyle(color: Colors.white, fontSize: 11),
    );
  }
}
