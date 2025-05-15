
class Movie {
  bool? adult;
  String? backdrop;
  String? original_language;
  String? original_title;
  String? overview;
  String? release_date;
  String? title;
  String? poster_path;
  String? media_type;
  String? id;
  String? popularity;
  double? vote_average;
  double? vote_count;
  bool? video;

  Movie({
    this.adult,
    this.backdrop,
    this.original_language,
    this.original_title,
    this.overview,
    this.release_date,
    this.title,
    this.poster_path,
    this.media_type,
    this.id,
    this.popularity,
    this.vote_average,
    this.vote_count,
    this.video,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      adult: json['adult'],
      backdrop: json['backdrop_path'],
      original_language: json['original_language'],
      original_title: json['original_title'],
      overview: json['overview'],
      release_date: json['release_date'],
      title: json['title'],
      poster_path: json['poster_path'] ?? '',
      media_type: json['media_type'],
      id: json['id'].toString(),
      popularity: json['popularity'].toString(),
      vote_average: json['vote_average'].toDouble(),
      vote_count: json['vote_count'].toDouble(),

      video: json['video'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'adult': adult,
      'backdrop': backdrop,
      'original_language': original_language,
      'original_title': original_title,
      'overview': overview,
      'release_date': release_date,
      'title': title,
      'poster_path': poster_path,
      'media_type': media_type,
      'id': id,
      'popularity': popularity,
      'vote_average': vote_average,
      'vote_count': vote_count,
      'video': video,
    };
  }

factory Movie.fromMapSqfLite(Map<String, dynamic> map) {
    return Movie(
      adult: map['adult'] == 1,
      backdrop: map['backdrop'],
      original_language: map['original_language'],
      original_title: map['original_title'],
      overview: map['overview'],
      release_date: map['release_date'],
      title: map['title'],
      poster_path: map['poster_path'] ?? '',
      media_type: map['media_type'],
      id: map['id'].toString(),
      popularity: map['popularity'].toString(),
      vote_average: map['vote_average'].toDouble(),
      vote_count: map['vote_count'].toDouble(),
      video: map['video'] == 1,
    );
  }

}
