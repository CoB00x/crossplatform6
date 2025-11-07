import 'package:flutter/material.dart';
import 'features/profile/screens/profile_list_screen.dart';
import 'shared/app_theme.dart';
import 'features/doctors/state/doctors_container.dart';
import 'features/appointments/state/appointments_container.dart';
import 'features/profile/state/profile_container.dart';
import 'features/doctors/screens/doctors_list_screen.dart';
import 'features/appointments/screens/appointments_list_screen.dart';
import 'features/gallery/screens/medical_gallery_screen.dart';

class MedicalCenterApp extends StatelessWidget {
  const MedicalCenterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Медицинский Центр',
      theme: AppTheme.lightTheme,
      home: AppStateContainer(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class AppStateContainer extends StatelessWidget {
  const AppStateContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return DoctorsContainer(
      child: AppointmentsContainer(
        child: ProfileContainer(
          child: MainNavigationScreen(),
        ),
      ),
    );
  }
}

class MainNavigationScreen extends StatefulWidget {
  @override
  _MainNavigationScreenState createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    DoctorsListScreen(),
    AppointmentsListScreen(),
    MedicalGalleryScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.medical_services),
            label: 'Врачи',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Записи',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.photo_library),
            label: 'Галерея',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Профиль',
          ),
        ],
      ),
    );
  }
}