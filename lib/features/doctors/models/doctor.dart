class Doctor {
  final String id;
  final String name;
  final String specialty;
  final String experience;
  final String rating;
  final String imageUrl;

  Doctor({
    required this.id,
    required this.name,
    required this.specialty,
    required this.experience,
    required this.rating,
    required this.imageUrl,
  });

  Doctor copyWith({
    String? id,
    String? name,
    String? specialty,
    String? experience,
    String? rating,
    String? imageUrl,
  }) {
    return Doctor(
      id: id ?? this.id,
      name: name ?? this.name,
      specialty: specialty ?? this.specialty,
      experience: experience ?? this.experience,
      rating: rating ?? this.rating,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }
}