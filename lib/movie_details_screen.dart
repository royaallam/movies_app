import 'package:flutter/material.dart';
import 'package:movies_app/core/app_colors.dart';
import 'package:movies_app/app_widgets.dart';

class MovieDetailsScreen extends StatelessWidget {
  static const String routeName = '/movie-details';

  const MovieDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 400,
              pinned: true,
              backgroundColor: AppColors.black,
              flexibleSpace: FlexibleSpaceBar(
                title: const Text(''),
                background: Image.asset(
                  'assets/images/avengers.jpg',
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) =>
                      const Center(child: Icon(Icons.broken_image, size: 100)),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: _buildMovieInfo(),
            ),
            SliverToBoxAdapter(
              child: _buildCastSection(),
            ),
            SliverToBoxAdapter(
              child: _buildSimilarSection(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMovieInfo() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Avengers: Endgame',
            style: TextStyle(
              color: AppColors.whitecolor,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const Icon(Icons.star, color: Colors.amber, size: 20),
              Text(
                ' 8.0',
                style: TextStyle(color: AppColors.whitecolor),
              ),
              const SizedBox(width: 16),
              Text(
                '2012',
                style: TextStyle(color: AppColors.whitecolor),
              ),
              const SizedBox(width: 16),
              Text(
                'Action, Adventure',
                style: TextStyle(color: AppColors.whitecolor),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            'Superheroes converge in this Marvel cinematic spectacular...',
            style: TextStyle(color: AppColors.whitecolor),
          ),
        ],
      ),
    );
  }

  Widget _buildCastSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Cast',
            style: TextStyle(
              color: AppColors.whitecolor,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 12,
            runSpacing: 8,
            children: [
              _buildGenreItem('Robert Downey Jr.'),
              _buildGenreItem('Chris Evans'),
              _buildGenreItem('Scarlett Johansson'),
              _buildGenreItem('Chris Hemsworth'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildGenreItem(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white24),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Text(
        text,
        style: TextStyle(color: AppColors.whitecolor, fontSize: 12),
      ),
    );
  }

  Widget _buildSimilarSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'More Like This',
            style: TextStyle(
              color: AppColors.whitecolor,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 250,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: movies.length,
              itemBuilder: (context, index) {
                return MovieCard(movie: movies[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}