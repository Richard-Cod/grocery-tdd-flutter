import 'package:flutter/material.dart';
import 'package:grocery/components/rounded_icon_btn.dart';
import 'package:grocery/demodatas/Product.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class ColorDots extends StatelessWidget {
  const ColorDots({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    final sizeConfig = SizeConfig(context);
    // Now this is fixed and only for demo
    int selectedColor = 3;
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: sizeConfig.getProportionateScreenWidth(20)),
      child: Row(
        children: [
          ...List.generate(
            product.colors.length,
            (index) => ColorDot(
              color: product.colors[index],
              isSelected: index == selectedColor,
            ),
          ),
          const Spacer(),
          RoundedIconBtn(
            icon: Icons.remove,
            press: () {},
          ),
          SizedBox(width: sizeConfig.getProportionateScreenWidth(20)),
          RoundedIconBtn(
            icon: Icons.add,
            showShadow: true,
            press: () {},
          ),
        ],
      ),
    );
  }
}

class ColorDot extends StatelessWidget {
  const ColorDot({
    Key? key,
    required this.color,
    this.isSelected = false,
  }) : super(key: key);

  final Color color;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    final sizeConfig = SizeConfig(context);

    return Container(
      margin: EdgeInsets.only(right: 2),
      padding: EdgeInsets.all(sizeConfig.getProportionateScreenWidth(8)),
      height: sizeConfig.getProportionateScreenWidth(40),
      width: sizeConfig.getProportionateScreenWidth(40),
      decoration: BoxDecoration(
        color: Colors.transparent,
        border:
            Border.all(color: isSelected ? kPrimaryColor : Colors.transparent),
        shape: BoxShape.circle,
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
