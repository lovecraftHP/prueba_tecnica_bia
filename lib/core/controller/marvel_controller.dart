part of prueba_tecnica_bia.controller;

class MarvelController extends StateNotifier<MarvelState> {
  MarvelController({required this.api}) : super(MarvelState());
  final MarvelRepository api;

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

  Future<void> _fetchCharacteres(int? limit) async {
    var res = await await api.getAllCharacters(nextValues: state.limitToSearch);
    state = state.copyWith(listOfCharacters: res.data?.results ?? []);
  }
}

final marvelProvider =
    StateNotifierProvider<MarvelController, MarvelState>((ref) {
  var api = ref.read(apiProvider);
  return MarvelController(api: api);
});
