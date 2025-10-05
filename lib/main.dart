import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

// StatelessWidget
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomeScreen(),
    );
  }
}

// StatefulWidget
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';

  // Fungsi widget pemisahan bagian Hello World
  Widget helloWorldSection() {
    return const Text(
      'Hello, World!',
      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
    );
  }

  // Fungsi widget pemisahan bagian Row
  Widget rowSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: const [
        Icon(Icons.home, color: Colors.blue, size: 40),
        Icon(Icons.favorite, color: Colors.red, size: 40),
        Icon(Icons.person, color: Colors.green, size: 40),
      ],
    );
  }

  // Fungsi widget pemisahan bagian Form
  Widget formSection() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            decoration: const InputDecoration(labelText: 'Masukkan Nama'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Nama tidak boleh kosong';
              }
              return null;
            },
            onSaved: (value) {
              _name = value!;
            },
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Halo, $_name!')),
                );
              }
            },
            child: const Text('Kirim'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Column utama berisi beberapa widget
    return Scaffold(
      appBar: AppBar(title: const Text('Demo Flutter Dasar')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            helloWorldSection(),
            const SizedBox(height: 20),
            rowSection(),
            const SizedBox(height: 20),
            formSection(),
          ],
        ),
      ),
    );
  }
}