// lib/screens/add_entry.dart
import 'package:flutter/material.dart';
import '../components/daily_questions.dart';
import '../main.dart';

class AddEntryScreen extends StatefulWidget {
  final int dayCounter;

  const AddEntryScreen({Key? key, required this.dayCounter}) : super(key: key);

  @override
  _AddEntryScreenState createState() => _AddEntryScreenState();
}

class _AddEntryScreenState extends State<AddEntryScreen> {
  late int dayCounter;
  TextEditingController _titleController = TextEditingController();
  TextEditingController _categoryController = TextEditingController();
  TextEditingController _bodyController = TextEditingController();

  @override
  void initState() {
    super.initState();
    dayCounter = widget.dayCounter;
  }

  @override
  Widget build(BuildContext context) {
    // Get a random question from the list
    String randomQuestion = DailyQuestions.questions[
        DateTime.now().millisecondsSinceEpoch % DailyQuestions.questions.length];

    return Scaffold(
      appBar: AppBar(
        title: Text('Add Entry - Day $dayCounter'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 8.0),
            Text(
              'Day $dayCounter',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              randomQuestion,
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _titleController,
              decoration: InputDecoration(labelText: 'Title'),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _categoryController,
              decoration: InputDecoration(labelText: 'Category'),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _bodyController,
              maxLines: 4,
              decoration: InputDecoration(labelText: 'Body'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Pass the entry data back to the previous screen
                Navigator.pop(
                  context,
                  Entry(
                    title: _titleController.text,
                    date: DateTime.now(),
                    dayCount: dayCounter,
                  ),
                );
              },
              child: Text('Save Entry'),
            ),
          ],
        ),
      ),
    );
  }
}
