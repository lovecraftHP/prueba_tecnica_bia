part of prueba_tecnica_bia.controller;

class MarvelState {
  MarvelState({
    this.listOfCharacters,
    this.filtredList,
    this.characterDetails,
    this.id,
    this.limitToSearch = 15,
  });
  final List<ResultsResponseModel>? listOfCharacters;
  final List<ResultsResponseModel>? filtredList;
  final ResultsResponseModel? characterDetails;
  final int? id;
  final int? limitToSearch;

  MarvelState copyWith({
    int? id,
    int? limitToSearch,
    List<ResultsResponseModel>? listOfCharacters,
    List<ResultsResponseModel>? filtredList,
    ResultsResponseModel? characterDetails,
  }) =>
      MarvelState(
        id: id ?? this.id,
        limitToSearch: limitToSearch ?? this.limitToSearch,
        listOfCharacters: listOfCharacters ?? this.listOfCharacters,
        filtredList: filtredList,
        characterDetails: characterDetails,
      );
}
