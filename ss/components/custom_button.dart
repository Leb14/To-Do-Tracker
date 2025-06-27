import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final double elevation;
  final VoidCallback onPressed;
  final IconData? icon;
  final Color backgroundColor;

  const CustomButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.elevation = 0.5,
    this.icon,
    this.backgroundColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          elevation: WidgetStateProperty.all(elevation),
          backgroundColor: WidgetStateProperty.all(backgroundColor),
          padding: WidgetStateProperty.all(
            EdgeInsets.symmetric(horizontal: 40, vertical: 10),
          ),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: BorderSide(
                color: Colors.pink.shade50,
                width: 0.5
              )
            )
          )
        ),
        child:
            icon == null
                ? Text(label, style: TextStyle(fontSize: 18))
                : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(icon, size: 18),
                    SizedBox(width: 15),
                    Text(label, style: TextStyle(fontSize: 12)),
                  ],
                ),
      ),
    );
  }
}
