import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class FeedbackListPage extends StatelessWidget {
  final List<Map<String, dynamic>> feedbackList = [
    {
      'feedbackText': 'This is great!',
      'timestamp': DateTime.now(),
    },
    {
      'feedbackText': 'This is great!',
      'timestamp': DateTime.now(),
    },
    {
      'feedbackText': 'This is great!',
      'timestamp': DateTime.now(),
    },
    {
      'feedbackText': 'This is great!',
      'timestamp': DateTime.now(),
    },
    {
      'feedbackText': 'This is great!',
      'timestamp': DateTime.now(),
    },
    {
      'feedbackText': 'Nice work!',
      'timestamp': DateTime.now().subtract(Duration(days: 1)),
    },
    // Add more feedback items here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Feedback List'),
      ),
      body: ListView.builder(
        itemCount: feedbackList.length,
        itemBuilder: (context, index) {
          Map<String, dynamic> feedback = feedbackList[index];
          return FeedbackListItem(feedback: feedback);
        },
      ),
    );
  }
}

class FeedbackListItem extends StatelessWidget {
  final Map<String, dynamic> feedback;

  FeedbackListItem({required this.feedback});

  @override
  Widget build(BuildContext context) {
    final formattedDate = DateFormat('dd-MM-yyyy HH:mm')
        .format(feedback['timestamp']); // Format date and time

    return Container(
      padding: EdgeInsets.all(12.0),
      margin: EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(Icons.arrow_forward_ios),
              Text(feedback['feedbackText']),
            ],
          ),
          Text(
            formattedDate, // Use formatted date and time
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
        ],
      ),
    );
  }
}
