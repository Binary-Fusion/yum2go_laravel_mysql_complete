import 'package:flutter/material.dart';
import 'package:yum2go_v3_customer/helper/responsive_helper.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';

Future showWoltModalSheet(BuildContext context,
    SliverWoltModalSheetPage Function(BuildContext) builder) {
  return WoltModalSheet.show<void>(
    context: context,
    pageListBuilder: (modalSheetContext) {
      return [
        builder(modalSheetContext),
      ];
    },
    modalTypeBuilder: (context) {
      if (ResponsiveHelper.isMobile(context)) {
        return WoltModalType.bottomSheet;
      } else {
        return WoltModalType.dialog;
      }
    },
    onModalDismissedWithBarrierTap: () {
      debugPrint('Closed modal sheet with barrier tap');
      Navigator.of(context).pop();
    },
    maxDialogWidth: 560,
    minDialogWidth: 400,
    minPageHeight: 0.0,
    maxPageHeight: 0.9,
  );
}
