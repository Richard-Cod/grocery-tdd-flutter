import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grocery/StateManagement/CartSM.dart';
import 'package:provider/src/provider.dart';
import '../../../models/cart.dart';
import '../../../size_config.dart';
import '../../../viewmodels/cart_vm.dart';
import '../../home/bail.dart';
import 'cart_card.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final sizeConfig = SizeConfig(context);

    Widget hasErrorWidget(error) {
      return Column(
        children: [
          Icon(
            Icons.error_outline,
            color: Colors.red,
            size: 60,
          ),
          Padding(
            padding: EdgeInsets.only(top: 16),
            child: Text('Error: ${error}'),
          )
        ],
      );
    }

    hasDataWidget(data) {
      Cart cart = data;

      return SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            ...List.generate(
              cart.cartItems.length,
              (index) {
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Dismissible(
                    key: Key(cart.cartItems[index].product.id.toString()),
                    direction: DismissDirection.endToStart,
                    onDismissed: (direction) {
                      context
                          .read<CartSM>()
                          .removeProduct(cart.cartItems[index]);
                    },
                    background: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        color: Colors.greenAccent,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Row(
                        children: [
                          Spacer(),
                          SvgPicture.asset("assets/icons/Trash.svg"),
                        ],
                      ),
                    ),
                    child: CartCard(cartItem: cart.cartItems[index]),
                  ),
                );
              },
            ),
            SizedBox(
                width: SizeConfig(context).getProportionateScreenWidth(20)),
          ],
        ),
      );
    }

    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: sizeConfig.getProportionateScreenWidth(20)),
      child: FutureBuilderHelperClass.getWidgetFromStateHelper(
          context.watch<CartSM>().cartState, hasDataWidget, hasErrorWidget),
    );
  }
}
