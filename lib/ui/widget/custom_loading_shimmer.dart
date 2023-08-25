part of prueba_tecnica_bia.widgets;

class CustomLoadingShimmer extends StatelessWidget {
  const CustomLoadingShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
      physics: const NeverScrollableScrollPhysics(),
      children: List.generate(
        5,
        (index) => Padding(
          padding: EdgeInsets.symmetric(vertical: 10.h),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(width: 10.w),
              FadeShimmer(
                height: 150.h,
                width: 95.w,
                highlightColor: Colors.grey.shade500,
                baseColor: Colors.grey.shade300,
                radius: 10,
              ),
              SizedBox(width: 20.w),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FadeShimmer(
                    height: 20.h,
                    width: 300.w,
                    highlightColor: Colors.grey.shade500,
                    baseColor: Colors.grey.shade300,
                    radius: 10,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.h),
                    child: FadeShimmer(
                      height: 20.h,
                      width: 300.w,
                      highlightColor: Colors.grey.shade500,
                      baseColor: Colors.grey.shade300,
                      radius: 10,
                    ),
                  ),
                  FadeShimmer(
                    height: 20.h,
                    width: 300.w,
                    highlightColor: Colors.grey.shade500,
                    baseColor: Colors.grey.shade300,
                    radius: 10,
                  ),
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
