part of prueba_tecnica_bia.data;

abstract class MarvelRepository {
  Future<ResponseApiModel> getAllCharacters({int? nextValues});
  Future<ResultsResponseModel?> getDetailCharacter(String id);
  List<ResultsResponseModel> searchCharacter(
      String value, List<ResultsResponseModel> originalList);
  Future<void> filterCharacter(Map<String, dynamic> value);
}
