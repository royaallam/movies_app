import 'package:flutter/material.dart';
import '../data/movies.dart';
import '../theme.dart';
import '../widgets/bottom_nav.dart';
import '../widgets/category_chips.dart';
import '../widgets/movie_poster.dart';

class BrowsePage extends StatefulWidget {
  final ValueChanged<int>? onNavigate;

  const BrowsePage({super.key, this.onNavigate});

  @override
  State<BrowsePage> createState() => _BrowsePageState();
}

class _BrowsePageState extends State<BrowsePage> {
  String category = 'Action';

  @override
  Widget build(BuildContext context) {
    final filtered = movies.where((movie) {
      return category == 'Animation' || movie.genre == category;
    }).toList();

    // Keep the reference-like dense grid even when a category has few movies.
    final displayMovies = [
      ...filtered,
      if (filtered.length < 6) ...movies.where((m) => !filtered.contains(m)),
    ].take(6).toList();

    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(12, 14, 12, 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CategoryChips(
                      selected: category,
                      onSelected: (value) => setState(() => category = value),
                    ),
                    const SizedBox(height: 14),
                    Expanded(
                      child: GridView.builder(
                        padding: EdgeInsets.zero,
                        itemCount: displayMovies.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 9,
                          mainAxisSpacing: 10,
                          childAspectRatio: .67,
                        ),
                        itemBuilder: (_, index) {
                          return MoviePoster(
                            movie: displayMovies[index],
                            onTap: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    '${displayMovies[index].title} selected',
                                  ),
                                  duration: const Duration(milliseconds: 700),
                                  backgroundColor: AppColors.surface2,
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            MovieBottomNav(
              selectedIndex: 2,
              onTap: (index) => widget.onNavigate?.call(index),
            ),
          ],
        ),
      ),
    );
  }
}
