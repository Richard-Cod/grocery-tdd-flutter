import 'package:flutter/material.dart';
import 'package:grocery/screens/home/bail.dart';
import 'package:grocery/viewmodels/popular_products_vm.dart';
import '../../../components/product_card.dart';
import '../../../size_config.dart';
import 'section_title.dart';

class PopularProducts extends StatelessWidget {
  const PopularProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Future<dynamic> _calculation = PopularProductsVM().getData();

    Widget hasErrorWidget(snapshot) {
      return Column(
        children: [
          Icon(
            Icons.error_outline,
            color: Colors.red,
            size: 60,
          ),
          Padding(
            padding: EdgeInsets.only(top: 16),
            child: Text('Error: ${snapshot.error}'),
          )
        ],
      );
    }

    hasDataWidget(snapshot) {
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            ...List.generate(
              snapshot.data.length,
              (index) {
                return ProductCard(product: snapshot.data[index]);
              },
            ),
            SizedBox(
                width: SizeConfig(context).getProportionateScreenWidth(20)),
          ],
        ),
      );
    }

    final futureBuilder = FutureBuilderHelperClass.getFutureBuilderHelper(
      _calculation,
      hasDataWidget,
      hasErrorWidget,
    );

    final sizeConfig = SizeConfig(context);
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: sizeConfig.getProportionateScreenWidth(20)),
          child: SectionTitle(title: "Popular Products", press: () {}),
        ),
        SizedBox(
          height: sizeConfig.getProportionateScreenWidth(20),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: futureBuilder,
        ),
      ],
    );
  }
}
