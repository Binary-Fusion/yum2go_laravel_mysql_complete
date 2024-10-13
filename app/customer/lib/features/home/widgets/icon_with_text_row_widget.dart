import 'package:flutter/material.dart';
import 'package:yum2go_v3_customer/util/dimensions.dart';

class IconWithTextRowWidget extends StatelessWidget {
  const IconWithTextRowWidget({
    super.key,
    required this.icon,
    required this.text,
    required this.style,
    this.color,
    this.isMobile = false,
  });

  final IconData icon;
  final String text;
  final TextStyle style;
  final Color? color;
  final bool isMobile;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          isMobile ? MainAxisAlignment.start : MainAxisAlignment.spaceBetween,
      children: [
        if (!isMobile)
          Icon(icon, color: color ?? Theme.of(context).primaryColor, size: 20),
        if (!isMobile) const SizedBox(width: Dimensions.paddingSizeExtraSmall),
        Text(text, style: style),
        if (isMobile) const SizedBox(width: 2),
        if (isMobile)
          Icon(icon,
              color: color ?? Theme.of(context).primaryColor,
              size: isMobile ? 14 : 20),
      ],
    );
  }
}

class ImageWithTextRowWidget extends StatelessWidget {
  const ImageWithTextRowWidget({
    super.key,
    required this.widget,
    required this.text,
    required this.style,
  });

  final Widget widget;
  final String text;
  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        widget,
        const SizedBox(width: Dimensions.paddingSizeExtraSmall),
        Text(text, style: style),
      ],
    );
  }
}
