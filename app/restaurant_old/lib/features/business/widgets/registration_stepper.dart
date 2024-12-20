import 'package:stackfood_multivendor_restaurant/util/dimensions.dart';
import 'package:stackfood_multivendor_restaurant/util/styles.dart';
import 'package:flutter/material.dart';

class RegistrationStepper extends StatelessWidget {
  final bool isActive;
  final bool haveLeftBar;
  final bool haveRightBar;
  final String title;
  final bool rightActive;
  final bool onGoing;
  final bool processing;
  final Color? fieldColor;
  const RegistrationStepper({super.key, required this.isActive, required this.haveLeftBar, required this.haveRightBar,
    required this.title, required this.rightActive, this.onGoing = false, this.processing = false, this.fieldColor});

  @override
  Widget build(BuildContext context) {

    Color color = onGoing ? fieldColor ?? Theme.of(context).primaryColor : isActive ? fieldColor ?? Theme.of(context).primaryColor : Theme.of(context).disabledColor;
    Color right = onGoing ? Theme.of(context).disabledColor : rightActive ? fieldColor ?? Theme.of(context).primaryColor : Theme.of(context).disabledColor;

    return Expanded(
      child: Column(children: [

        Row(children: [

          Expanded(child: haveLeftBar ? Divider(color: color, thickness: 2) : const SizedBox()),

          Icon( onGoing ? Icons.adjust : processing ? Icons.adjust : rightActive ? Icons.check_circle : Icons.circle_outlined, color: color, size: 40),

          Expanded(child: haveRightBar ? Divider(color: right, thickness: 2) : const SizedBox()),

          ]),
          const SizedBox(height: Dimensions.paddingSizeExtraSmall),

          SizedBox(
            height: 30,
            child: Text(
              title, maxLines: 2, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center,
              style: robotoMedium.copyWith(color: fieldColor ?? Theme.of(context).primaryColor, fontSize: Dimensions.fontSizeExtraSmall),
            ),
          ),
      ]),
    );
  }
}