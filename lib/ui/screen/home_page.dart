part of prueba_tecnica_bia.screen;

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    ref.read(marvelProvider.notifier).getAllCharacteres();
  }

  @override
  Widget build(BuildContext context) {
    var state = ref.watch(marvelProvider);
    var viewState = ref.read(marvelProvider.notifier);
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Marvel hero apps'),
        actions: [
          IconButton(
              onPressed: () {
                _scaffoldKey.currentState?.openEndDrawer();
              },
              icon: const Icon(Icons.filter_list))
        ],
      ),
      endDrawer: const Drawer(),
      body: Container(
        child: state.listOfCharacters == null
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : (state.listOfCharacters?.isNotEmpty ?? false)
                ? ListView.builder(
                    itemCount: state.listOfCharacters?.length,
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
                    itemBuilder: (context, index) => OpenContainer(
                      closedElevation: 0,
                      closedBuilder: (context, action) =>
                          ComicCard(comic: state.listOfCharacters?[index]),
                      openBuilder: (context, action) => Container(),
                    ),
                  )
                : const Center(
                    child: Text('Upps parece que ocurrio algo, no hay datos')),
      ),
    );
  }
}
