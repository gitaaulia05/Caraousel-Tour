import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:caraousel_tour/main.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';

void main() {
  testWidgets('Explore Movies layout displays Home only without navigation and hamburger menu',
      (WidgetTester tester) async {
    // Set a phone screen size
    tester.view.physicalSize = const Size(1080, 2400);
    tester.view.devicePixelRatio = 2.75;
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });

    await tester.pumpWidget(const ExploreMoviesApp());
    await tester.pumpAndSettle();

    // Verify Title & Search icon are present in Top Bar
    expect(find.text('Explore Movies'), findsOneWidget);
    expect(find.byIcon(Icons.search_rounded), findsOneWidget);

    // Verify hamburger menu is REMOVED
    expect(find.byIcon(Icons.menu_rounded), findsNothing);

    // Verify Bottom Navigation is REMOVED (no tab labels)
    expect(find.text('Home'), findsNothing);
    expect(find.text('Kategori'), findsNothing);
    expect(find.text('Favorite'), findsNothing);

    // Verify Hero Carousel Slider is present by default
    expect(find.byType(CarouselSlider), findsOneWidget);

    // Verify Horizontal Sections exist on Home
    expect(find.text('Trending'), findsOneWidget);
    expect(find.text('Popular'), findsOneWidget);
    expect(find.text('Top Rated'), findsOneWidget);

    // Verify Movies are rendered
    expect(find.text('Oppenheimer'), findsWidgets);
    expect(find.text('Avatar: The Way of Water'), findsWidgets);
    expect(find.text('Avengers: Endgame'), findsWidgets);
    expect(find.text('The Shawshank Redemption'), findsWidgets);
  });

  testWidgets('Switching Hero to Card Swiper mode displays flutter_card_swiper',
      (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1080, 2400);
    tester.view.devicePixelRatio = 2.75;
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });

    await tester.pumpWidget(const ExploreMoviesApp());
    await tester.pumpAndSettle();

    // Tap on the 'Swiper' toggle button
    final swiperBtn = find.text('Swiper');
    expect(swiperBtn, findsOneWidget);
    await tester.tap(swiperBtn);
    await tester.pumpAndSettle();

    // Verify CardSwiper widget is now displayed
    expect(find.byType(CardSwiper), findsOneWidget);

    // Verify Action buttons (Undo, Skip, Favorite) exist
    expect(find.byIcon(Icons.replay_rounded), findsOneWidget);
    expect(find.byIcon(Icons.close_rounded), findsOneWidget);
    expect(find.byIcon(Icons.favorite_rounded), findsWidgets);
  });
}
