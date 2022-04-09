class Aspect {
  final String name;
  final List<String> images;
  final List<String>? facts;
  final List<List<String>>? steppers;
  final String? description;

  Aspect({
    required this.name,
    required this.images,
    this.facts,
    this.steppers,
    this.description,
  });
}
