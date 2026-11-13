import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/counter_layout.dart';
import 'counter_controller.dart';

class GetxCounterScreen extends StatefulWidget {
  const GetxCounterScreen({super.key});

  @override
  State<GetxCounterScreen> createState() =>
      _GetxCounterScreenState();
}

class _GetxCounterScreenState
    extends State<GetxCounterScreen> {

  late final CounterController controller;

  @override
  void initState() {
    super.initState();

    controller = Get.put(CounterController());
  }

  @override
  void dispose() {
    Get.delete<CounterController>();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => CounterLayout(
        title: 'GetX Counter',
        count: controller.count.value,
        elapsedSeconds: controller.elapsedSeconds.value,
        isRunning: controller.isRunning.value,
        onIncrement: controller.increment,
        onDecrement: controller.decrement,
        onResetCounter: controller.resetCounter,
        onStart: controller.startTimer,
        onPause: controller.pauseTimer,
        onStop: controller.stopTimer,
      ),
    );
  }
}