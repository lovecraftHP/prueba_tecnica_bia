part of prueba_tecnica_bia.data;

abstract class MarvelRepository {
  Future<ResponseApiModel> getAllCharacters();
  Future<void> searchCharacter(String value);
  Future<void> filterCharacter(Map<String, dynamic> value);
}
