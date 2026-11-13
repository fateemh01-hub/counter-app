import 'package:flutter/material.dart';

import 'getx/getx_counter_screen.dart';
import 'riverpod/riverpod_counter_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Counter App'), centerTitle: true),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.calculate, size: 80, color: Colors.blue),
              const SizedBox(height: 20),
              const Text(
                'Choose State Management',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 30),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const GetxCounterScreen(),
                      ),
                    );
                  },
                  child: const Text('GetX Version'),
                ),
              ),

              const SizedBox(height: 15),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RiverpodCounterScreen(),
                      ),
                    );
                  },
                  child: const Text('Riverpod Version'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
