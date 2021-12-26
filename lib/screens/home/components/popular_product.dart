import 'package:flutter/material.dart';
import 'package:grocery/screens/home/bail.dart';
import 'package:grocery/utils/StateHelper.dart';
import 'package:grocery/viewmodels/popular_products_vm.dart';
import 'package:provider/src/provider.dart';
import '../../../StateManagement/HomeSM.dart';
import '../../../components/product_card.dart';
import '../../../size_config.dart';
import 'section_title.dart';

class PopularProducts extends StatelessWidget {
  const PopularProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget hasErrorWidget(Error error) {
      return Column(
        children: [
          Icon(
            Icons.error_outline,
            color: Colors.red,
            size: 60,
          ),
          Padding(
            padding: EdgeInsets.only(top: 16),
            child: Text('Error: ${error.toString()}'),
          )
        ],
      );
    }

    hasDataWidget(data) {
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            ...List.generate(
              data.length,
              (index) {
                return ProductCard(product: data[index]);
              },
            ),
            SizedBox(
                width: SizeConfig(context).getProportionateScreenWidth(20)),
          ],
        ),
      );
    }

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
          child: FutureBuilderHelperClass.getWidgetFromStateHelper(
              context.watch<HomeSM>().popularProductsSH,
              hasDataWidget,
              hasErrorWidget),
        ),
      ],
    );
  }
}
