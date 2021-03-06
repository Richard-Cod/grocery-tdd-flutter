import 'package:flutter/material.dart';
import 'package:grocery/StateManagement/CartSM.dart';
import 'package:grocery/models/cart_item.dart';
import 'package:grocery/viewmodels/cart_vm.dart';
import 'package:provider/src/provider.dart';

import '../../../constants.dart';
import '../../../models/cart.dart';
import '../../../size_config.dart';

class CartCard extends StatefulWidget {
  const CartCard({
    Key? key,
    required this.cartItem,
  }) : super(key: key);

  final CartItem cartItem;

  @override
  State<CartCard> createState() => _CartCardState(cartItem);
}

class _CartCardState extends State<CartCard> {
  final CartItem cartItem;

  _CartCardState(this.cartItem);

  @override
  Widget build(BuildContext context) {
    final sizeConfig = SizeConfig(context);

    return Row(
      children: [
        SizedBox(
          width: 88,
          child: AspectRatio(
            aspectRatio: 0.88,
            child: Container(
              padding:
                  EdgeInsets.all(sizeConfig.getProportionateScreenWidth(10)),
              decoration: BoxDecoration(
                color: Color(0xFFF5F6F9),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Image.network(widget.cartItem.product.image),
            ),
          ),
        ),
        SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.cartItem.product.title,
              style: TextStyle(color: Colors.black, fontSize: 16),
              maxLines: 2,
            ),
            SizedBox(height: 10),
            Text.rich(
              TextSpan(
                text: "\$${widget.cartItem.product.price}",
                style: TextStyle(
                    fontWeight: FontWeight.w600, color: kPrimaryColor),
                children: [
                  TextSpan(
                      text: " x${widget.cartItem.quantity}",
                      style: Theme.of(context).textTheme.bodyText1),
                ],
              ),
            ),
            Row(
              children: [
                ElevatedButton.icon(
                  onPressed: () => {
                    context.read<CartSM>().incrementProductQuantity(cartItem)
                  },
                  icon: Icon(Icons.plus_one),
                  label: Text(""),
                ),
                SizedBox(
                  width: 20,
                ),
                ElevatedButton.icon(
                  onPressed: () => {
                    context.read<CartSM>().decrementProductQuantity(cartItem)
                  },
                  icon: Icon(Icons.exposure_neg_1_outlined),
                  label: Text(""),
                ),
              ],
            )
          ],
        )
      ],
    );
  }
}
