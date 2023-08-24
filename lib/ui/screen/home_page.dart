part of prueba_tecnica_bia.screen;

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  var _controller = TextEditingController();
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    ref.read(marvelProvider.notifier).getAllCharacteres();
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      if (_scrollController.position.atEdge &&
          _scrollController.position.pixels != 0) {
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
                builder: (context) => GestureDetector(
                      onTap: () => FocusScope.of(context).unfocus(),
                      child: Padding(
                        padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom,
                        ),
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 20.h),
                          height: 120.h,
                          child: Column(
                            children: [
                              Text(
                                'Search something in the actual list',
                                style: AppStyles.title1,
                              ),
                              SizedBox(height: 20.h),
                              TextField(
                                controller: _controller,
                                decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.search),
                                  labelText: 'Search...',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
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
