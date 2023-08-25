part of prueba_tecnica_bia.widgets;

class SearchBottomModal extends ConsumerStatefulWidget {
  const SearchBottomModal({required this.controller, Key? key})
      : super(key: key);
  final TextEditingController controller;
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SearchBottomModalState();
}

class _SearchBottomModalState extends ConsumerState<SearchBottomModal> {
  @override
  Widget build(BuildContext context) {
    final viewState = ref.read(marvelProvider.notifier);
    return GestureDetector(
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
                controller: widget.controller,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search),
                  labelText: 'Search...',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onChanged: (value) {
                  viewState.searchCharacter(value);
                },
                onSubmitted: (value) => Navigator.pop(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
