part of prueba_tecnica_bia.models;

class DataResponseModel {
  int? offset;
  int? limit;
  int? total;
  int? count;
  List<ResultsResponseModel>? results;

  DataResponseModel(
      {this.offset, this.limit, this.total, this.count, this.results});

  DataResponseModel.fromJson(Map<String, dynamic> json) {
    offset = json['offset'];
    limit = json['limit'];
    total = json['total'];
    count = json['count'];
    if (json['results'] != null) {
      results = <ResultsResponseModel>[];
      json['results'].forEach((v) {
        results!.add(ResultsResponseModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['offset'] = offset;
    data['limit'] = limit;
    data['total'] = total;
    data['count'] = count;
    if (results != null) {
      data['results'] = results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
