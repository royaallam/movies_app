import 'package:flutter/material.dart';
import 'package:movies_app/core/app_colors.dart';
import 'movie.dart';

class MovieDetailsScreen extends StatelessWidget {
  static const String routeName = '/movie-details';
  final Movie? movie;

  const MovieDetailsScreen({
    super.key,
    this.movie,
  });

  @override
  Widget build(BuildContext context) {
    // جلب الفيلم الممرر عبر الـ Navigator
    final Movie? selectedMovie =
        movie ?? ModalRoute.of(context)?.settings.arguments as Movie?;

    if (selectedMovie == null) {
      return Scaffold(
        backgroundColor: AppColors.black,
        appBar: AppBar(backgroundColor: AppColors.black),
        body: const Center(
          child: Text('No movie data found',
              style: TextStyle(color: Colors.white)),
        ),
      );
    }

    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ====================================================
              // 1. Poster Image with Buttons & Overlay Gradient
              // ====================================================
              Stack(
                children: [
                  // صورة الفيلم الأساسية
                  SizedBox(
                    height: 480,
                    width: double.infinity,
                    child: Image.network(
                      selectedMovie.coverImage,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) =>
                          Container(color: Colors.grey.shade900),
                    ),
                  ),

                  // تدرج للون الأسود من الأسفل لدمج الصورة مع الخلفية
                  Positioned.fill(
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.black.withOpacity(0.2),
                            Colors.transparent,
                            const Color(0xFF121212).withOpacity(0.8),
                            const Color(0xFF121212),
                          ],
                          stops: const [0.0, 0.4, 0.85, 1.0],
                        ),
                      ),
                    ),
                  ),

                  // زر الرجوع
                  Positioned(
                    top: 16,
                    left: 16,
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back_ios_new,
                          color: Colors.white, size: 22),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),

                  // زر Bookmark (أعلى اليمين)
                  Positioned(
                    top: 16,
                    right: 16,
                    child: IconButton(
                      icon: const Icon(Icons.bookmark,
                          color: Colors.white, size: 28),
                      onPressed: () {},
                    ),
                  ),

                  // زر التشغيل الأصفر المنتصف
                  Positioned.fill(
                    child: Align(
                      alignment: Alignment.center,
                      child: Container(
                        width: 65,
                        height: 65,
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFC107),
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 3),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              blurRadius: 10,
                              spreadRadius: 2,
                            ),
                          ],
                        ),
                        child: const Icon(
                          Icons.play_arrow_rounded,
                          color: Colors.white,
                          size: 42,
                        ),
                      ),
                    ),
                  ),

                  // اسم الفيلم وسنة الإنتاج فوق الزر الأحمر
                  Positioned(
                    bottom: 0,
                    left: 20,
                    right: 20,
                    child: Column(
                      children: [
                        Text(
                          selectedMovie.title,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 6),
                        const Text(
                          '2022',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // ====================================================
              // 2. Watch Button (الزر الأحمر)
              // ====================================================
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFE52427),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 0,
                    ),
                    onPressed: () {},
                    child: const Text(
                      'Watch',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // ====================================================
              // 3. Stats Row (الكبسولات الثلاثة)
              // ====================================================
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    _buildStatChip(
                      icon: Icons.favorite,
                      iconColor: const Color(0xFFFFC107),
                      text: '15',
                    ),
                    const SizedBox(width: 12),
                    _buildStatChip(
                      icon: Icons.access_time_filled,
                      iconColor: const Color(0xFFFFC107),
                      text: '90',
                    ),
                    const SizedBox(width: 12),
                    _buildStatChip(
                      icon: Icons.star,
                      iconColor: const Color(0xFFFFC107),
                      text: selectedMovie.rating.toString(),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // ====================================================
              // 4. Screen Shots Section
              // ====================================================
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Screen Shots',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              const SizedBox(height: 12),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: List.generate(
                    3,
                        (index) => Container(
                      margin: const EdgeInsets.only(bottom: 12),
                      height: 160,
                      width: double.infinity,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.network(
                          selectedMovie.coverImage,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) =>
                              Container(color: Colors.grey.shade900),
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  // Wdiget مساعد لبناء الكبسولات (Likes, Duration, Rating)
  Widget _buildStatChip({
    required IconData icon,
    required Color iconColor,
    required String text,
  }) {
    return Expanded(
      child: Container(
        height: 42,
        decoration: BoxDecoration(
          color: const Color(0xFF262626),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: iconColor, size: 20),
            const SizedBox(width: 8),
            Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}