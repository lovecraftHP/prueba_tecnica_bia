part of prueba_tecnica_bia.models;

class ResultsResponseModel {
  int? id;
  String? name;
  String? description;
  String? modified;
  ThumbnailResponseModel? thumbnail;
  String? resourceURI;
  ComicsAndSeriesBaseModel? comics;
  ComicsAndSeriesBaseModel? series;
  StoriesResponse? stories;
  ComicsAndSeriesBaseModel? events;
  List<UrlsResponse>? urls;

  ResultsResponseModel(
      {this.id,
      this.name,
      this.description,
      this.modified,
      this.thumbnail,
      this.resourceURI,
      this.comics,
      this.series,
      this.stories,
      this.events,
      this.urls});

  ResultsResponseModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    modified = json['modified'];
    thumbnail = json['thumbnail'] != null
        ? ThumbnailResponseModel.fromJson(json['thumbnail'])
        : null;
    resourceURI = json['resourceURI'];
    comics = json['comics'] != null
        ? ComicsAndSeriesBaseModel.fromJson(json['comics'])
        : null;
    series = json['series'] != null
        ? ComicsAndSeriesBaseModel.fromJson(json['series'])
        : null;
    stories = json['stories'] != null
        ? StoriesResponse.fromJson(json['stories'])
        : null;
    events = json['events'] != null
        ? ComicsAndSeriesBaseModel.fromJson(json['events'])
        : null;
    if (json['urls'] != null) {
      urls = <UrlsResponse>[];
      json['urls'].forEach((v) {
        urls!.add(UrlsResponse.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['modified'] = modified;
    if (thumbnail != null) {
      data['thumbnail'] = thumbnail!.toJson();
    }
    data['resourceURI'] = resourceURI;
    if (comics != null) {
      data['comics'] = comics!.toJson();
    }
    if (series != null) {
      data['series'] = series!.toJson();
    }
    if (stories != null) {
      data['stories'] = stories!.toJson();
    }
    if (events != null) {
      data['events'] = events!.toJson();
    }
    if (urls != null) {
      data['urls'] = urls!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
