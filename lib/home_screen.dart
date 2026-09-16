import 'package:flutter/material.dart';
import 'package:movies_app/core/app_colors.dart';
import 'package:movies_app/app_widgets.dart';
import 'package:movies_app/search_screen.dart';
import 'package:movies_app/up_date_profile/up_date_profile_screen.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  final List<Widget> _pages = [
    const _HomeContent(),
    const SearchScreen(),
    const Center(child: Text('Browse')),
    const UpDateProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: _pages[currentIndex],
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: currentIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}

class _HomeContent extends StatelessWidget {
  const _HomeContent();

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: _buildAvailableMovies(context),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 4, 16, 16),
            child: Text(
              'Recommended Movies',
              style: TextStyle(
                color: AppColors.whitecolor,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: movies.length,
              itemBuilder: (context, index) {
                return MovieCard(
                  movie: movies[index],
                  onTap: () {
                    Navigator.pushNamed(context, '/movie-details');
                  },
                  isSmall: true,
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildAvailableMovies(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Available Now',
                style: TextStyle(color: AppColors.whitecolor, fontSize: 14),
              ),
              const SizedBox(height: 8),
              SizedBox(
                width: 200,
                height: 280,
                child: MovieCard(movie: movies[0]),
              ),
            ],
          ),
          SizedBox(
            width: 200,
            height: 280,
            child: Stack(
              children: [
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: MovieCard(movie: movies[1]),
                ),
                Positioned(
                  bottom: 10,
                  left: 10,
                  right: 10,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/movie-details');
                    },
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                        color: yellow,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.play_arrow, color: Colors.black, size: 31),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}