import 'package:flutter/material.dart';
import 'app_widgets.dart';

class SearchScreen extends StatelessWidget {
  static const String routeName = '/search';

  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(
                16,
                12,
                16,
                0,
              ),
              child: TextField(
                readOnly: true,
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    '/search-results',
                  );
                },
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
            const Expanded(
              child: Center(
                child: Image(
                  image: AssetImage(
                    'assets/images/empty.png',
                  ),
                  width: 100,
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomBar(
        currentIndex: 1,
      ),
    );
  }
}