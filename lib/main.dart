import 'package:flutter/material.dart';
import 'form.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(buttonTheme: ButtonThemeData(buttonColor: Colors.blue)),
      darkTheme: ThemeData.dark(),
      home: const MyHomePage(title: 'Form App'),
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
      appBar: AppBar(
        leading: Icon(Icons.input),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => FormScreen()),
            );
          },
          child: Text("Form Screen"),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              duration: Duration(seconds: 2),
              content: Text(
                "This is a SnackBar",
                style: TextStyle(fontSize: 20),
              ),
              action: SnackBarAction(label: "Undo", onPressed: () {}),
            ),
          );
        },
        tooltip: 'Snckpbar',
        child: const Icon(Icons.add),
      ),
    );
  }
}
