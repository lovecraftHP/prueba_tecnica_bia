part of prueba_tecnica_bia.controller;

class MarvelState {
  MarvelState({
    this.listOfCharacters,
    this.characterDetails,
    this.id,
  });
  final List<ResultsResponseModel>? listOfCharacters;
  final ResultsResponseModel? characterDetails;
  final int? id;

  MarvelState copyWith({
    int? id,
    List<ResultsResponseModel>? listOfCharacters,
    ResultsResponseModel? characterDetails,
  }) =>
      MarvelState(
        id: id ?? this.id,
        listOfCharacters: listOfCharacters ?? this.listOfCharacters,
        characterDetails: characterDetails,
      );
}
