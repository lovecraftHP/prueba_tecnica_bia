part of prueba_tecnica_bia.models;

class UrlsResponse {
  String? type;
  String? url;

  UrlsResponse({this.type, this.url});

  UrlsResponse.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    data['url'] = url;
    return data;
  }
}
