part of prueba_tecnica_bia.widgets;

class ComicCard extends StatelessWidget {
  const ComicCard({
    super.key,
    required this.comic,
    required this.onTap,
  });

  final ResultsResponseModel? comic;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        elevation: 10,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 150.h,
              width: 95.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              clipBehavior: Clip.antiAlias,
              child: Image(
                image: NetworkImage(
                    '${comic?.thumbnail?.path}.${comic?.thumbnail?.extension}'),
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return CustomLoading(
                    cumulativeBytesLoaded:
                        loadingProgress.cumulativeBytesLoaded,
                    expectedTotalBytes: loadingProgress.expectedTotalBytes,
                  );
                },
              ),
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
                    header: 'comics',
                    value: comic?.comics?.available.toString()),
                HeaderWithText(
                    header: 'series',
                    value: comic?.series?.available.toString()),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
