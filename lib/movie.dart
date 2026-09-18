class Movie {
  final int id;
  final String title;
  final String coverImage;
  final double rating;
  final List<String> genres;

  Movie({
    required this.id,
    required this.title,
    required this.coverImage,
    required this.rating,
    required this.genres,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      coverImage: json['large_cover_image'] ?? json['medium_cover_image'] ?? '',
      rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
      genres: List<String>.from(json['genres'] ?? []),
    );
  }
}