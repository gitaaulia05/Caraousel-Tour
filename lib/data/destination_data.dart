import '../models/destination.dart';

class DestinationData {
  static const List<Destination> heroDestinations = [
    Destination(
      id: 'oppenheimer',
      title: 'Oppenheimer',
      location: 'Christopher Nolan • Universal',
      tag: '2023 • Biography & Drama',
      description:
          'Kisah fisikawan J. Robert Oppenheimer yang memimpin Proyek Manhattan dalam perlombaan senjata menciptakan bom atom pertama.',
      rating: 4.9,
      imageUrl:
          'https://image.tmdb.org/t/p/w500/8Gxv8gSFCU0XGDykEGv7zR1n2ua.jpg',
      alt: 'Oppenheimer Movie Poster',
    ),
    Destination(
      id: 'dune_part_two',
      title: 'Dune: Part Two',
      location: 'Denis Villeneuve • Warner Bros',
      tag: '2024 • Sci-Fi & Adventure',
      description:
          'Perjalanan mistis Paul Atreides bersatu dengan Chani dan Fremen untuk membalas dendam terhadap konspirator yang menghancurkan keluarganya.',
      rating: 4.9,
      imageUrl:
          'https://image.tmdb.org/t/p/w500/8b8R8l88Qje9dn9OE8PY05Nxl1X.jpg',
      alt: 'Dune Part Two Movie Poster',
    ),
    Destination(
      id: 'spider_verse',
      title: 'Across the Spider-Verse',
      location: 'Sony Pictures Animation',
      tag: '2023 • Animation & Action',
      description:
          'Miles Morales terlempar melintasi Multiverse dan bertarung melawan tim Spider-People pimpinan Miguel O\'Hara.',
      rating: 4.9,
      imageUrl:
          'https://image.tmdb.org/t/p/w500/8Vt6mWEReuy4Of61Lnj5Xj704m8.jpg',
      alt: 'Spider-Man Across the Spider-Verse Movie Poster',
    ),
    Destination(
      id: 'interstellar',
      title: 'Interstellar',
      location: 'Christopher Nolan • Paramount',
      tag: '2014 • Sci-Fi & Adventure',
      description:
          'Ketika bumi tak lagi dapat dihuni, sekelompok penjelajah melintasi lubang cacing antargalaksi demi masa depan umat manusia.',
      rating: 5.0,
      imageUrl:
          'https://image.tmdb.org/t/p/w500/gEU2QniE6E77NI6lCU6MxlNBvIx.jpg',
      alt: 'Interstellar Movie Poster',
    ),
  ];

  static const List<Destination> trendingDestinations = [
    Destination(
      id: 'avatar_2',
      title: 'Avatar: The Way of Water',
      location: 'James Cameron',
      rating: 4.8,
      imageUrl:
          'https://image.tmdb.org/t/p/w500/t6HIqrRAclMCA60NsSmeqe9RmNV.jpg',
    ),
    Destination(
      id: 'the_dark_knight',
      title: 'The Dark Knight',
      location: 'Christopher Nolan',
      rating: 5.0,
      imageUrl:
          'https://image.tmdb.org/t/p/w500/qJ2tW6WMUDux911r6m7haRef0WH.jpg',
    ),
    Destination(
      id: 'inception',
      title: 'Inception',
      location: 'Christopher Nolan',
      rating: 4.9,
      imageUrl:
          'https://image.tmdb.org/t/p/w500/edv5CZvWj09upOsy2Y6IwDhK8bt.jpg',
    ),
  ];

  static const List<Destination> popularDestinations = [
    Destination(
      id: 'avengers_endgame',
      title: 'Avengers: Endgame',
      location: 'Marvel Studios',
      rating: 4.9,
      imageUrl:
          'https://image.tmdb.org/t/p/w500/or06FN3Dka5tukK1e9sl16pB3iy.jpg',
    ),
    Destination(
      id: 'parasite',
      title: 'Parasite',
      location: 'Bong Joon-ho',
      rating: 4.9,
      imageUrl:
          'https://image.tmdb.org/t/p/w500/7IiTTgloJzvGI1TAYymCfbfl3vT.jpg',
    ),
    Destination(
      id: 'gladiator',
      title: 'Gladiator',
      location: 'Ridley Scott',
      rating: 4.8,
      imageUrl:
          'https://image.tmdb.org/t/p/w500/ty8TGRuvJLPUmAR1H1nRIsgwvim.jpg',
    ),
  ];

  static const List<Destination> topRatedDestinations = [
    Destination(
      id: 'shawshank_redemption',
      title: 'The Shawshank Redemption',
      location: 'Frank Darabont',
      rating: 5.0,
      imageUrl:
          'https://image.tmdb.org/t/p/w500/q6y0Go1tsGEsmtFryDOJo3dEmqu.jpg',
    ),
    Destination(
      id: 'the_godfather',
      title: 'The Godfather',
      location: 'Francis Ford Coppola',
      rating: 5.0,
      imageUrl:
          'https://image.tmdb.org/t/p/w500/3bhkrj58Vtu7enYsRolD1fZdja1.jpg',
    ),
    Destination(
      id: 'pulp_fiction',
      title: 'Pulp Fiction',
      location: 'Quentin Tarantino',
      rating: 4.9,
      imageUrl:
          'https://image.tmdb.org/t/p/w500/d5iIlFn5s0ImszYzBPb8JPIfbXD.jpg',
    ),
  ];
}
