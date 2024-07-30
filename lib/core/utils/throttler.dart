import 'dart:async';
import 'package:flutter/material.dart';

class Throttler {
  final int milliseconds;
  Timer? _timer;
  bool _isRunning = false;

  Throttler({required this.milliseconds});

  void run(VoidCallback action) {
    if (_isRunning) return;
    _isRunning = true;
    action();
    _timer = Timer(Duration(milliseconds: milliseconds), () {
      _isRunning = false;
    });
  }

  void dispose() {
    _timer?.cancel();
  }
}
