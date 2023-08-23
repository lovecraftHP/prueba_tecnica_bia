part of prueba_tecnica_bia.widgets;

class HeaderWithText extends StatelessWidget {
  const HeaderWithText({
    super.key,
    this.header,
    this.value,
  });

  final String? header;
  final String? value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Row(
        children: [
          Text('${header?.toCapitalize()}: ', style: AppStyles.subTitle1),
          Text(value ?? '', style: AppStyles.subTitle2),
        ],
      ),
    );
  }
}
