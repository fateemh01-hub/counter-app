import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CounterController extends GetxController with WidgetsBindingObserver {
  final count = 0.obs;

  final elapsedSeconds = 0.obs;

  final isRunning = false.obs;

  Timer? _timer;

  @override
  void onInit() {
    super.onInit();

    WidgetsBinding.instance.addObserver(this);
  }

  // Increase counter
  void increment() {
    count.value++;
  }

  // Decrease counter
  void decrement() {
    if (count.value > 0) {
      count.value--;
    }
  }

  // Reset counter
  void resetCounter() {
    count.value = 0;
  }

  // Start timer
  void startTimer() {
    if (isRunning.value) return;

    isRunning.value = true;

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      elapsedSeconds.value++;
    });
  }

  // Pause timer
  void pauseTimer() {
    _timer?.cancel();
    _timer = null;

    isRunning.value = false;
  }

  // Stop timer
  void stopTimer() {
    pauseTimer();

    elapsedSeconds.value = 0;
  }

  // App lifecycle
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused ||
        state == AppLifecycleState.inactive ||
        state == AppLifecycleState.hidden ||
        state == AppLifecycleState.detached) {
      pauseTimer();
    }
  }

  @override
  void onClose() {
    WidgetsBinding.instance.removeObserver(this);

    _timer?.cancel();

    super.onClose();
  }
}
