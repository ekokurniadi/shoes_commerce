part of '../../category.dart';

class CategoryShimmer extends StatelessWidget {
  const CategoryShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<int> myShimmerList = [1, 2, 3, 4, 5];
    return Container(
      margin: EdgeInsets.only(top: defaultMargin),
      child: SizedBox(
        height: 40,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: myShimmerList.length,
          itemBuilder: (context, index) {
            return CategoryItemShimmer(
              index: index,
              itemsLength: myShimmerList.length,
            );
          },
        ),
      ),
    );
  }
}
