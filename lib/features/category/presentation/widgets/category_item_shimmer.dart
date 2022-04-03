part of '../../category.dart';

class CategoryItemShimmer extends StatelessWidget {
  final int itemsLength;
  final int index;
  const CategoryItemShimmer({
    Key? key,
    required this.itemsLength,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: secondaryTextColor,
      highlightColor: Colors.grey[300]!,
      period: const Duration(seconds: 2),
      child: Container(
        margin: index == itemsLength - 1
            ? EdgeInsets.only(right: defaultMargin)
            : index == 0
                ? EdgeInsets.only(left: defaultMargin, right: 16)
                : const EdgeInsets.only(right: 16),
        width: 76,
        height: 40,
        decoration: BoxDecoration(
          color: Colors.grey[400]!,
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
