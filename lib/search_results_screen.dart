import 'package:flutter/material.dart';
import 'package:movies_app/core/app_colors.dart';
import 'package:movies_app/app_widgets.dart';

class SearchResultsScreen extends StatelessWidget {
  static const String routeName = '/search-results';

  const SearchResultsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final String searchQuery = ModalRoute.of(context)!.settings.arguments as String? ?? '';

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
      body: GridView.builder(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 20),
        itemCount: movies.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 14,
          childAspectRatio: 0.68,
        ),
        itemBuilder: (context, index) {
          return MovieCard(
            movie: movies[index],
            onTap: () {
              Navigator.pushNamed(context, '/movie-details');
            },
          );
        },
      ),
    );
  }
}