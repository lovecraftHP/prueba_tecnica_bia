part of prueba_tecnica_bia.screen;

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  final _controller = TextEditingController();
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    ref.read(marvelProvider.notifier).getAllCharacteres();
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      if (_scrollController.position.atEdge &&
          _scrollController.position.pixels != 0) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Center(child: Text('Loading characteres...')),
            duration: Duration(seconds: 2),
            backgroundColor: Colors.blue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
          ),
        );
        ref
            .read(marvelProvider.notifier)
            .getAllCharacteres(reachTheBottom: true);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var state = ref.watch(marvelProvider);
    var viewState = ref.read(marvelProvider.notifier);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Marvel hero apps'),
      ),
      body: Container(
        child: state.listOfCharacters == null
            ? const CustomLoadingShimmer()
            : (state.listOfCharacters?.isNotEmpty ?? false)
                ? ListView.builder(
                    itemCount: state.listOfCharacters?.length,
                    controller: _scrollController,
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
                    itemBuilder: (context, index) => OpenContainer(
                      closedElevation: 0,
                      closedBuilder: (context, action) => ComicCard(
                        comic: state.listOfCharacters?[index],
                        onTap: () {
                          action();
                          viewState.getCharacterDetail(
                              state.listOfCharacters?[index].id.toString() ??
                                  '');
                        },
                      ),
                      openBuilder: (context, action) => const DetailPage(),
                    ),
                  )
                : const Center(
                    child: Text('Upps parece que ocurrio algo, no hay datos')),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
                context: context,
                builder: (context) =>
                    SearchBottomModal(controller: _controller),
                showDragHandle: true,
                isScrollControlled: true,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))));
          },
          child: const Icon(Icons.search)),
    );
  }
}
