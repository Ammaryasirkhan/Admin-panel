import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AppointmentsPage extends StatelessWidget {
  // Sample list of AppointmentModel instances
  final List<AppointmentModel> appointments = [
    AppointmentModel(
      id: '1',
      sender: 'John Doe',
      description: 'Meeting at 2 PM',
      dateOfSubmission: DateTime.now(),
    ),
    AppointmentModel(
      id: '2',
      sender: 'Jane Smith',
      description: 'Discussion on project',
      dateOfSubmission: DateTime.now().add(Duration(days: 1)),
    ),
    AppointmentModel(
      id: '3',
      sender: 'Jane Smith',
      description: 'Discussion on project',
      dateOfSubmission: DateTime.now().add(Duration(days: 1)),
    ),
    AppointmentModel(
      id: '4',
      sender: 'Jane Smith',
      description: 'Discussion on project',
      dateOfSubmission: DateTime.now().add(Duration(days: 1)),
    ),
    AppointmentModel(
      id: '5',
      sender: 'Jane Smith',
      description: 'Discussion on project',
      dateOfSubmission: DateTime.now().add(Duration(days: 1)),
    ),
    // Add more appointments here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Appointments'),
      ),
      body: ListView.builder(
        itemCount: appointments.length,
        itemBuilder: (context, index) {
          final appointment = appointments[index];
          return AppointmentListItem(appointment: appointment);
        },
      ),
    );
  }
}

class AppointmentListItem extends StatelessWidget {
  final AppointmentModel appointment;

  AppointmentListItem({required this.appointment});

  @override
  Widget build(BuildContext context) {
    final formattedDate =
        DateFormat('dd-MM-yyyy').format(appointment.dateOfSubmission);
    final formattedTime =
        DateFormat('HH:mm').format(appointment.dateOfSubmission);

    return Card(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        height: 130, // Adjust the height as needed
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Icon(Icons.person),
                Text(appointment.sender),
                SizedBox(width: 10),
                Text(appointment.description),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(Icons.calendar_today, size: 16),
                    Text(" $formattedDate"),
                  ],
                ),
                SizedBox(width: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(Icons.access_time, size: 16),
                    Text(" $formattedTime"),
                  ],
                ),
              ],
            ),
            Row(
              children: [
                IconButton(
                  icon: Icon(Icons.check, color: Colors.green),
                  onPressed: () {
                    // Handle the tick button action here
                  },
                ),
                IconButton(
                  icon: Icon(Icons.close, color: Colors.red),
                  onPressed: () {
                    // Handle the cross button action here
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class AppointmentModel {
  final String id;
  final String sender;
  final String description;
  final DateTime dateOfSubmission;

  AppointmentModel({
    required this.id,
    required this.sender,
    required this.description,
    required this.dateOfSubmission,
  });
}
