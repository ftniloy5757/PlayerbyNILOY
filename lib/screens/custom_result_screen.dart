import 'package:flutter/material.dart';

// Since Flutter doesn't use Android system intents for custom internal app communication
// in exactly the same way (usually we use State Management or Streams),
// we are simulating the behavior by passing the message and "receiving" it on this screen.

class CustomResultScreen extends StatelessWidget {
  final String message;
  const CustomResultScreen({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Broadcast Received'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.message, size: 80, color: Colors.deepPurple),
            const SizedBox(height: 20),
            const Text(
              'Received Message:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              message.isEmpty ? '(No message provided)' : message,
              style: const TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
