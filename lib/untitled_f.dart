library untitled_f;

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PackageHomeScreen extends StatelessWidget {
  const PackageHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Package Home Screen')),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 120),
            const Text(
              'Welcome to the Package Home Screen!',
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
                onPressed: () {
                  context.push('/first');
                },
                child: const Text('Go to Package First Screen')),
            ElevatedButton(
              onPressed: () {
                context.push('/second');
              },
              child: const Text('Go to Package Second Screen'),
            ),
          ],
        ),
      ),
    );
  }
}

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('First Package Screen')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            context.push('/second');
          },
          child: const Text('Go to Package Second Screen'),
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Second Package Screen')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            context.go('/package');
          },
          child: const Text('Back to Package Home Package Screen'),
        ),
      ),
    );
  }
}

final List<GoRoute> packageRoutes = [
  GoRoute(
      path: '/package',
      builder: (context, state) => const PackageHomeScreen(),
      routes: [
        GoRoute(
          path: '/first',
          builder: (context, state) => const FirstScreen(),
        ),
        GoRoute(
          path: '/second',
          builder: (context, state) => const SecondScreen(),
        ),
      ]),
];
