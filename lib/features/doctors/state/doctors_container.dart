import 'package:flutter/material.dart';
import '../models/doctor.dart';
import '../../../services/image_service.dart';

class DoctorsContainer extends StatefulWidget {
  final Widget child;

  const DoctorsContainer({required this.child});

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
      name: 'Иванов А.П.',
      specialty: 'Кардиолог',
      experience: '12 лет',
      rating: '4.8',
      imageUrl: 'https://avatars.mds.yandex.net/i?id=0c4dfc9984b695c0e8e77eca05489fe18ac4a639-12900429-images-thumbs&n=13',
    ),
    Doctor(
      id: '2',
      name: 'Петрова М.С.',
      specialty: 'Терапевт',
      experience: '8 лет',
      rating: '4.9',
      imageUrl: 'https://cdn-icons-png.flaticon.com/512/846/846958.png',
    ),
    Doctor(
      id: '3',
      name: 'Сидоров В.К.',
      specialty: 'Хирург',
      experience: '15 лет',
      rating: '4.7',
      imageUrl: 'https://avatars.mds.yandex.net/i?id=ed5da289ec51bfefea28463aa199b880ab43f16f-5869855-images-thumbs&n=13',
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