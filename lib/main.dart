import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Your daily dose of quotes to ponder',
            ),
            const SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 400,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 189, 137, 221),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'romatic quote',
                    textScaleFactor: 1,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
