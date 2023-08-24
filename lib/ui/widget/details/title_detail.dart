part of prueba_tecnica_bia.widgets;

class TitleDetail extends StatelessWidget {
  const TitleDetail({
    super.key,
    required this.name,
    this.style,
  });

  final String? name;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: Center(
        child: Text(
          name ?? '',
          style: style ?? AppStyles.detailTitle1,
        ),
      ),
    );
  }
}
