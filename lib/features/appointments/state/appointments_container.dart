import 'package:flutter/material.dart';
import '../models/appointment.dart';

class AppointmentsContainer extends StatefulWidget {
  final Widget child;

  const AppointmentsContainer({required this.child});

  static _AppointmentsContainerState of(BuildContext context) {
    return context.findAncestorStateOfType<_AppointmentsContainerState>()!;
  }

  @override
  _AppointmentsContainerState createState() => _AppointmentsContainerState();
}

class _AppointmentsContainerState extends State<AppointmentsContainer> {
  List<Appointment> _appointments = [
    Appointment(
      id: '1',
      doctorName: 'Др. Иванов А.П.',
      patientName: 'Иванов Иван',
      date: '2024-01-20',
      time: '10:00',
      purpose: 'Консультация',
    ),
    Appointment(
      id: '2',
      doctorName: 'Др. Петрова М.С.',
      patientName: 'Петрова Мария',
      date: '2024-01-21',
      time: '14:30',
      purpose: 'Обследование',
    ),
  ];

  void addAppointment(Appointment appointment) {
    setState(() {
      _appointments.add(appointment);
    });
  }

  void removeAppointment(String id) {
    setState(() {
      _appointments.removeWhere((appointment) => appointment.id == id);
    });
  }

  List<Appointment> get appointments => _appointments;

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}