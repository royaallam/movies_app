import 'package:flutter/material.dart';
import 'package:movies_app/core/app_colors.dart';
import 'movie.dart';
import 'movie_card.dart';

class SearchResultsScreen extends StatelessWidget {
  static const String routeName = '/search-results';

  const SearchResultsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // استقبال كلمة البحث وقائمة الأفلام القادمة من شاشة البحث
    final Map<String, dynamic>? args =
    ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;

    final String searchQuery = args?['query'] ?? '';
    final List<Movie> movieList = args?['movies'] ?? [];

    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        backgroundColor: AppColors.black,
        elevation: 0,
        title: Text(
          'Search Results for "$searchQuery"',
          style: TextStyle(color: AppColors.whitecolor),
        ),
      ),
      body: movieList.isEmpty
          ? Center(
        child: Text(
          'No results found',
          style: TextStyle(color: AppColors.whitecolor, fontSize: 16),
        ),
      )
          : GridView.builder(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 20),
        itemCount: movieList.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 14,
          childAspectRatio: 0.68,
        ),
        itemBuilder: (context, index) {
          return MovieCard(
            movie: movieList[index],
            isLarge: true,
          );
        },
      ),
    );
  }
}