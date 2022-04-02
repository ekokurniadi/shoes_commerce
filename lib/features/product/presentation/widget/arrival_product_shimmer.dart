part of '../../product.dart';

class ArrivalProductShimmer extends StatelessWidget {
  const ArrivalProductShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          left: defaultMargin, right: defaultMargin, bottom: defaultMargin),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Shimmer.fromColors(
              baseColor: secondaryTextColor,
              highlightColor: Colors.grey[300]!,
              period: const Duration(seconds: 2),
              child: Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                    color: Colors.grey[400]!,
                    borderRadius: BorderRadius.circular(12)),
              ),
            ),
          ),
          const SizedBox(
            width: 12,
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Shimmer.fromColors(
                baseColor: secondaryTextColor,
                highlightColor: Colors.grey[300]!,
                period: const Duration(seconds: 2),
                child: Container(
                  width: 59,
                  height: 16,
                  decoration: BoxDecoration(
                      color: Colors.grey[400]!,
                      borderRadius: BorderRadius.circular(12)),
                ),
              ),
              const SizedBox(
                height: 6,
              ),
              Shimmer.fromColors(
                baseColor: secondaryTextColor,
                highlightColor: Colors.grey[300]!,
                period: const Duration(seconds: 2),
                child: Container(
                  width: 163,
                  height: 22,
                  decoration: BoxDecoration(
                      color: Colors.grey[400]!,
                      borderRadius: BorderRadius.circular(12)),
                ),
              ),
              const SizedBox(
                height: 6,
              ),
              Shimmer.fromColors(
                baseColor: secondaryTextColor,
                highlightColor: Colors.grey[300]!,
                period: const Duration(seconds: 2),
                child: Container(
                  width: 49,
                  height: 19,
                  decoration: BoxDecoration(
                      color: Colors.grey[400]!,
                      borderRadius: BorderRadius.circular(12)),
                ),
              ),
            ],
          ))
        ],
      ),
    );
  }
}
