import 'package:flutter/material.dart';
import 'package:movies_app/core/app_colors.dart';

// Colors
const Color yellow = Color(0xFFFFC400);
const Color bg = Color(0xFF181818);
const Color card = Color(0xFF252525);

// Movie Model
class Movie {
  final String title;
  final String image;
  final double rating;
  final String genre;

  const Movie(
    this.title,
    this.image,
    this.rating,
    this.genre,
  );
}

// Sample Movies Data
const List<Movie> movies = <Movie>[
  Movie('1917', 'assets/images/1917.png', 7.6, 'War'),
  Movie('Black Widow', 'assets/images/black_widow.png', 6.7, 'Action'),
  Movie('Doctor Strange', 'assets/images/doctor_strange.jpg', 7.5, 'Fantasy'),
  Movie('Avengers', 'assets/images/avengers.jpg', 8.0, 'Action'),
  Movie('Iron Man', 'assets/images/iron_man.jpg', 7.9, 'Action'),
  Movie('Captain America', 'assets/images/captain_america.jpg', 7.8, 'Action'),
  Movie('Civil War', 'assets/images/civil_war.jpg', 7.8, 'Action'),
  Movie('Dark Knight', 'assets/images/dark_knight_crop.png', 9.0, 'Crime'),
];

// Movie Card Widget
class MovieCard extends StatelessWidget {
  final Movie movie;
  final VoidCallback? onTap;
  final bool isSmall;

  const MovieCard({
    super.key,
    required this.movie,
    this.onTap,
    this.isSmall = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: isSmall ? 120 : 150,
        margin: EdgeInsets.only(
          right: isSmall ? 12 : 16,
          bottom: 8,
        ),
        decoration: BoxDecoration(
          color: card,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(12),
                ),
                child: Image.asset(
                  movie.image,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) =>
                      const Center(
                    child: Icon(Icons.broken_image, color: Colors.grey, size: 40),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movie.title,
                    style: TextStyle(
                      color: AppColors.whitecolor,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(
                        Icons.star,
                        color: Colors.amber,
                        size: 16,
                      ),
                      Text(
                        ' ${movie.rating}',
                        style: TextStyle(
                          color: AppColors.whitecolor,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Custom Bottom Navigation Bar
class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int>? onTap;

  const CustomBottomNavBar({
    super.key,
    required this.currentIndex,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: AppColors.black,
      selectedItemColor: yellow,
      unselectedItemColor: Colors.white70,
      currentIndex: currentIndex,
      onTap: onTap,
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          activeIcon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          activeIcon: Icon(Icons.search),
          label: 'Search',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.grid_view_outlined),
          activeIcon: Icon(Icons.grid_view),
          label: 'Browse',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline),
          activeIcon: Icon(Icons.person),
          label: 'Profile',
        ),
      ],
    );
  }
}