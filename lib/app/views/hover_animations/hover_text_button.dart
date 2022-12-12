import 'package:flutter/material.dart';

class HoverTextButton extends StatefulWidget {
  final Widget child;
  const HoverTextButton({super.key, required this.child});

  @override
  State<HoverTextButton> createState() => _HoverTextButtonState();
}

class _HoverTextButtonState extends State<HoverTextButton> {
  bool isHovered = false;

  final hoveredTransform = Matrix4.identity()..scale(1.05);
  @override
  Widget build(BuildContext context) {
    final transform = isHovered ? hoveredTransform : Matrix4.identity();
    return MouseRegion(
      onEnter: (event) => onEntered(true),
      onExit: (event) => onEntered(false),
      child: AnimatedContainer(
          duration: Duration(milliseconds: 200),
          transform: transform,
          child: widget.child),
    );
  }

  void onEntered(bool hovered) => setState(() => this.isHovered = hovered);
}
