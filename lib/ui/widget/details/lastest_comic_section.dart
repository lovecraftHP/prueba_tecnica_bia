part of prueba_tecnica_bia.widgets;

class LatestComicSection extends ConsumerWidget {
  const LatestComicSection({
    this.items,
    this.title,
    this.colorItems,
    super.key,
  });

  final String? title;
  final List<String>? items;
  final Color? colorItems;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title ?? '',
            style: AppStyles.detailTitle2,
          ),
          const Divider(color: Colors.grey),
          Wrap(
            children: (items?.length ?? 0) > 5
                ? items
                        ?.sublist(0, 5)
                        .map((name) => Chip(
                              label: Text(
                                name,
                                style: const TextStyle(color: Colors.white),
                                overflow: TextOverflow.ellipsis,
                              ),
                              backgroundColor: colorItems,
                            ))
                        .toList() ??
                    []
                : items
                        ?.map((name) => Chip(
                              label: Text(
                                name,
                                style: const TextStyle(color: Colors.white),
                                overflow: TextOverflow.ellipsis,
                              ),
                              backgroundColor: colorItems,
                            ))
                        .toList() ??
                    [],
          )
        ],
      ),
    );
  }
}
