part of prueba_tecnica_bia.models;

class StoriesResponse extends ComicsAndSeriesBaseModel {
  StoriesResponse({
    required int available,
    required String collectionURI,
    required List<BaseItemResponse> items,
    required int returned,
  }) : super(
          available: available,
          collectionURI: collectionURI,
          items: items,
          returned: returned,
        );
  factory StoriesResponse.fromJson(Map<String, dynamic> json) =>
      StoriesResponse(
        available: json['available'] ?? 0,
        collectionURI: json['collectionURI'] ?? '',
        items: (json['items'] as List<dynamic>)
            .map((item) => StoriesItems.fromJson(item))
            .toList(),
        returned: json['returned'] ?? 0,
      );
}
