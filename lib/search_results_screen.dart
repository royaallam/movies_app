import 'package:flutter/material.dart';
import 'app_widgets.dart';

class SearchResultsScreen extends StatelessWidget {
  static const String routeName = '/search-results';

  const SearchResultsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg,
      appBar: AppBar(
        backgroundColor: bg,
        elevation: 0,
        titleSpacing: 16,
        title: TextField(
          autofocus: true,
          decoration: InputDecoration(
            hintText: 'Search',
            filled: true,
            fillColor: card,
            prefixIcon: const Icon(Icons.search),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.fromLTRB(
          16,
          8,
          16,
          20,
        ),
        itemCount: 6,
        gridDelegate:
        const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 14,
          childAspectRatio: 0.68,
        ),
        itemBuilder: (context, index) {
          return movieCard(
            movies[index],
            onTap: () {
              Navigator.pushNamed(
                context,
                '/movie-details',
              );
            },
          );
        },
      ),
      bottomNavigationBar: const BottomBar(
        currentIndex: 1,
      ),
    );
  }
}