import 'package:flutter/material.dart';
import '../movie.dart';
import 'movie_details_screen.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;
  final String? genre;
  final bool isLarge;

  const MovieCard({
    super.key,
    required this.movie,
    this.genre,
    this.isLarge = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => MovieDetailsScreen(
              movie: movie,
            ),
          ),
        );
      },
      child: Container(
        width: isLarge ? 190 : 120,
        margin: EdgeInsets.symmetric(
          horizontal: isLarge ? 6 : 5,
          vertical: isLarge ? 4 : 0,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(isLarge ? 14 : 12),
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.network(
                movie.coverImage,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  color: Colors.grey.shade900,
                  child: Icon(
                    Icons.movie_outlined,
                    color: Colors.white54,
                    size: isLarge ? 40 : 24,
                  ),
                ),
              ),
              Positioned(
                top: isLarge ? 8 : 6,
                left: isLarge ? 8 : 6,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.75),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        movie.rating.toString(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 3),
                      const Icon(Icons.star, color: Colors.amber, size: 12),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}