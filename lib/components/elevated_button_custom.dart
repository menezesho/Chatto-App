import 'package:flutter/material.dart';

class ElevatedButtonCustom extends StatelessWidget {
  final void Function() onPressed;
  final String text;
  final Color? backgroundColor;

  const ElevatedButtonCustom({
    super.key,
    required this.onPressed,
    required this.text,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor ?? Theme.of(context).primaryColor,
        minimumSize: const Size(double.infinity, 56),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Text(
        text,
        style: Theme.of(context).textTheme.labelMedium!.copyWith(
              color: Theme.of(context).colorScheme.surfaceTint,
            ),
      ),
    );
  }
}
