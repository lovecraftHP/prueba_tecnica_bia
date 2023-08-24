part of prueba_tecnica_bia.screen;

class DetailPage extends ConsumerStatefulWidget {
  const DetailPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DetailPageState();
}

class _DetailPageState extends ConsumerState<DetailPage> {
  @override
  Widget build(BuildContext context) {
    var selectedComic = ref.watch(marvelProvider).characterDetails;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 250.h,
            leading: IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: const CircleAvatar(
                  child: Center(child: Icon(Icons.arrow_back)),
                )),
            flexibleSpace: Container(
              height: 320.h,
              decoration: BoxDecoration(
                color: Colors.blue,
                image: DecorationImage(
                    image: NetworkImage(
                        '${selectedComic?.thumbnail?.path}.${selectedComic?.thumbnail?.extension}'),
                    fit: BoxFit.fill,
                    colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(.4), BlendMode.colorBurn)),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(top: 10.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                mainAxisSize: MainAxisSize.max,
                children: [
                  HeaderWithText(
                    header: 'comics',
                    value: selectedComic?.comics?.available.toString(),
                  ),
                  HeaderWithText(
                    header: 'stories',
                    value: selectedComic?.stories?.available.toString(),
                  ),
                  HeaderWithText(
                    header: 'series',
                    value: selectedComic?.series?.available.toString(),
                  ),
                  HeaderWithText(
                    header: 'events',
                    value: selectedComic?.events?.available.toString(),
                  ),
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              const Divider(color: Colors.grey),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
                child: Text(
                  (selectedComic?.description?.isNotEmpty ?? false)
                      ? selectedComic!.description!
                      : defaultDescription,
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              const Divider(color: Colors.grey),
            ]),
          )
        ],
      ),
    );
  }
}
