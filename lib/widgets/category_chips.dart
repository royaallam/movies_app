import 'package:flutter/material.dart';
import '../theme.dart';

class CategoryChips extends StatelessWidget {
  final String selected;
  final ValueChanged<String> onSelected;

  const CategoryChips({
    super.key,
    required this.selected,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    const categories = ['Action', 'Adventure', 'Animation'];

    return SizedBox(
      height: 40,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        separatorBuilder: (_, __) => const SizedBox(width: 6),
        itemBuilder: (_, index) {
          final category = categories[index];
          final active = category == selected;

          return GestureDetector(
            onTap: () => onSelected(category),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: active ? AppColors.yellow : AppColors.surface2,
                borderRadius: BorderRadius.circular(6),
                border: Border.all(
                  color: active ? AppColors.yellow : const Color(0xFF3A3A3A),
                ),
              ),
              child: Text(
                category,
                style: TextStyle(
                  fontSize: 11,
                  color: active ? Colors.black : AppColors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
