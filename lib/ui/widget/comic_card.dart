part of prueba_tecnica_bia.widgets;

class ComicCard extends StatelessWidget {
  const ComicCard({
    super.key,
    required this.comic,
  });

  final ResultsResponseModel? comic;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 10,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 150.h,
            width: 95.w,
            decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: NetworkImage(
                    '${comic?.thumbnail?.path}.${comic?.thumbnail?.extension}',
                  ),
                  fit: BoxFit.cover,
                )),
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(10.h),
                child: Text('${comic?.name}', style: AppStyles.title1),
              ),
              HeaderWithText(
                  header: 'last updated',
                  value: comic?.modified?.toFormatDate()),
              HeaderWithText(
                  header: 'comics', value: comic?.comics?.available.toString()),
              HeaderWithText(
                  header: 'series', value: comic?.series?.available.toString()),
            ],
          ))
        ],
      ),
    );
  }
}
