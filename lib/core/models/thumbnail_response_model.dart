part of prueba_tecnica_bia.models;

class ThumbnailResponseModel {
  String? path;
  String? extension;

  ThumbnailResponseModel({this.path, this.extension});

  ThumbnailResponseModel.fromJson(Map<String, dynamic> json) {
    path = json['path'];
    extension = json['extension'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['path'] = path;
    data['extension'] = extension;
    return data;
  }
}
