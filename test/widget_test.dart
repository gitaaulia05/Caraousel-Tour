import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:caraousel_tour/main.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';

void main() {
  testWidgets('Explore Indonesia layout loads and displays content correctly',
      (WidgetTester tester) async {
    // Set a phone screen size
    tester.view.physicalSize = const Size(1080, 2400);
    tester.view.devicePixelRatio = 2.75;
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });

    await tester.pumpWidget(const ExploreIndonesiaApp());
    await tester.pumpAndSettle();

    // Verify Title & Top Bar
    expect(find.text('Explore Indonesia'), findsOneWidget);
    expect(find.byIcon(Icons.menu_rounded), findsOneWidget);
    expect(find.byIcon(Icons.search_rounded), findsOneWidget);

    // Verify Hero Carousel Slider is present by default
    expect(find.byType(CarouselSlider), findsOneWidget);

    // Verify Horizontal Sections exist
    expect(find.text('Trending'), findsOneWidget);
    expect(find.text('Popular'), findsOneWidget);
    expect(find.text('Top Rated'), findsOneWidget);

    // Verify Destinations are rendered
    expect(find.text('Raja Ampat, Papua'), findsWidgets);
    expect(find.text('Gunung Bromo'), findsWidgets);
    expect(find.text('Candi Borobudur'), findsWidgets);
    expect(find.text('Tana Toraja'), findsWidgets);

    // Verify Bottom Navigation Items
    expect(find.text('Home'), findsOneWidget);
    expect(find.text('Kategori'), findsOneWidget);
    expect(find.text('Favorite'), findsOneWidget);
  });

  testWidgets('Switching Hero to Card Swiper mode displays flutter_card_swiper',
      (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1080, 2400);
    tester.view.devicePixelRatio = 2.75;
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });

    await tester.pumpWidget(const ExploreIndonesiaApp());
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

  testWidgets('Bottom navigation switches tabs in-place without routing',
      (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1080, 2400);
    tester.view.devicePixelRatio = 2.75;
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });

    await tester.pumpWidget(const ExploreIndonesiaApp());
    await tester.pumpAndSettle();

    // Tap 'Kategori' tab
    await tester.tap(find.text('Kategori'));
    await tester.pumpAndSettle();
    expect(find.text('Kategori & Discovery Deck'), findsOneWidget);
    expect(find.byType(CardSwiper), findsOneWidget);

    // Tap 'Favorite' tab
    await tester.tap(find.text('Favorite'));
    await tester.pumpAndSettle();
    expect(find.text('Destinasi Favorit'), findsOneWidget);

    // Tap 'Home' tab
    await tester.tap(find.text('Home'));
    await tester.pumpAndSettle();
    expect(find.text('Trending'), findsOneWidget);
  });
}
