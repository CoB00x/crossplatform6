import 'package:flutter/material.dart';
import '../../../services/image_service.dart';

class MedicalGalleryScreen extends StatelessWidget {
  final List<Map<String, String>> medicalImages = [
    {
      'url': 'https://png.pngtree.com/background/20230613/original/pngtree-various-medical-devices-on-wheels-sit-next-to-eachother-in-a-picture-image_3426773.jpg',
      'title': 'Современное медицинское оборудование'
    },
    {
      'url': 'https://framerusercontent.com/images/fxr1oDL9iiRZfGqnoOJPi9X7t8.png',
      'title': 'Стерильные операционные'
    },
    {
      'url': 'https://avatars.mds.yandex.net/i?id=05c0ccfb74fc2759a1ebffc9ea36ed09c34811d8-16336042-images-thumbs&n=13',
      'title': 'Диагностические лаборатории'
    },
    {
      'url': 'https://www.32top.ru/image/clinicSnippet/large/1029469.png',
      'title': 'Стоматологическое отделение'
    },
    {
      'url': 'https://avatars.mds.yandex.net/i?id=0948de4e6d0e069dd42132a765cd4b43_l-5419733-images-thumbs&n=13',
      'title': 'Кардиологическое отделение'
    },
    {
      'url': 'https://www.groupdentistrynow.com/wp-content/uploads/2020/01/dentists2.png',
      'title': 'Профессиональная команда врачей'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Наш центр'),
        backgroundColor: Colors.blue[800],
        foregroundColor: Colors.white,
        elevation: 4,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 0.75,
        ),
        itemCount: medicalImages.length,
        itemBuilder: (context, index) {
          final image = medicalImages[index];
          return Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  flex: 3,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                    ),
                    child: ImageService.buildNetworkImage(
                      image['url']!,
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                // Описание
                Expanded(
                  flex: 1,
                  child: Container(
                    padding: EdgeInsets.all(8),
                    child: Text(
                      image['title']!,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        color: Colors.grey[700],
                      ),
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}