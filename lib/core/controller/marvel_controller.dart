part of prueba_tecnica_bia.controller;

class MarvelController extends StateNotifier<MarvelState> {
  MarvelController({required this.api}) : super(MarvelState());
  final MarvelRepository api;

  Future<void> getAllCharacteres() async {
    try {
      var res = await api.getAllCharacters();
      state = state.copyWith(listOfCharacters: res.data?.results ?? []);
    } catch (error) {
      print('upps... something went wrong=> $error');
    }
  }
}

final marvelProvider =
    StateNotifierProvider<MarvelController, MarvelState>((ref) {
  var api = ref.read(apiProvider);
  return MarvelController(api: api);
});
