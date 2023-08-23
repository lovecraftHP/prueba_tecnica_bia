part of prueba_tecnica_bia.models;

class ComicsAndSeriesBaseModel {
  int? available;
  String? collectionURI;
  List<BaseItemResponse>? items;
  int? returned;

  ComicsAndSeriesBaseModel(
      {this.available, this.collectionURI, this.items, this.returned});

  ComicsAndSeriesBaseModel.fromJson(Map<String, dynamic> json) {
    available = json['available'];
    collectionURI = json['collectionURI'];
    if (json['items'] != null) {
      items = <BaseItemResponse>[];
      json['items'].forEach((v) {
        items!.add(BaseItemResponse.fromJson(v));
      });
    }
    returned = json['returned'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['available'] = available;
    data['collectionURI'] = collectionURI;
    if (items != null) {
      data['items'] = items!.map((v) => v.toJson()).toList();
    }
    data['returned'] = returned;
    return data;
  }
}
