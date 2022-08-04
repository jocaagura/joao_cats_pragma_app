import 'package:joao_cats_pragma_app/services/service_helpers.dart';

const String kNoImage =
    'https://i.pinimg.com/originals/80/5d/92/805d9290bf80860153c6804cc0ed2d3a.gif';

class ModelCat {
  ModelCat({
    this.breedName = 'anonymous',
    this.origin = 'Colombia',
    this.urlPhoto = kNoImage,
    this.affectionLevel = 0,
    this.intelligence = 0,
  });

  String breedName;
  String origin;
  String urlPhoto;
  int affectionLevel;
  int intelligence;

  factory ModelCat.fromJson(Map<String, dynamic> json) {
    final tmp = ModelCat(
      breedName: json["name"] == null ? 'NA' : json["name"].toString(),
      origin: json["origin"] == null ? 'NA' : json["origin"].toString(),
      urlPhoto: json["image"]?['url'] == null
          ? kNoImage
          : json["image"]['url'].toString(),
      affectionLevel: int.tryParse(json["affectionLevel"].toString()) ?? 0,
      intelligence: int.tryParse(json["intelligence"].toString()) ?? 0,
    );
    if (ServiceHelpers.validateUrl(tmp.urlPhoto) == false) {
      tmp.urlPhoto = kNoImage;
    }
    return tmp;
  }

  Map<String, dynamic> toJson() => {
        "breedName": breedName,
        "origin": origin,
        "urlPhoto": urlPhoto,
        "affectionLevel": affectionLevel,
        "intelligence": intelligence,
      };
}
