import 'package:flutter/material.dart';

class CounterLayout extends StatelessWidget {
  final String title;
  final int count;
  final int elapsedSeconds;
  final bool isRunning;

  final VoidCallback onIncrement;
  final VoidCallback onDecrement;
  final VoidCallback onResetCounter;
  final VoidCallback onStart;
  final VoidCallback onPause;
  final VoidCallback onStop;

  const CounterLayout({
    super.key,
    required this.title,
    required this.count,
    required this.elapsedSeconds,
    required this.isRunning,
    required this.onIncrement,
    required this.onDecrement,
    required this.onResetCounter,
    required this.onStart,
    required this.onPause,
    required this.onStop,
  });

  String formatTime(int seconds) {
    final minutes = seconds ~/ 60;
    final remainingSeconds = seconds % 60;

    return '${minutes.toString().padLeft(2, '0')}:'
        '${remainingSeconds.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Counter',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 15),

            Text(
              '$count',
              style: const TextStyle(
                fontSize: 55,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),

            const SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: onDecrement,
                  child: const Icon(Icons.remove),
                ),

                const SizedBox(width: 20),

                ElevatedButton(
                  onPressed: onIncrement,
                  child: const Icon(Icons.add),
                ),
              ],
            ),

            const SizedBox(height: 10),

            TextButton(
              onPressed: onResetCounter,
              child: const Text('Reset Counter'),
            ),

            const Divider(height: 40),

            const Text(
              'Timer',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 15),

            Text(
              formatTime(elapsedSeconds),
              style: const TextStyle(
                fontSize: 45,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),

            const SizedBox(height: 20),

            Wrap(
              alignment: WrapAlignment.center,
              spacing: 10,
              runSpacing: 10,
              children: [
                ElevatedButton(
                  onPressed: isRunning ? null : onStart,
                  child: const Text('Start'),
                ),

                ElevatedButton(
                  onPressed: isRunning ? onPause : null,
                  child: const Text('Pause'),
                ),

                ElevatedButton(
                  onPressed: onStop,
                  child: const Text('Stop'),
                ),
              ],
            ),

            const SizedBox(height: 15),

            Text(
              isRunning ? 'Timer is Running' : 'Timer is Stopped',
              style: TextStyle(
                color: isRunning ? Colors.green : Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}