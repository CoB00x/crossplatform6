import 'package:flutter/material.dart';

class ProfileContainer extends StatefulWidget {
  final Widget child;

  const ProfileContainer({required this.child});

  static _ProfileContainerState of(BuildContext context) {
    return context.findAncestorStateOfType<_ProfileContainerState>()!;
  }

  @override
  _ProfileContainerState createState() => _ProfileContainerState();
}

class _ProfileContainerState extends State<ProfileContainer> {
  String _name = '';
  String _email = '';
  String _phone = '';
  String _address = '';
  String _medicalHistory = '';

  void updateProfile({
    String? name,
    String? email,
    String? phone,
    String? address,
    String? medicalHistory,
  }) {
    setState(() {
      _name = name ?? _name;
      _email = email ?? _email;
      _phone = phone ?? _phone;
      _address = address ?? _address;
      _medicalHistory = medicalHistory ?? _medicalHistory;
    });
  }

  Map<String, String> get profileData => {
    'name': _name,
    'email': _email,
    'phone': _phone,
    'address': _address,
    'medicalHistory': _medicalHistory,
  };

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}