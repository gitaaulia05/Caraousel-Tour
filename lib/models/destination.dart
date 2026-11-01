class Destination {
  final String id;
  final String title;
  final String? location;
  final String? tag;
  final String? description;
  final double rating;
  final String imageUrl;
  final String? alt;

  const Destination({
    required this.id,
    required this.title,
    this.location,
    this.tag,
    this.description,
    this.rating = 5.0,
    required this.imageUrl,
    this.alt,
  });
}

