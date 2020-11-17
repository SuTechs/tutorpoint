import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

void kShowOptions(BuildContext context, Widget child) {
  showMaterialModalBottomSheet(
    backgroundColor: const Color(0x00000000),
    context: context,
    builder: (context) => Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            )),
        child: child),
  );
}

class BottomSheetOptionTile extends StatelessWidget {
  final Color color;
  final String title;
  final IconData icon;
  final void Function() onTap;

  const BottomSheetOptionTile(
      {this.color = const Color(0xff4a4a4a),
      this.title,
      this.icon,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ListTile(
        leading: Icon(
          icon,
          color: color,
          size: 30,
        ),
        title: Text(
          title,
          style: TextStyle(
            color: color,
            fontSize: 17,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
