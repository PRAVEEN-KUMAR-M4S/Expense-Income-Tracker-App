

import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback ontap;
  final Widget widget;
  const CustomButton({super.key, required this.ontap, required this.widget});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: ontap,
        child: Container(
          width: double.infinity,
          height: 50,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  blurRadius: 10,
                  color: Theme.of(context).colorScheme.outline,
                  offset: const Offset(2, 2)),
            ],
            borderRadius: BorderRadius.circular(15),
            gradient: LinearGradient(colors: [
              Theme.of(context).colorScheme.primary,
              Theme.of(context).colorScheme.secondary,
              Theme.of(context).colorScheme.tertiary
            ], transform: const GradientRotation(3.14 / 4)),
          ),
          child:  Center(
           child: widget,
          ),
        ));
  }
}
