import 'package:flutter/material.dart';

class MyPageButton extends StatelessWidget {
  final String label;
  final void Function()? onTap;
  const MyPageButton({super.key, required this.label, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(8.0),
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
            color: const Color(0xFFf3f3f3),
            borderRadius: BorderRadius.circular(8.0)),
        child: Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
