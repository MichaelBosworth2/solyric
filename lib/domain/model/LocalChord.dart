import 'package:solyric_app/domain/model/LocalChordVariation.dart';

class LocalChord {
  LocalChord({this.name, this.variations});

  String name;
  List<LocalChordVariation> variations;

  static LocalChord fromJson(Map<String, dynamic> json) {
    List<LocalChordVariation> variations = List();
    json['variations'].forEach((e) {variations.add(LocalChordVariation.fromJson(e));});
    return LocalChord(name: json['name'], variations: variations);
  }
}
