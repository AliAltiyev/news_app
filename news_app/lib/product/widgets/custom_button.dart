// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:news_app/product/utils/constants/colors.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback _onPressed;
  final Widget _child;
  final Color? _backgroundColor;

  const CustomButton({
    super.key,
    required VoidCallback onPressed,
    required Widget child,
    Color? backgroundColor,
  })  : _onPressed = onPressed,
        _child = child,
        _backgroundColor = backgroundColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: _onPressed,
      style: ButtonStyle(
          backgroundColor: _backgroundColor == null
              ? MaterialStatePropertyAll(AppColors.white)
              : MaterialStatePropertyAll(_backgroundColor)),
      child: _child,
    );
  }
}
