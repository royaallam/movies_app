import 'package:flutter/material.dart';

class MovieCard extends StatelessWidget {
  final String image;
  final String title;
  final double rating;
  final VoidCallback? onTap;
  const MovieCard({super.key, required this.image, required this.title, this.rating = 7.7, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(7),
              child: Stack(fit: StackFit.expand, children: [
                Image.asset(image, fit: BoxFit.cover),
                Positioned(
                  top: 5, left: 5,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                    decoration: BoxDecoration(color: const Color(0xFF303030), borderRadius: BorderRadius.circular(6)),
                    child: Text('${rating.toStringAsFixed(1)} ⭐', style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold)),
                  ),
                ),
              ]),
            ),
          ),
          const SizedBox(height: 4),
          Text(title, maxLines: 1, overflow: TextOverflow.ellipsis, style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }
}
