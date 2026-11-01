import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../models/destination.dart';
import '../theme/app_theme.dart';
import 'custom_image.dart';

class HeroCarouselSlider extends StatefulWidget {
  final List<Destination> destinations;
  final Function(Destination)? onCardTap;
  final Function(Destination)? onActionTap;

  const HeroCarouselSlider({
    super.key,
    required this.destinations,
    this.onCardTap,
    this.onActionTap,
  });

  @override
  State<HeroCarouselSlider> createState() => _HeroCarouselSliderState();
}

class _HeroCarouselSliderState extends State<HeroCarouselSlider> {
  int _currentIndex = 0;
  final CarouselSliderController _carouselController = CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
          carouselController: _carouselController,
          itemCount: widget.destinations.length,
          options: CarouselOptions(
            height: 430,
            viewportFraction: 0.82,
            initialPage: 0,
            enableInfiniteScroll: true,
            reverse: false,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 5),
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: true,
            enlargeFactor: 0.18,
            enlargeStrategy: CenterPageEnlargeStrategy.scale,
            scrollDirection: Axis.horizontal,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
          itemBuilder: (context, index, realIndex) {
            final destination = widget.destinations[index];
            final isCurrent = index == _currentIndex;

            return AnimatedOpacity(
              duration: const Duration(milliseconds: 300),
              opacity: isCurrent ? 1.0 : 0.45,
              child: GestureDetector(
                onTap: () => widget.onCardTap?.call(destination),
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(
                      color: isCurrent
                          ? Colors.white.withValues(alpha: 0.15)
                          : Colors.white.withValues(alpha: 0.05),
                      width: 1,
                    ),
                    boxShadow: isCurrent
                        ? [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.6),
                              blurRadius: 36,
                              offset: const Offset(0, 14),
                            ),
                          ]
                        : null,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(24),
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        // Background destination image
                        CustomImage(
                          imageUrl: destination.imageUrl,
                          fit: BoxFit.cover,
                        ),

                        // Gradient Scrim Overlay
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

                        // Bottom Content Card Details
                        Positioned(
                          left: 20,
                          right: 20,
                          bottom: 20,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              // Text Information
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

                              // Circular White Action Button
                              GestureDetector(
                                onTap: () =>
                                    widget.onActionTap?.call(destination),
                                child: Container(
                                  width: 44,
                                  height: 44,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                    boxShadow: [
                                      BoxShadow(
                                        color:
                                            Colors.black.withValues(alpha: 0.3),
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
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),

        const SizedBox(height: 14),

        // Indicator dots
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: widget.destinations.asMap().entries.map((entry) {
            final isSelected = _currentIndex == entry.key;
            return AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              width: isSelected ? 24.0 : 6.0,
              height: 6.0,
              margin: const EdgeInsets.symmetric(horizontal: 3.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3),
                color: isSelected
                    ? AppColors.primary
                    : Colors.white.withValues(alpha: 0.2),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}

