import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:simple_app/displaypage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});
  final String title;

  @override
  State<HomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {
  final _nameController = TextEditingController();
  final _ageController = TextEditingController();
  final _hobbyController = TextEditingController();

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Future<void> _saveData() async {
    String name = _nameController.text;
    String age = _ageController.text;
    String hobby = _hobbyController.text;

    if (name.isEmpty || age.isEmpty || hobby.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please fill in all fields!')),
      );
      return;
    }

    try {
      Map<String, dynamic> data = {
        "name": name,
        "age": int.parse(age), // Convert age to integer
        "hobby": hobby,
      };

      await _firestore
          .collection("users")
          .add(data)
          .then((DocumentReference docRef) {
        _nameController.clear();
        _ageController.clear();
        _hobbyController.clear();

        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Data saved successfully!')),
        );
      });
    } catch (e) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error saving data: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Input Form"),
        backgroundColor: Colors.deepPurple,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Name input field
              TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16.0),

              // Age input field
              TextField(
                controller: _ageController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Age',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16.0),

              // Hobby input field
              TextField(
                controller: _hobbyController,
                decoration: InputDecoration(
                  labelText: 'Favorite Hobby',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16.0),

              SizedBox(height: 16.0),

              // Save Button
              Center(
                child: ElevatedButton(
                  onPressed: _saveData,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    foregroundColor: Colors.black,
                  ),
                  child: Text("Save Data"),
                ),
              ),
              SizedBox(height: 16.0),

              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DisplayPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor:
                        Colors.deepOrange, // Text color/ Background color
                    // Text color
                  ),
                  child: Text("View Data"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
