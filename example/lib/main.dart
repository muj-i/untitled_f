import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:untitled_f/untitled_f.dart';

void main() {
  runApp(const MyApp());
}

final GoRouter _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) =>
          const MyHomePage(title: 'Flutter App Home Page'),
    ),
    GoRoute(
      path: '/first',
      builder: (context, state) => const FirstPage(),
    ),
    GoRoute(
      path: '/second',
      builder: (context, state) => const SecondPage(),
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      // routerConfig: _router,
      routerDelegate: _router.routerDelegate,
      routeInformationParser: _router.routeInformationParser,
      routeInformationProvider: _router.routeInformationProvider,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 120),
            ElevatedButton(
              onPressed: () {
                context.go('/first');
              },
              child: const Text('Go to First Page'),
            ),
            ElevatedButton(
              onPressed: () {
                context.go('/second');
              },
              child: const Text('Go to Second Page'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => MyPackageApp()),
                );
              },
              child: const Text('Open Package App'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (_) => MyPackageApp(initialLocation: '/second')),
                );
              },
              child: const Text('Open Package App - With Specific Route'),
            ),
          ],
        ),
      ),
    );
  }
}

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Page'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            context.go('/');
          },
          child: const Text('Back to Home'),
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Page'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            context.go('/');
          },
          child: const Text('Back to Home'),
        ),
      ),
    );
  }
}
