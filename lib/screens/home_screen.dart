import 'package:flutter/material.dart';
import 'movie_details_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final action = [
      ['assets/images/captain_america.jpg', 'Captain America'],
      ['assets/images/iron_man_3.jpg', 'Iron Man 3'],
      ['assets/images/black_widow.jpg', 'Black Widow'],
    ];
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16, 14, 16, 20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text('Available Now', style: TextStyle(fontSize: 31, fontWeight: FontWeight.w700, fontStyle: FontStyle.italic)),
          const SizedBox(height: 12),
          GestureDetector(
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const MovieDetailsScreen())),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: SizedBox(height: 250, width: double.infinity, child: Image.asset('assets/images/1917.jpg', fit: BoxFit.cover)),
            ),
          ),
          const SizedBox(height: 22),
          const Text('Watch Now', style: TextStyle(fontSize: 31, fontWeight: FontWeight.w700, fontStyle: FontStyle.italic)),
          const SizedBox(height: 14),
          SizedBox(
            height: 205,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: action.length,
              separatorBuilder: (_, __) => const SizedBox(width: 10),
              itemBuilder: (_, i) => GestureDetector(
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const MovieDetailsScreen())),
                child: SizedBox(width: 125, child: Column(children: [Expanded(child: ClipRRect(borderRadius: BorderRadius.circular(8), child: Image.asset(action[i][0], fit: BoxFit.cover, width: 125))), const SizedBox(height: 5), Text(action[i][1], maxLines: 1, overflow: TextOverflow.ellipsis)])),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
