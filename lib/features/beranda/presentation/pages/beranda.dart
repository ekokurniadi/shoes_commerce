import 'package:flutter/material.dart';
import 'package:shamo/core/utility/theme_helper.dart';
import 'package:shamo/features/beranda/presentation/widgets/arrival_product_card.dart';
import 'package:shamo/features/beranda/presentation/widgets/categories.dart';
import 'package:shamo/features/beranda/presentation/widgets/popular_product.dart';
import 'package:shamo/features/beranda/presentation/widgets/title_section.dart';

class BerandaPage extends StatelessWidget {
  const BerandaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> productList = [
      {
        "image": "assets/image_shoes.png",
        "categories": "Hiking",
        "product_name": "COURT VISION 2.0",
        "product_price": "\$58,67"
      },
      {
        "image": "assets/image_shoes2.png",
        "categories": "Hiking",
        "product_name": "TEREX VISION 2.0",
        "product_price": "\$58,67"
      },
      {
        "image": "assets/image_shoes3.png",
        "categories": "Running",
        "product_name": "SL 200",
        "product_price": "\$58,67"
      },
    ];

    Widget header() {
      return Container(
        margin: EdgeInsets.only(
          top: 30,
          left: defaultMargin,
          right: defaultMargin,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Hallo, Alex",
                    style: primaryTextStyle.copyWith(
                      fontSize: 24,
                      fontWeight: semiBold,
                    ),
                  ),
                  Text(
                    "@alexkein",
                    style: subtitleTextStyle.copyWith(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: 54,
              height: 54,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: AssetImage("assets/image_profile.png"))),
            )
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor1,
      body: ListView(
        children: [
          header(),
          const Categories(),
          const TitleSection(title: "Popular Product"),
          PopularProductCard(productList: productList),
          const TitleSection(title: "New Arrivals"),
          ArrivalProductCard(list: productList),
        ],
      ),
    );
  }
}
