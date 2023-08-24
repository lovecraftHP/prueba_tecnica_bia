part of prueba_tecnica_bia.widgets;

class CustomLoading extends StatefulWidget {
  const CustomLoading({
    required this.cumulativeBytesLoaded,
    required this.expectedTotalBytes,
    super.key,
  });
  final int? expectedTotalBytes;
  final int cumulativeBytesLoaded;

  @override
  State<CustomLoading> createState() => _CustomLoadingState();
}

class _CustomLoadingState extends State<CustomLoading> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: Colors.blue,
        value: widget.expectedTotalBytes != null
            ? widget.cumulativeBytesLoaded / widget.expectedTotalBytes!
            : null,
      ),
    );
  }
}
