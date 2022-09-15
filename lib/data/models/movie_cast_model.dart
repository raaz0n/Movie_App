import 'package:movie_app/domain/entities/cast_entity.dart';

class CastResultModel {
  int? id;
  List<CastModel>? cast;
  List<Crew>? crew;

  CastResultModel({this.id, this.cast, this.crew});

  CastResultModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    if (json['cast'] != null) {
      cast = <CastModel>[];
      json['cast'].forEach((v) {
        cast!.add(CastModel.fromJson(v));
      });
    }
    if (json['crew'] != null) {
      crew = <Crew>[];
      json['crew'].forEach((v) {
        crew!.add(Crew.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (cast != null) {
      data['cast'] = cast!.map((v) => v.toJson()).toList();
    }
    if (crew != null) {
      data['crew'] = crew!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CastModel extends CastEntity {
  bool? adult;
  int? gender;
  int? id;
  String? knownForDepartment;
  @override
  String name;
  String? originalName;
  double? popularity;
  @override
  String profilePath;
  int? castId;
  @override
  String character;
  @override
  String creditId;
  int? order;

  CastModel(
      {this.adult,
      this.gender,
      this.id,
      this.knownForDepartment,
      required this.name,
      this.originalName,
      this.popularity,
      required this.profilePath,
      this.castId,
      required this.character,
      required this.creditId,
      this.order})
      : super(
            creditId: creditId,
            name: name,
            posterPath: profilePath,
            character: character);

  factory CastModel.fromJson(Map<String, dynamic> json) => CastModel(
        adult: json["adult"],
        gender: json['gender'],
        id: json['id'],
        knownForDepartment: json['known_for_department'],
        name: json['name'],
        originalName: json['original_name'],
        popularity: json['popularity'],
        profilePath: json['profile_path'],
        castId: json['cast_id'],
        character: json['character'],
        creditId: json['credit_id'],
        order: json['order'],
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['adult'] = adult;
    data['gender'] = gender;
    data['id'] = id;
    data['known_for_department'] = knownForDepartment;
    data['name'] = name;
    data['original_name'] = originalName;
    data['popularity'] = popularity;
    data['profile_path'] = profilePath;
    data['cast_id'] = castId;
    data['character'] = character;
    data['credit_id'] = creditId;
    data['order'] = order;
    return data;
  }
}

class Crew {
  bool? adult;
  int? gender;
  int? id;
  String? knownForDepartment;
  String? name;
  String? originalName;
  double? popularity;
  String? profilePath;
  String? creditId;
  String? department;
  String? job;

  Crew(
      {this.adult,
      this.gender,
      this.id,
      this.knownForDepartment,
      this.name,
      this.originalName,
      this.popularity,
      this.profilePath,
      this.creditId,
      this.department,
      this.job});

  Crew.fromJson(Map<String, dynamic> json) {
    adult = json['adult'];
    gender = json['gender'];
    id = json['id'];
    knownForDepartment = json['known_for_department'];
    name = json['name'];
    originalName = json['original_name'];
    popularity = json['popularity'];
    profilePath = json['profile_path'];
    creditId = json['credit_id'];
    department = json['department'];
    job = json['job'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['adult'] = adult;
    data['gender'] = gender;
    data['id'] = id;
    data['known_for_department'] = knownForDepartment;
    data['name'] = name;
    data['original_name'] = originalName;
    data['popularity'] = popularity;
    data['profile_path'] = profilePath;
    data['credit_id'] = creditId;
    data['department'] = department;
    data['job'] = job;
    return data;
  }
}
