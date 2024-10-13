import 'package:flutter/material.dart';
import 'package:yum2go_v3_customer/util/styles.dart';

class BottomNavItem extends StatelessWidget {
  final String iconData;
  final Function? onTap;
  final bool isSelected;
  final String label;
  final Widget? icon;
  const BottomNavItem(
      {super.key,
      required this.iconData,
      this.onTap,
      this.isSelected = false,
      this.icon,
      required this.label});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap as void Function()?,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              padding: EdgeInsets.zero,
              iconSize: 20,
              visualDensity: VisualDensity.compact,
              icon: icon ??
                  Image.asset(
                    iconData,
                    color: isSelected ? Theme.of(context).primaryColor : null,
                    width: 20,
                    height: 20,
                    fit: BoxFit.fill,
                  ),
              onPressed: onTap as void Function()?,
              tooltip: label,
            ),
            Text(
              label,
              style: robotoRegular.copyWith(
                fontSize: 12,
                height: .09,
                color: isSelected ? Theme.of(context).primaryColor : null,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
