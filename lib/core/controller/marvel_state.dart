part of prueba_tecnica_bia.controller;

class MarvelState {
  MarvelState({
    this.listOfCharacters,
    this.characterDetails,
    this.id,
    this.limitToSearch = 15,
  });
  final List<ResultsResponseModel>? listOfCharacters;
  final ResultsResponseModel? characterDetails;
  final int? id;
  final int? limitToSearch;

  MarvelState copyWith({
    int? id,
    int? limitToSearch,
    List<ResultsResponseModel>? listOfCharacters,
    ResultsResponseModel? characterDetails,
  }) =>
      MarvelState(
        id: id ?? this.id,
        limitToSearch: limitToSearch ?? this.limitToSearch,
        listOfCharacters: listOfCharacters ?? this.listOfCharacters,
        characterDetails: characterDetails,
      );
}
