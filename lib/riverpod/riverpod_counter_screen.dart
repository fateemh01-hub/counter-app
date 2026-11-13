import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../widgets/counter_layout.dart';
import 'counter_provider.dart';

class RiverpodCounterScreen extends ConsumerWidget {
  const RiverpodCounterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.watch(counterProvider);

    final controller = ref.read(counterProvider.notifier);

    return CounterLayout(
      title: 'Riverpod Counter',

      count: counter.count,

      elapsedSeconds: counter.elapsedSeconds,

      isRunning: counter.isRunning,

      onIncrement: controller.increment,

      onDecrement: controller.decrement,

      onResetCounter: controller.resetCounter,

      onStart: controller.startTimer,

      onPause: controller.pauseTimer,

      onStop: controller.stopTimer,
    );
  }
}
