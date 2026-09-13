import 'package:flutter/material.dart';

const yellow = Color(0xFFFFC400);
const bg = Color(0xFF181818);
const card = Color(0xFF252525);

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

const movies = <Movie>[
  Movie('1917', 'assets/images/1917.png', 7.6, 'War'),
  Movie('Black Widow', 'assets/images/black_widow.png', 6.7, 'Action'),
  Movie('Doctor Strange', 'assets/images/doctor_strange.jpg', 7.5, 'Fantasy'),
  Movie('Avengers', 'assets/images/avengers.jpg', 8.0, 'Action'),
  Movie('Iron Man', 'assets/images/iron_man.jpg', 7.9, 'Action'),
  Movie('Captain America', 'assets/images/captain_america.jpg', 7.8, 'Action'),
  Movie('Civil War', 'assets/images/civil_war.jpg', 7.8, 'Action'),
];

Widget movieCard(
  Movie movie, {
  VoidCallback? onTap,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: SizedBox(
              width: double.infinity,
              child: Image.asset(
                movie.image,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        const SizedBox(height: 5),
        Text(
          movie.title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 2),
        Row(
          children: [
            const Icon(
              Icons.star,
              size: 12,
              color: yellow,
            ),
            const SizedBox(width: 3),
            Text(
              movie.rating.toString(),
              style: const TextStyle(
                fontSize: 10,
                color: Colors.white70,
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

class BottomBar extends StatelessWidget {
  final int currentIndex;

  const BottomBar({
    super.key,
    required this.currentIndex,
  });

  void go(BuildContext context, int index) {
    if (index == currentIndex) {
      return;
    }

    if (index == 0) {
      Navigator.pushReplacementNamed(context, '/home');
    }

    if (index == 1) {
      Navigator.pushReplacementNamed(context, '/search');
    }

    if (index == 2) {
      Navigator.pushReplacementNamed(context, '/browse');
    }

    if (index == 3) {
      Navigator.pushReplacementNamed(context, '/profile');
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (index) => go(context, index),
      backgroundColor: const Color(0xFF202020),
      selectedItemColor: yellow,
      unselectedItemColor: Colors.white70,
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
