import 'package:flutter/material.dart';

import '../../../size_config.dart';
import 'categories.dart';
import 'discount_banner.dart';
import 'home_header.dart';
import 'popular_product.dart';
import 'special_offers.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final sizeConfig = SizeConfig(context);
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: sizeConfig.getProportionateScreenHeight(20)),
            HomeHeader(),
            SizedBox(height: sizeConfig.getProportionateScreenWidth(10)),
            DiscountBanner(),
            Categories(),
            SpecialOffers(),
            SizedBox(height: sizeConfig.getProportionateScreenWidth(30)),
            PopularProducts(),
            SizedBox(height: sizeConfig.getProportionateScreenWidth(30)),
          ],
        ),
      ),
    );
  }
}
