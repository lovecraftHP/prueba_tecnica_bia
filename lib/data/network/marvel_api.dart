part of prueba_tecnica_bia.data;

class MarvelApi with UtilitiesHelper implements MarvelRepository {
  MarvelApi({required this.dio});
  final Dio dio;
  final String? _baseUrl = dotenv.env['URLBASE'];
  final String? _apiKey = dotenv.env['APIKEY'];
  final String? _secret = dotenv.env['SECRET'];

  @override
  Future<void> filterCharacter(Map<String, dynamic> value) {
    // TODO: implement filterCharacter
    throw UnimplementedError();
  }

  @override
  Future<ResponseApiModel> getAllCharacters({int? nextValues = 15}) async {
    late ResponseApiModel result;
    try {
      var ts = DateTime.timestamp();
      var hash = createHashparam('$ts$_secret$_apiKey');
      var response = await dio.get('$_baseUrl', queryParameters: {
        'ts': ts,
        'apikey': '$_apiKey',
        'hash': hash,
        'limit': nextValues,
      });
      result = ResponseApiModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
    return result;
  }

  @override
  Future<ResultsResponseModel?> getDetailCharacter(String id) async {
    late ResultsResponseModel? result;
    try {
      var ts = DateTime.timestamp();
      var hash = createHashparam('$ts$_secret$_apiKey');
      var response = await dio.get('$_baseUrl/$id', queryParameters: {
        'ts': ts,
        'apikey': '$_apiKey',
        'hash': hash,
      });
      result = ResponseApiModel.fromJson(response.data).data?.results?.first;
    } catch (e) {
      rethrow;
    }
    return result;
  }

  @override
  List<ResultsResponseModel> searchCharacter(
      String value, List<ResultsResponseModel> originalList) {
    if (value.isNotEmpty) {
      return originalList
          .where((comic) =>
              (comic.name?.toLowerCase().contains(value.toLowerCase()) ??
                  false))
          .toList();
    } else {
      return originalList;
    }
  }
}
