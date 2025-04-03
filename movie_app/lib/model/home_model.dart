class HomeModel {
  int? id;
  String? title;
  int? year;
  List<String>? genre;
  double? rating;
  String? director;
  List<String>? actors;
  String? plot;
  String? poster;
  String? trailer;
  int? runtime;
  String? awards;
  String? country;
  String? language;
  String? boxOffice;
  String? production;
  String? website;

  HomeModel({
    this.id,
    this.title,
    this.year,
    this.genre,
    this.rating,
    this.director,
    this.actors,
    this.plot,
    this.poster,
    this.trailer,
    this.runtime,
    this.awards,
    this.country,
    this.language,
    this.boxOffice,
    this.production,
    this.website,
  });

  HomeModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    year = json['year'];
    genre = json['genre'].cast<String>();

    // Eğer `rating` int gelirse, double'a çeviriyoruz
    rating =
        (json['rating'] is int)
            ? (json['rating'] as int).toDouble()
            : json['rating'];

    director = json['director'];
    actors = json['actors'].cast<String>();
    plot = json['plot'];
    poster = json['poster'];
    trailer = json['trailer'];

    // `runtime` bazen int bazen String gelebilir, bu yüzden her iki durumu da kontrol ediyoruz.
    if (json['runtime'] is int) {
      runtime = json['runtime'];
    } else if (json['runtime'] is String) {
      runtime = int.tryParse(json['runtime'] ?? "0");
    } else {
      runtime = null;
    }

    awards = json['awards'];
    country = json['country'];
    language = json['language'];
    boxOffice = json['boxOffice'];
    production = json['production'];
    website = json['website'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['year'] = year;
    data['genre'] = genre;
    data['rating'] = rating;
    data['director'] = director;
    data['actors'] = actors;
    data['plot'] = plot;
    data['poster'] = poster;
    data['trailer'] = trailer;
    data['runtime'] = runtime;
    data['awards'] = awards;
    data['country'] = country;
    data['language'] = language;
    data['boxOffice'] = boxOffice;
    data['production'] = production;
    data['website'] = website;
    return data;
  }
}
