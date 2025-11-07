import 'package:flutter/material.dart';
import '../models/doctor.dart';
import '../../../services/image_service.dart';

class DoctorTile extends StatelessWidget {
  final Doctor doctor;
  final VoidCallback onDelete;

  const DoctorTile({
    required this.doctor,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 4, horizontal: 16),
      child: ListTile(
        leading: CircleAvatar(
          radius: 25,
          backgroundColor: Colors.blue[100],
          child: ClipOval(
            child: ImageService.buildNetworkImage(
              doctor.imageUrl,
              width: 50,
              height: 50,
            ),
          ),
        ),
        title: Text(
          doctor.name,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Специальность: ${doctor.specialty}'),
            Text('Опыт: ${doctor.experience}'),
            Row(
              children: [
                Icon(Icons.star, color: Colors.amber, size: 16),
                SizedBox(width: 4),
                Text('${doctor.rating}'),
              ],
            ),
          ],
        ),
        trailing: IconButton(
          icon: Icon(Icons.delete, color: Colors.red),
          onPressed: onDelete,
        ),
      ),
    );
  }
}