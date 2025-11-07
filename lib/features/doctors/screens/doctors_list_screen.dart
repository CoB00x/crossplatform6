import 'package:flutter/material.dart';
import '../state/doctors_container.dart';
import '../models/doctor.dart';
import '../widgets/doctor_tile.dart';
import '../../../shared/widgets/empty_state.dart';
import '../../../services/image_service.dart';

class DoctorsListScreen extends StatefulWidget {
  @override
  _DoctorsListScreenState createState() => _DoctorsListScreenState();
}

class _DoctorsListScreenState extends State<DoctorsListScreen> {
  final _nameController = TextEditingController();
  final _specialtyController = TextEditingController();
  final _experienceController = TextEditingController();

  void _addDoctor() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Добавить врача'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'ФИО врача'),
            ),
            TextField(
              controller: _specialtyController,
              decoration: InputDecoration(labelText: 'Специальность'),
            ),
            TextField(
              controller: _experienceController,
              decoration: InputDecoration(labelText: 'Опыт работы'),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Отмена'),
          ),
          ElevatedButton(
            onPressed: () {
              if (_nameController.text.isNotEmpty &&
                  _specialtyController.text.isNotEmpty &&
                  _experienceController.text.isNotEmpty) {
                final doctor = Doctor(
                  id: DateTime.now().millisecondsSinceEpoch.toString(),
                  name: _nameController.text,
                  specialty: _specialtyController.text,
                  experience: _experienceController.text,
                  rating: '4.5',
                  imageUrl: ImageService.getRandomMedicalImage(),
                );
                DoctorsContainer.of(context).addDoctor(doctor);
                _nameController.clear();
                _specialtyController.clear();
                _experienceController.clear();
                Navigator.pop(context);
              }
            },
            child: Text('Добавить'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final doctorsContainer = DoctorsContainer.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Врачи клиники'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: _addDoctor,
          ),
        ],
      ),
      body: doctorsContainer.doctors.isEmpty
          ? EmptyState(
        title: 'Нет врачей',
        message: 'Добавьте первого врача в клинику',
        icon: Icons.medical_services,
      )
          : ListView.builder(
        itemCount: doctorsContainer.doctors.length,
        itemBuilder: (context, index) {
          final doctor = doctorsContainer.doctors[index];
          return DoctorTile(
            doctor: doctor,
            onDelete: () => doctorsContainer.removeDoctor(doctor.id),
          );
        },
      ),
    );
  }
}