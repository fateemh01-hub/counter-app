import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Counter State
class CounterState {
  final int count;
  final int elapsedSeconds;
  final bool isRunning;

  const CounterState({
    this.count = 0,
    this.elapsedSeconds = 0,
    this.isRunning = false,
  });

  CounterState copyWith({int? count, int? elapsedSeconds, bool? isRunning}) {
    return CounterState(
      count: count ?? this.count,
      elapsedSeconds: elapsedSeconds ?? this.elapsedSeconds,
      isRunning: isRunning ?? this.isRunning,
    );
  }
}

// Counter Notifier
class CounterNotifier extends StateNotifier<CounterState>
    with WidgetsBindingObserver {
  CounterNotifier() : super(const CounterState()) {
    WidgetsBinding.instance.addObserver(this);
  }

  Timer? _timer;

  // Increase counter
  void increment() {
    state = state.copyWith(count: state.count + 1);
  }

  // Decrease counter
  void decrement() {
    if (state.count > 0) {
      state = state.copyWith(count: state.count - 1);
    }
  }

  // Reset counter
  void resetCounter() {
    state = state.copyWith(count: 0);
  }

  // Start timer
  void startTimer() {
    if (state.isRunning) return;

    state = state.copyWith(isRunning: true);

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      state = state.copyWith(elapsedSeconds: state.elapsedSeconds + 1);
    });
  }

  // Pause timer
  void pauseTimer() {
    _timer?.cancel();
    _timer = null;

    state = state.copyWith(isRunning: false);
  }

  // Stop timer
  void stopTimer() {
    pauseTimer();

    state = state.copyWith(elapsedSeconds: 0);
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
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);

    _timer?.cancel();

    super.dispose();
  }
}

// Provider
final counterProvider =
    StateNotifierProvider.autoDispose<CounterNotifier, CounterState>((ref) {
      return CounterNotifier();
    });
