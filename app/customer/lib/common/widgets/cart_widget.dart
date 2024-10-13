import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yum2go_v3_customer/features/cart/controllers/cart_controller.dart';
import 'package:yum2go_v3_customer/gen/assets.gen.dart';
import 'package:yum2go_v3_customer/util/styles.dart';

class CartWidget extends StatelessWidget {
  final Color? color;
  final double size;
  final bool fromRestaurant;
  final bool inBottomBar;
  const CartWidget(
      {super.key,
      required this.color,
      required this.size,
      this.inBottomBar = false,
      this.fromRestaurant = false});

  @override
  Widget build(BuildContext context) {
    return Stack(clipBehavior: Clip.none, children: [
      Image.asset(
        inBottomBar
            ? Assets.icons.shoppingCart2.path
            : Assets.icons.shoppingCart.path,
        width: size,
        height: size,
        color: color,
      ),
      GetBuilder<CartController>(builder: (cartController) {
        return cartController.cartList.isNotEmpty
            ? Positioned(
                top: -5,
                right: -5,
                child: Container(
                  height: size < 20 ? 10 : size / 2,
                  width: size < 20 ? 10 : size / 2,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: fromRestaurant
                        ? Theme.of(context).cardColor
                        : Theme.of(context).primaryColor,
                    border: Border.all(
                        width: size < 20 ? 0.7 : 1,
                        color: fromRestaurant
                            ? Theme.of(context).primaryColor
                            : Theme.of(context).cardColor),
                  ),
                  child: Text(
                    cartController.cartList.length.toString(),
                    style: robotoRegular.copyWith(
                      fontSize: size < 20 ? size / 3 : size / 3.8,
                      color: fromRestaurant
                          ? Theme.of(context).primaryColor
                          : Theme.of(context).cardColor,
                    ),
                  ),
                ),
              )
            : const SizedBox();
      }),
    ]);
  }
}
