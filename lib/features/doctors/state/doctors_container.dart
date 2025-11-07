import 'package:flutter/material.dart';
import '../models/doctor.dart';
import '../../../services/image_service.dart';

class DoctorsContainer extends StatefulWidget {
  final Widget child;

  const DoctorsContainer({super.key, required this.child});

  static _DoctorsContainerState of(BuildContext context) {
    return context.findAncestorStateOfType<_DoctorsContainerState>()!;
  }

  @override
  _DoctorsContainerState createState() => _DoctorsContainerState();
}

class _DoctorsContainerState extends State<DoctorsContainer> {
  final List<Doctor> _doctors = [
    Doctor(
      id: '1',
      name: 'Др. Иванов А.П.',
      specialty: 'Кардиолог',
      experience: '12 лет',
      rating: '4.8',
      imageUrl: ImageService.getDoctorImage('1'),
    ),
    Doctor(
      id: '2',
      name: 'Др. Петрова М.С.',
      specialty: 'Терапевт',
      experience: '8 лет',
      rating: '4.9',
      imageUrl: ImageService.getDoctorImage('2'),
    ),
    Doctor(
      id: '3',
      name: 'Др. Сидоров В.К.',
      specialty: 'Хирург',
      experience: '15 лет',
      rating: '4.7',
      imageUrl: ImageService.getDoctorImage('3'),
    ),
  ];

  void addDoctor(Doctor doctor) {
    setState(() {
      _doctors.add(doctor);
    });
  }

  void removeDoctor(String id) {
    setState(() {
      _doctors.removeWhere((doctor) => doctor.id == id);
    });
  }

  List<Doctor> get doctors => _doctors;

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}