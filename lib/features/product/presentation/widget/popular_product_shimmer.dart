part of '../../product.dart';

class PopularProductShimmer extends StatelessWidget {
  const PopularProductShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 14),
      height: 278,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: [1, 2, 3, 4, 5].length,
          itemBuilder: (context, index) {
            return Container(
              width: 215,
              height: 278,
              margin: EdgeInsets.only(
                  right: defaultMargin, left: index == 0 ? defaultMargin : 0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color(0xffECEDEF),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: defaultMargin,
                  ),
                  Shimmer.fromColors(
                    baseColor: secondaryTextColor,
                    highlightColor: Colors.grey[300]!,
                    period: const Duration(seconds: 2),
                    child: Container(
                      width: 215,
                      height: 150,
                      decoration: BoxDecoration(
                          color: Colors.grey[400]!,
                          borderRadius: BorderRadius.circular(12)),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Shimmer.fromColors(
                          baseColor: secondaryTextColor,
                          highlightColor: Colors.grey[300]!,
                          period: const Duration(seconds: 2),
                          child: Container(
                            width: 37,
                            height: 15,
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
                            width: 162,
                            height: 24,
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
                            width: 47,
                            height: 19,
                            decoration: BoxDecoration(
                                color: Colors.grey[400]!,
                                borderRadius: BorderRadius.circular(12)),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            );
          }),
    );
  }
}
