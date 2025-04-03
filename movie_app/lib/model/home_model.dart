class HomeModel {
  String? title;
  String? year;
  String? rated;
  String? released;
  String? runtime;
  String? genre;
  String? director;
  String? writer;
  String? actors;
  String? plot;
  String? language;
  String? country;
  String? awards;
  String? poster;
  String? metascore;
  String? imdbRating;
  String? imdbVotes;
  String? imdbID;
  String? type;
  String? response;
  List<String>? images;

  HomeModel({
    this.title,
    this.year,
    this.rated,
    this.released,
    this.runtime,
    this.genre,
    this.director,
    this.writer,
    this.actors,
    this.plot,
    this.language,
    this.country,
    this.awards,
    this.poster,
    this.metascore,
    this.imdbRating,
    this.imdbVotes,
    this.imdbID,
    this.type,
    this.response,
    this.images,
  });

  HomeModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    year = json['year'];
    rated = json['rated'];
    released = json['released'];
    runtime = json['runtime'];
    genre = json['genre'];
    director = json['director'];
    writer = json['writer'];
    actors = json['actors'];
    plot = json['plot'];
    language = json['language'];
    country = json['Country'];
    awards = json['Awards'];
    poster = json['Poster'];
    metascore = json['Metascore'];
    imdbRating = json['imdbRating'];
    imdbVotes = json['imdbVotes'];
    imdbID = json['imdbID'];
    type = json['Type'];
    response = json['Response'];
    images = json['Images'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['year'] = year;
    data['rated'] = rated;
    data['released'] = released;
    data['runtime'] = runtime;
    data['genre'] = genre;
    data['director'] = director;
    data['writer'] = writer;
    data['actors'] = actors;
    data['plot'] = plot;
    data['language'] = language;
    data['Country'] = country;
    data['Awards'] = awards;
    data['Poster'] = poster;
    data['Metascore'] = metascore;
    data['imdbRating'] = imdbRating;
    data['imdbVotes'] = imdbVotes;
    data['imdbID'] = imdbID;
    data['Type'] = type;
    data['Response'] = response;
    data['Images'] = images;
    return data;
  }
}
