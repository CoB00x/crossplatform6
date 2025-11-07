import 'package:flutter/material.dart';
import '../models/appointment.dart';
import '../../../services/image_service.dart';

class AppointmentTile extends StatelessWidget {
  final Appointment appointment;
  final VoidCallback onDelete;

  const AppointmentTile({super.key,
    required this.appointment,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
      child: ListTile(
        leading: CircleAvatar(
          radius: 25,
          backgroundColor: Colors.green[100],
          child: ClipOval(
            child: ImageService.buildNetworkImage(
              ImageService.getAppointmentImage(appointment.id),
              width: 50,
              height: 50,
            ),
          ),
        ),
        title: Text(
          '${appointment.time} - ${appointment.doctorName}',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Пациент: ${appointment.patientName}'),
            Text('Дата: ${appointment.date}'),
            Text('Цель: ${appointment.purpose}'),
          ],
        ),
        trailing: IconButton(
          icon: const Icon(Icons.delete, color: Colors.red),
          onPressed: onDelete,
        ),
      ),
    );
  }
}