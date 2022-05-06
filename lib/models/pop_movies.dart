import 'package:json_annotation/json_annotation.dart';
part 'pop_movies.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)

class PopMovies{

    String posterPath;
    bool adult;
    String overview;
    String? releaseDate;
    List<int> genreIds;
    int id;
    String originalTitle;
    String originalLanguage;
    String title;
    String backdropPath;
    double popularity;
    int voteCount;
    bool video;
    double voteAverage;

  PopMovies({
        required this.posterPath,
        required this.adult,
        required this.overview,
        required this.releaseDate,
        required this.genreIds,
        required this.id,
        required this.originalTitle,
        required this.originalLanguage,
        required this.title,
        required this.backdropPath,
        required this.popularity,
        required this.voteCount,
        required this.video,
        required this.voteAverage,
    });
    static DateTime? _parseDateFromString(String? rawDate){
      if (rawDate == null || rawDate.isEmpty){
        return DateTime.tryParse(rawDate.toString());
      }
    }

    factory PopMovies.fromJson(Map<String, dynamic> json) => _$PopMoviesFromJson(json);
}
