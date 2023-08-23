part of prueba_tecnica_bia.models;

class BaseItemResponse {
  String? resourceURI;
  String? name;

  BaseItemResponse({this.resourceURI, this.name});

  BaseItemResponse.fromJson(Map<String, dynamic> json) {
    resourceURI = json['resourceURI'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['resourceURI'] = resourceURI;
    data['name'] = name;
    return data;
  }
}
