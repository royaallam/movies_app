import 'package:flutter/material.dart';

import 'app_widgets.dart';
import 'movie_details_screen.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/home';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: _availableMovies(context),
            ),

            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(
                  16,
                  4,
                  16,
                  8,
                ),
                child: Image.asset(
                  'assets/images/watch_now.png',
                  width: 267,
                  height: 93,
                  alignment: Alignment.centerLeft,
                ),
              ),
            ),

            SliverPadding(
              padding: const EdgeInsets.fromLTRB(
                16,
                0,
                16,
                20,
              ),
              sliver: SliverGrid(
                delegate: SliverChildBuilderDelegate(
                      (context, index) {
                    return movieCard(
                      movies[index],
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          MovieDetailsScreen.routeName,
                        );
                      },
                    );
                  },
                  childCount: 6,
                ),
                gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 14,
                  childAspectRatio: 0.68,
                ),
              ),
            ),
          ],
        ),
      ),

      bottomNavigationBar: const BottomBar(
        currentIndex: 0,
      ),
    );
  }

  Widget _availableMovies(BuildContext context) {
    return SizedBox(
      height: 365,
      child: Stack(
        children: [
          Positioned.fill(
            child: Opacity(
              opacity: 0.20,
              child: Image.asset(
                'assets/images/1917.png',
                fit: BoxFit.cover,
              ),
            ),
          ),

          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withOpacity(0.10),
                    bg.withOpacity(0.95),
                  ],
                ),
              ),
            ),
          ),

          Positioned(
            top: 8,
            left: 16,
            child: Image.asset(
              'assets/images/available_now.png',
              width: 85,
              height: 37,
            ),
          ),

          Positioned(
            top: 55,
            left: 0,
            right: 0,
            child: SizedBox(
              height: 255,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _sideMovie(movies[1]),

                  const SizedBox(width: 10),

                  _mainMovie(
                    context,
                    movies[0],
                  ),

                  const SizedBox(width: 10),

                  _sideMovie(movies[2]),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _sideMovie(Movie movie) {
    return SizedBox(
      width: 65,
      height: 215,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(6),
        child: Opacity(
          opacity: 0.65,
          child: Image.asset(
            movie.image,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget _mainMovie(
      BuildContext context,
      Movie movie,
      ) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          MovieDetailsScreen.routeName,
        );
      },
      child: SizedBox(
        width: 155,
        height: 255,
        child: Stack(
          alignment: Alignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(7),
              child: Image.asset(
                movie.image,
                width: 155,
                height: 235,
                fit: BoxFit.cover,
              ),
            ),

            Container(
              width: 48,
              height: 48,
              decoration: const BoxDecoration(
                color: yellow,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.play_arrow,
                color: Colors.black,
                size: 31,
              ),
            ),

            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Text(
                movie.title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}