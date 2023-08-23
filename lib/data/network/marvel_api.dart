part of prueba_tecnica_bia.data;

class MarvelApi implements MarvelRepository {
  MarvelApi({required this.dio});
  final Dio dio;
  final String? _baseUrl = dotenv.env['URLBASE'];
  final String? _apiKey = dotenv.env['APIKEY'];

  @override
  Future<void> filterCharacter(Map<String, dynamic> value) {
    // TODO: implement filterCharacter
    throw UnimplementedError();
  }

  @override
  Future<ResponseApiModel> getAllCharacters() async {
    late ResponseApiModel result;
    try {
      var response = await dio.get('$_baseUrl', queryParameters: {
        'apikey': '$_apiKey',
      });
      result = ResponseApiModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
    return result;
  }

  @override
  Future<void> searchCharacter(String value) {
    // TODO: implement searchCharacter
    throw UnimplementedError();
  }
}
