import 'package:flutter/material.dart';

class MovieDetailsScreen extends StatelessWidget {
  const MovieDetailsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Stack(children: [
              SizedBox(height: 360, width: double.infinity, child: Image.asset('assets/images/doctor_hero.jpg', fit: BoxFit.cover)),
              Positioned(top: 12, left: 12, child: CircleAvatar(backgroundColor: Colors.black54, child: IconButton(icon: const Icon(Icons.arrow_back), onPressed: () => Navigator.pop(context)))),
              const Positioned(top: 12, right: 12, child: Icon(Icons.bookmark_border, size: 28)),
              Positioned(bottom: 18, left: 0, right: 0, child: Center(child: CircleAvatar(radius: 27, backgroundColor: const Color(0xFFFFC107), child: const Icon(Icons.play_arrow, color: Colors.white, size: 34)))),
            ]),
            Padding(padding: const EdgeInsets.fromLTRB(18, 12, 18, 24), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Center(child: Text('Doctor Strange in the Multiverse of Madness', textAlign: TextAlign.center, style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold))),
              const SizedBox(height: 6),
              const Center(child: Text('2022', style: TextStyle(color: Colors.white60))),
              const SizedBox(height: 15),
              SizedBox(width: double.infinity, height: 48, child: ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFFE52B2B), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))), onPressed: () {}, child: const Text('Watch'))),
              const SizedBox(height: 12),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: const [Text('❤️ 15'), Text('◉ 90'), Text('⭐ 7.6')]),
              const SizedBox(height: 20),
              const Text('Screen Shots', style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              ClipRRect(borderRadius: BorderRadius.circular(8), child: Image.asset('assets/images/1917.jpg', height: 130, width: double.infinity, fit: BoxFit.cover)),
            ])),
          ]),
        ),
      ),
    );
  }
}
