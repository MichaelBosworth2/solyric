class LocalChordVariation {
  const LocalChordVariation({this.positions, this.name});

  final List<String> positions;
  final String name;

  static LocalChordVariation fromJson(Map<String, dynamic> json) =>
      LocalChordVariation(
          name: json['name'], positions: json['positions'].cast<String>());
}
