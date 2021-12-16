import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
    final CartVM cartVM = CartVM();

    return Padding(
        padding: EdgeInsets.symmetric(
            horizontal: sizeConfig.getProportionateScreenWidth(20)),
        child: getCartFutureBuilder(cartVM));
  }

  FutureBuilder getCartFutureBuilder(CartVM cartVM) {
    final Future<Cart> _calculation = cartVM.getCart();

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
      Cart cart = snapshot.data;

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
                      setState(() {
                        cartVM.removeItem(cart.cartItems[index]);
                      });
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
                    child: CartCard(
                      cartItem: cart.cartItems[index],
                      cartVM: cartVM,
                    ),
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

    final cartItemsFutureBuilder =
        FutureBuilderHelperClass.getFutureBuilderHelper(
      _calculation,
      hasDataWidget,
      hasErrorWidget,
    );

    return cartItemsFutureBuilder;
  }
}
