import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import '../models/destination.dart';
import '../theme/app_theme.dart';
import 'custom_image.dart';

class HeroCardSwiper extends StatefulWidget {
  final List<Destination> destinations;
  final Function(Destination)? onCardTap;
  final Function(Destination, CardSwiperDirection)? onSwiped;

  const HeroCardSwiper({
    super.key,
    required this.destinations,
    this.onCardTap,
    this.onSwiped,
  });

  @override
  State<HeroCardSwiper> createState() => _HeroCardSwiperState();
}

class _HeroCardSwiperState extends State<HeroCardSwiper> {
  final CardSwiperController _controller = CardSwiperController();
  int _activeCardsCount = 0;

  @override
  void initState() {
    super.initState();
    _activeCardsCount = widget.destinations.length;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_activeCardsCount == 0) {
      return Container(
        height: 430,
        margin: const EdgeInsets.symmetric(horizontal: 24),
        decoration: BoxDecoration(
          color: AppColors.surfaceContainer,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: Colors.white.withValues(alpha: 0.08)),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.check_circle_outline_rounded,
                size: 54,
                color: AppColors.primary,
              ),
              const SizedBox(height: 16),
              Text(
                'Semua Film Telah Dilihat!',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
              ),
              const SizedBox(height: 8),
              Text(
                'Ketuk tombol di bawah untuk mengulang',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: AppColors.onSurfaceVariant,
                    ),
              ),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: () {
                  setState(() {
                    _activeCardsCount = widget.destinations.length;
                  });
                },
                icon: const Icon(Icons.refresh_rounded, color: AppColors.onPrimary),
                label: const Text(
                  'Ulangi Kartu',
                  style: TextStyle(
                    color: AppColors.onPrimary,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Column(
      children: [
        SizedBox(
          height: 430,
          child: CardSwiper(
            controller: _controller,
            cardsCount: widget.destinations.length,
            numberOfCardsDisplayed: widget.destinations.length < 3
                ? widget.destinations.length
                : 3,
            backCardOffset: const Offset(0, 24),
            scale: 0.94,
            padding: const EdgeInsets.symmetric(horizontal: 24),
            isLoop: true,
            onSwipe: (previousIndex, currentIndex, direction) {
              final destination = widget.destinations[previousIndex];
              widget.onSwiped?.call(destination, direction);
              return true;
            },
            onEnd: () {
              setState(() {
                _activeCardsCount = 0;
              });
            },
            cardBuilder: (context, index, percentX, percentY) {
              final destination = widget.destinations[index];
              return _buildCard(destination, percentX, percentY);
            },
          ),
        ),

        const SizedBox(height: 16),

        // Action Control Buttons for Card Swiper
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Undo button
            _buildActionButton(
              icon: Icons.replay_rounded,
              color: AppColors.secondary,
              size: 42,
              onTap: () => _controller.undo(),
              tooltip: 'Undo',
            ),
            const SizedBox(width: 20),

            // Dislike / Skip Left
            _buildActionButton(
              icon: Icons.close_rounded,
              color: const Color(0xFFFF6B6B),
              size: 52,
              onTap: () => _controller.swipe(CardSwiperDirection.left),
              tooltip: 'Skip',
            ),
            const SizedBox(width: 20),

            // Like / Favorite Right
            _buildActionButton(
              icon: Icons.favorite_rounded,
              color: AppColors.primary,
              size: 52,
              onTap: () => _controller.swipe(CardSwiperDirection.right),
              tooltip: 'Favorite',
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildCard(Destination destination, int percentX, int percentY) {
    return GestureDetector(
      onTap: () => widget.onCardTap?.call(destination),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: Colors.white.withValues(alpha: 0.15),
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.65),
              blurRadius: 36,
              offset: const Offset(0, 16),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(24),
          child: Stack(
            fit: StackFit.expand,
            children: [
              CustomImage(
                imageUrl: destination.imageUrl,
                fit: BoxFit.cover,
              ),

              // Gradient Scrim
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.transparent,
                      AppColors.surface.withValues(alpha: 0.75),
                      AppColors.surface.withValues(alpha: 0.98),
                    ],
                    stops: const [0.0, 0.45, 0.75, 1.0],
                  ),
                ),
              ),

              // Swipe visual indicator stamp (LIKE / NOPE)
              if (percentX > 15)
                Positioned(
                  top: 24,
                  left: 24,
                  child: Transform.rotate(
                    angle: -0.2,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 14, vertical: 6),
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.primary, width: 2.5),
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.black.withValues(alpha: 0.3),
                      ),
                      child: const Text(
                        'FAVORITE',
                        style: TextStyle(
                          color: AppColors.primary,
                          fontWeight: FontWeight.w900,
                          fontSize: 18,
                          letterSpacing: 2.0,
                        ),
                      ),
                    ),
                  ),
                ),

              if (percentX < -15)
                Positioned(
                  top: 24,
                  right: 24,
                  child: Transform.rotate(
                    angle: 0.2,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 14, vertical: 6),
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: const Color(0xFFFF6B6B), width: 2.5),
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.black.withValues(alpha: 0.3),
                      ),
                      child: const Text(
                        'LEWATI',
                        style: TextStyle(
                          color: Color(0xFFFF6B6B),
                          fontWeight: FontWeight.w900,
                          fontSize: 18,
                          letterSpacing: 2.0,
                        ),
                      ),
                    ),
                  ),
                ),

              // Bottom card text & button
              Positioned(
                left: 20,
                right: 20,
                bottom: 20,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (destination.tag != null) ...[
                            Text(
                              destination.tag!.toUpperCase(),
                              style: Theme.of(context)
                                  .textTheme
                                  .labelSmall
                                  ?.copyWith(
                                    color: AppColors.secondary,
                                    fontWeight: FontWeight.w700,
                                    letterSpacing: 1.1,
                                  ),
                            ),
                            const SizedBox(height: 4),
                          ],
                          Text(
                            destination.title,
                            style: Theme.of(context)
                                .textTheme
                                .headlineMedium
                                ?.copyWith(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w800,
                                  color: Colors.white,
                                  height: 1.2,
                                ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          if (destination.description != null) ...[
                            const SizedBox(height: 6),
                            Text(
                              destination.description!,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                    color: AppColors.onSurfaceVariant,
                                    height: 1.4,
                                  ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ],
                      ),
                    ),
                    const SizedBox(width: 12),
                    Container(
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.3),
                            blurRadius: 12,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.chevron_right_rounded,
                          color: Colors.black,
                          size: 26,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    required Color color,
    required double size,
    required VoidCallback onTap,
    required String tooltip,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(size / 2),
        child: Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.surfaceContainerHigh,
            border: Border.all(
              color: color.withValues(alpha: 0.4),
              width: 1.5,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.4),
                blurRadius: 8,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Icon(
            icon,
            color: color,
            size: size * 0.5,
          ),
        ),
      ),
    );
  }
}

