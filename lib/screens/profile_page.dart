import 'package:flutter/material.dart';
import '../data/movies.dart';
import '../theme.dart';
import '../widgets/bottom_nav.dart';
import '../widgets/movie_poster.dart';

class ProfilePage extends StatefulWidget {
  final ValueChanged<int>? onNavigate;

  const ProfilePage({super.key, this.onNavigate});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    final list = selectedTab == 0 ? watchList : history;

    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(18, 18, 18, 16),
                child: Column(
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 34,
                          backgroundColor: AppColors.surface2,
                          backgroundImage: const AssetImage('assets/avatar.png'),
                        ),
                        const SizedBox(width: 14),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'John safwat',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Row(
                                children: [
                                  _Stat(value: '12', label: 'Watch List'),
                                  const SizedBox(width: 25),
                                  _Stat(value: '10', label: 'History'),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: _ActionButton(
                            label: 'Edit Profile',
                            filled: true,
                            onTap: () {},
                          ),
                        ),
                        const SizedBox(width: 9),
                        _ActionButton(
                          label: 'Exit',
                          filled: false,
                          onTap: () {},
                        ),
                      ],
                    ),
                    const SizedBox(height: 22),
                    Row(
                      children: [
                        Expanded(
                          child: _Tab(
                            label: 'Watch List',
                          active: selectedTab == 0,
                          onTap: () => setState(() => selectedTab = 0),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: _Tab(
                            label: 'History',
                            active: selectedTab == 1,
                            onTap: () => setState(() => selectedTab = 1),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 13),
                    const Divider(color: Color(0xFF2E2E2E), height: 1),
                    const SizedBox(height: 14),
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: list.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 12,
                        mainAxisSpacing: 12,
                        childAspectRatio: .67,
                      ),
                      itemBuilder: (_, index) => MoviePoster(movie: list[index]),
                    ),
                  ],
                ),
              ),
            ),
            MovieBottomNav(
              selectedIndex: 3,
              onTap: (index) => widget.onNavigate?.call(index),
            ),
          ],
        ),
      ),
    );
  }
}

class _Stat extends StatelessWidget {
  final String value;
  final String label;

  const _Stat({required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w800,
          ),
        ),
        const SizedBox(width: 5),
        Text(
          label,
          style: const TextStyle(
            fontSize: 9,
            color: AppColors.white,
          ),
        ),
      ],
    );
  }
}

class _ActionButton extends StatelessWidget {
  final String label;
  final bool filled;
  final VoidCallback onTap;

  const _ActionButton({
    required this.label,
    required this.filled,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 32,
      child: OutlinedButton(
        onPressed: onTap,
        style: OutlinedButton.styleFrom(
          backgroundColor: filled ? AppColors.yellow : Colors.transparent,
          foregroundColor: filled ? Colors.black : AppColors.red,
          side: BorderSide(
            color: filled ? AppColors.yellow : AppColors.red,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        child: Text(
          label,
          style: const TextStyle(
            fontSize: 9,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}

class _Tab extends StatelessWidget {
  final String label;
  final bool active;
  final VoidCallback onTap;

  const _Tab({
    required this.label,
    required this.active,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 11),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: active ? AppColors.yellow : AppColors.muted,
            fontWeight: active ? FontWeight.w700 : FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
