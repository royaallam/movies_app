import 'package:flutter/material.dart';
import 'app_widgets.dart';

class MovieDetailsScreen extends StatelessWidget {
  static const String routeName = '/movie-details';

  const MovieDetailsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: _hero(context),
            ),
            SliverToBoxAdapter(
              child: _info(),
            ),
            SliverToBoxAdapter(
              child: _shots(),
            ),
            SliverToBoxAdapter(
              child: _similar(context),
            ),
            SliverToBoxAdapter(
              child: _summary(),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(height: 30),
            ),
          ],
        ),
      ),
    );
  }

  Widget _hero(BuildContext context) {
    return SizedBox(
      height: 520,
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/doctor_strange_background.png',
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withOpacity(0.12),
                    bg.withOpacity(0.98),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 8,
            left: 8,
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Image.asset(
                'assets/images/doctor_strange.jpg',
                width: 170,
                height: 255,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 25,
            child: Column(
              children: [
                Container(
                  width: 55,
                  height: 55,
                  decoration: const BoxDecoration(
                    color: yellow,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.play_arrow,
                    color: Colors.black,
                    size: 35,
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  'Doctor Strange in the Multiverse of Madness',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  '2022',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _info() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _infoItem('2022'),
          _infoItem('PG-13'),
          _infoItem('2h 6m'),
          _infoItem('7.5'),
        ],
      ),
    );
  }

  Widget _infoItem(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 8,
      ),
      decoration: BoxDecoration(
        color: card,
        borderRadius: BorderRadius.circular(7),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 11,
        ),
      ),
    );
  }

  Widget _shots() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 20, 16, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Screen Shots',
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          ClipRRect(
            borderRadius: BorderRadius.circular(7),
            child: Image.asset(
              'assets/images/large_screenshot1.png',
              height: 105,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: _smallShot('assets/images/doctor_strange.jpg'),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: _smallShot('assets/images/black_widow.png'),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: _smallShot('assets/images/avengers.jpg'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _smallShot(String path) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(6),
      child: SizedBox(
        height: 72,
        child: Image.asset(
          path,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _similar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 20, 16, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Similar',
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 6,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 14,
              childAspectRatio: 0.68,
            ),
            itemBuilder: (context, index) {
              return movieCard(
                movies[(index + 1) % movies.length],
                onTap: () {},
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _summary() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 22, 16, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Summary',
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Doctor Strange, with the help of mystical allies, journeys into the multiverse to face a powerful new threat. The story mixes action, fantasy and adventure while exploring different realities.',
            style: TextStyle(
              color: Colors.white70,
              height: 1.45,
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 18),
          const Text(
            'Genres',
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              _genreItem('Action'),
              _genreItem('Adventure'),
              _genreItem('Fantasy'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _genreItem(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 7,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.white24,
        ),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 10,
        ),
      ),
    );
  }
}
