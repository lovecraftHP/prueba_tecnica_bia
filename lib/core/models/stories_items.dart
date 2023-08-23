part of prueba_tecnica_bia.models;

class StoriesItems extends BaseItemResponse {
  StoriesItems({
    required String resourceURI,
    required String name,
    this.type,
  }) : super(name: name, resourceURI: resourceURI);

  final String? type;
  factory StoriesItems.fromJson(Map<String, dynamic> json) => StoriesItems(
        resourceURI: json['resourceURI'] ?? '',
        name: json['name'] ?? '',
        type: json['type'] ?? '',
      );

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['resourceURI'] = resourceURI;
    data['name'] = name;
    data['type'] = type;
    return data;
  }
}
