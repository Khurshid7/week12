import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MainScreen extends StatelessWidget {
  final TextEditingController _textFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _textFieldController,
              decoration: InputDecoration(labelText: 'Enter data'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                _saveDataToFirestore(_textFieldController.text);
              },
              child: Text('Save to Firestore'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _saveDataToFirestore(String data) async {
    await FirebaseFirestore.instance.collection('data').add({
      'text': data,
      'timestamp': FieldValue.serverTimestamp(),
    });
    _textFieldController.clear();
  }
}
