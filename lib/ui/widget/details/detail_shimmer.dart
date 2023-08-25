part of prueba_tecnica_bia.widgets;

class DetailShimmer extends StatefulWidget {
  const DetailShimmer({super.key});

  @override
  State<DetailShimmer> createState() => _DetailShimmerState();
}

class _DetailShimmerState extends State<DetailShimmer> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FadeShimmer(
          height: 320.h,
          width: 500.w,
          highlightColor: Colors.grey.shade500,
          baseColor: Colors.grey.shade300,
        ),
        SizedBox(height: 10.h),
        FadeShimmer(
          height: 70.h,
          width: 300.w,
          highlightColor: Colors.grey.shade500,
          baseColor: Colors.grey.shade300,
          radius: 10,
        ),
        SizedBox(height: 10.h),
        FadeShimmer(
          height: 150.h,
          width: 370.w,
          highlightColor: Colors.grey.shade500,
          baseColor: Colors.grey.shade300,
          radius: 10,
        ),
        SizedBox(height: 10.h),
        FadeShimmer(
          height: 70.h,
          width: 370.w,
          highlightColor: Colors.grey.shade500,
          baseColor: Colors.grey.shade300,
          radius: 10,
        ),
        SizedBox(height: 10.h),
        FadeShimmer(
          height: 170.h,
          width: 380.w,
          highlightColor: Colors.grey.shade500,
          baseColor: Colors.grey.shade300,
          radius: 10,
        ),
      ],
    );
  }
}
