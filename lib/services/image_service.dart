import 'package:cached_network_image/cached_network_image.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class ImageService {
  static final List<String> _medicalImages = [
    'https://images.unsplash.com/photo-1559757148-5c350d0d3c56?w=400&h=300&fit=crop',
    'https://images.unsplash.com/photo-1532938911079-9d3e1de13e16?w=400&h=300&fit=crop',
    'https://images.unsplash.com/photo-1582750433449-648ed127bb54?w=400&h=300&fit=crop',
    'https://images.unsplash.com/photo-1551601651-2a8555f1a136?w=400&h=300&fit=crop',
    'https://images.unsplash.com/photo-1576091160399-112ba8d25d1f?w=400&h=300&fit=crop',
    'https://images.unsplash.com/photo-1551076805-e1869033e561?w=400&h=300&fit=crop',
    'https://images.unsplash.com/photo-1584467735871-8db9ac8b15b5?w=400&h=300&fit=crop',
    'https://images.unsplash.com/photo-1551601651-2a8555f1a136?w=400&h=300&fit=crop',
  ];

  static String getRandomMedicalImage() {
    final random = DateTime.now().millisecondsSinceEpoch % _medicalImages.length;
    return _medicalImages[random];
  }

  static String getDoctorImage(String doctorId) {
    final index = doctorId.hashCode % _medicalImages.length;
    return _medicalImages[index.abs()];
  }

  static String getAppointmentImage(String appointmentId) {
    final index = appointmentId.hashCode % _medicalImages.length;
    return _medicalImages[index.abs()];
  }

  static Future<bool> hasInternetConnection() async {
    final connectivityResult = await Connectivity().checkConnectivity();
    return connectivityResult != ConnectivityResult.none;
  }

  static Widget buildNetworkImage(
      String imageUrl, {
        double width = 100,
        double height = 100,
        BoxFit fit = BoxFit.cover,
      }) {
    return FutureBuilder<bool>(
      future: hasInternetConnection(),
      builder: (context, snapshot) {
        final hasConnection = snapshot.data ?? true;

        if (!hasConnection) {
          return _buildPlaceholder(width, height);
        }

        return CachedNetworkImage(
          imageUrl: imageUrl,
          width: width,
          height: height,
          fit: fit,
          placeholder: (context, url) => Container(
            width: width,
            height: height,
            color: Colors.grey[300],
            child: Center(
              child: CircularProgressIndicator(),
            ),
          ),
          errorWidget: (context, url, error) => _buildPlaceholder(width, height),
        );
      },
    );
  }

  static Widget _buildPlaceholder(double width, double height) {
    return Container(
      width: width,
      height: height,
      color: Colors.grey[300],
      child: Icon(
        Icons.medical_services,
        color: Colors.grey[500],
        size: 40,
      ),
    );
  }
}