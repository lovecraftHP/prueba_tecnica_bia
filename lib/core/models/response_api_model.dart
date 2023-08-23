part of prueba_tecnica_bia.models;

class ResponseApiModel {
  int? code;
  String? status;
  String? copyright;
  String? attributionText;
  String? attributionHTML;
  String? etag;
  DataResponseModel? data;

  ResponseApiModel(
      {this.code,
      this.status,
      this.copyright,
      this.attributionText,
      this.attributionHTML,
      this.etag,
      this.data});

  ResponseApiModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    copyright = json['copyright'];
    attributionText = json['attributionText'];
    attributionHTML = json['attributionHTML'];
    etag = json['etag'];
    data =
        json['data'] != null ? DataResponseModel.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['status'] = status;
    data['copyright'] = copyright;
    data['attributionText'] = attributionText;
    data['attributionHTML'] = attributionHTML;
    data['etag'] = etag;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}
