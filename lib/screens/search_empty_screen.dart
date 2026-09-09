import 'package:flutter/material.dart';
import 'search_results_screen.dart';

class SearchEmptyScreen extends StatelessWidget {
  const SearchEmptyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(14, 14, 14, 10),
        child: Column(
          children: [
            GestureDetector(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const SearchResultsScreen()),
              ),
              child: Container(
                height: 54,
                decoration: BoxDecoration(
                  color: const Color(0xFF2B3034),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Row(
                  children: [
                    SizedBox(width: 14),
                    Icon(Icons.search_rounded, color: Colors.white, size: 31),
                    SizedBox(width: 12),
                    Text(
                      'Search',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Expanded(
              child: Center(
                child: Image(
                  image: AssetImage('assets/images/movie_logo.png'),
                  width: 125,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
