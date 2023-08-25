part of prueba_tecnica_bia.controller;

class MarvelController extends StateNotifier<MarvelState> {
  MarvelController({required this.api}) : super(MarvelState());
  final MarvelRepository api;

  Future<void> getCharacterDetail(String id) async {
    try {
      var res = await api.getDetailCharacter(id);
      state = state.copyWith(characterDetails: res);
    } catch (error) {
      print('upps... something went wrong=> $error');
    }
  }

  Future<void> getAllCharacteres({bool? reachTheBottom = false}) async {
    try {
      if (reachTheBottom ?? false) {
        state = state.copyWith(limitToSearch: state.limitToSearch! + 10);
        await _fetchCharacteres(state.limitToSearch);
      } else {
        await _fetchCharacteres(15);
      }
    } catch (error) {
      print('upps... something went wrong=> $error');
    }
  }

  void searchCharacter(String valueToSearch) async {
    if (valueToSearch.isEmpty) {
      await _fetchCharacteres(state.limitToSearch);
    } else {
      var res =
          api.searchCharacter(valueToSearch, (state.listOfCharacters ?? []));
      state = state.copyWith(listOfCharacters: res);
    }
  }

  Future<void> _fetchCharacteres(int? limit) async {
    var res = await api.getAllCharacters(nextValues: state.limitToSearch);
    state = state.copyWith(listOfCharacters: res.data?.results ?? []);
  }

  void cleanDetailState() {
    state = state.copyWith(characterDetails: null);
  }
}

final marvelProvider =
    StateNotifierProvider<MarvelController, MarvelState>((ref) {
  var api = ref.read(apiProvider);
  return MarvelController(api: api);
});
