import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import '../data/destination_data.dart';
import '../models/destination.dart';
import '../theme/app_theme.dart';
import '../widgets/custom_top_bar.dart';
import '../widgets/hero_card_swiper.dart';
import '../widgets/hero_carousel_slider.dart';
import '../widgets/horizontal_destination_section.dart';

enum HeroViewMode { carousel, cardSwiper }

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HeroViewMode _heroViewMode = HeroViewMode.carousel;
  final Set<String> _favoriteIds = {'oppenheimer', 'interstellar'};

  void _toggleFavorite(Destination destination) {
    setState(() {
      if (_favoriteIds.contains(destination.id)) {
        _favoriteIds.remove(destination.id);
        _showSnackBar('Dihapus dari favorit: ${destination.title}');
      } else {
        _favoriteIds.add(destination.id);
        _showSnackBar('Ditambahkan ke favorit: ${destination.title}', isSuccess: true);
      }
    });
  }

  void _showSnackBar(String message, {bool isSuccess = false}) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor:
            isSuccess ? AppColors.surfaceContainerHigh : const Color(0xFF2E2E2E),
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 2),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(
            color: isSuccess ? AppColors.primary : Colors.white12,
            width: 1,
          ),
        ),
      ),
    );
  }

  void _showDetailSheet(Destination destination) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: AppColors.surfaceContainer,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(28)),
            border: Border.all(color: Colors.white.withValues(alpha: 0.1)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  margin: const EdgeInsets.only(bottom: 20),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              if (destination.tag != null)
                Text(
                  destination.tag!.toUpperCase(),
                  style: const TextStyle(
                    color: AppColors.secondary,
                    fontWeight: FontWeight.w700,
                    fontSize: 12,
                    letterSpacing: 1.1,
                  ),
                ),
              const SizedBox(height: 6),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      destination.title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                        fontSize: 22,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      const Icon(Icons.star_rounded,
                          color: AppColors.secondary, size: 20),
                      const SizedBox(width: 4),
                      Text(
                        destination.rating.toStringAsFixed(1),
                        style: const TextStyle(
                          color: AppColors.secondary,
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              if (destination.location != null) ...[
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(Icons.movie_filter_outlined,
                        color: AppColors.onSurfaceVariant, size: 16),
                    const SizedBox(width: 4),
                    Text(
                      destination.location!,
                      style: const TextStyle(
                        color: AppColors.onSurfaceVariant,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ],
              if (destination.description != null) ...[
                const SizedBox(height: 14),
                Text(
                  destination.description!,
                  style: const TextStyle(
                    color: AppColors.onSurfaceVariant,
                    fontSize: 14,
                    height: 1.5,
                  ),
                ),
              ],
              const SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                        _toggleFavorite(destination);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        foregroundColor: AppColors.onPrimary,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: Text(
                        _favoriteIds.contains(destination.id)
                            ? 'Hapus dari Favorit'
                            : 'Simpan ke Favorit',
                        style: const TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: CustomTopBar(
        onSearchPressed: () {
          _showSnackBar('Fitur pencarian film');
        },
      ),
      body: _buildHomeContent(),
    );
  }

  Widget _buildHomeContent() {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.only(top: 16, bottom: 28),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 480),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Hero Package View Toggle Switcher (carousel_slider vs flutter_card_swiper)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Container(
                            width: 8,
                            height: 8,
                            decoration: const BoxDecoration(
                              color: AppColors.primary,
                              shape: BoxShape.circle,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Flexible(
                            child: Text(
                              _heroViewMode == HeroViewMode.carousel
                                  ? 'Carousel View'
                                  : 'Card Swiper',
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                                color: AppColors.onSurfaceVariant,
                                letterSpacing: 0.5,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 10),
                    Container(
                      padding: const EdgeInsets.all(3),
                      decoration: BoxDecoration(
                        color: AppColors.surfaceContainerHigh,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: Colors.white.withValues(alpha: 0.08),
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          _buildModeButton(
                            title: 'Carousel',
                            icon: Icons.view_carousel_rounded,
                            isSelected: _heroViewMode == HeroViewMode.carousel,
                            onTap: () {
                              setState(() {
                                _heroViewMode = HeroViewMode.carousel;
                              });
                            },
                          ),
                          _buildModeButton(
                            title: 'Swiper',
                            icon: Icons.style_rounded,
                            isSelected:
                                _heroViewMode == HeroViewMode.cardSwiper,
                            onTap: () {
                              setState(() {
                                _heroViewMode = HeroViewMode.cardSwiper;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 8),

              // Hero Section: View Mode Carousel or Card Swiper
              AnimatedCrossFade(
                firstChild: HeroCarouselSlider(
                  destinations: DestinationData.heroDestinations,
                  onCardTap: _showDetailSheet,
                  onActionTap: _showDetailSheet,
                ),
                secondChild: HeroCardSwiper(
                  destinations: DestinationData.heroDestinations,
                  onCardTap: _showDetailSheet,
                  onSwiped: (destination, direction) {
                    if (direction == CardSwiperDirection.right) {
                      _toggleFavorite(destination);
                    } else if (direction == CardSwiperDirection.left) {
                      _showSnackBar('Melewati ${destination.title}');
                    }
                  },
                ),
                crossFadeState: _heroViewMode == HeroViewMode.carousel
                    ? CrossFadeState.showFirst
                    : CrossFadeState.showSecond,
                duration: const Duration(milliseconds: 350),
              ),

              const SizedBox(height: 28),

              // Section 3: Trending
              HorizontalDestinationSection(
                title: 'Trending',
                destinations: DestinationData.trendingDestinations,
                onMoreTap: () => _showSnackBar('Menampilkan lebih banyak film Trending'),
                onCardTap: _showDetailSheet,
              ),

              const SizedBox(height: 28),

              // Section 4: Popular
              HorizontalDestinationSection(
                title: 'Popular',
                destinations: DestinationData.popularDestinations,
                onMoreTap: () => _showSnackBar('Menampilkan lebih banyak film Popular'),
                onCardTap: _showDetailSheet,
              ),

              const SizedBox(height: 28),

              // Section 5: Top Rated
              HorizontalDestinationSection(
                title: 'Top Rated',
                destinations: DestinationData.topRatedDestinations,
                onMoreTap: () => _showSnackBar('Menampilkan lebih banyak film Top Rated'),
                onCardTap: _showDetailSheet,
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildModeButton({
    required String title,
    required IconData icon,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary : Colors.transparent,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 14,
              color: isSelected ? AppColors.onPrimary : AppColors.onSurfaceVariant,
            ),
            const SizedBox(width: 4),
            Text(
              title,
              style: TextStyle(
                fontSize: 11,
                fontWeight: isSelected ? FontWeight.w800 : FontWeight.w500,
                color:
                    isSelected ? AppColors.onPrimary : AppColors.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
