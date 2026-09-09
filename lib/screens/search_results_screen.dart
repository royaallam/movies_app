import 'package:flutter/material.dart';
import '../widgets/movie_card.dart';
import 'movie_details_screen.dart';

class SearchResultsScreen extends StatefulWidget {
  const SearchResultsScreen({super.key});

  @override
  State<SearchResultsScreen> createState() => _SearchResultsScreenState();
}

class _SearchResultsScreenState extends State<SearchResultsScreen> {
  final controller = TextEditingController(text: 'Marvel');

  final movies = const [
    ['assets/images/black_widow.jpg', 'Black Widow'],
    ['assets/images/captain_america.jpg', 'Captain America'],
    ['assets/images/iron_man_3.jpg', 'Iron Man 3'],
    ['assets/images/civil_war.jpg', 'Civil War'],
    ['assets/images/avengers.jpg', 'Avengers'],
    ['assets/images/doctor_strange.jpg', 'Doctor Strange'],
  ];

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void openMovie() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const MovieDetailsScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        backgroundColor: const Color(0xFF121212),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(14, 0, 14, 12),
          child: Column(
            children: [
              TextField(
                controller: controller,
                style: const TextStyle(color: Colors.white, fontSize: 17),
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search_rounded, color: Colors.white),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.close_rounded, color: Colors.white70),
                    onPressed: () => controller.clear(),
                  ),
                  filled: true,
                  fillColor: const Color(0xFF2B3034),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: GridView.builder(
                  itemCount: movies.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 12,
                    childAspectRatio: .63,
                  ),
                  itemBuilder: (_, i) => MovieCard(
                    image: movies[i][0],
                    title: movies[i][1],
                    onTap: openMovie,
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
