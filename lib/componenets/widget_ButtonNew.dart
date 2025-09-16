import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Color textcolor;
  final Color bgcolor;
  final VoidCallback onPressed;
  final bool cancustomwidth;
  final int customwidth;

  //props and also their default values except for onpressed because that cant be null
  const CustomButton({
    super.key,
    required this.onPressed,
    this.text = "you didnt fill the 'text' property bruh",
    this.textcolor = Colors.black,
    this.bgcolor = Colors.white,
    this.cancustomwidth = false,
    this.customwidth = 200,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: bgcolor,
        padding: const EdgeInsets.symmetric(vertical: 14),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        elevation: 3,
        minimumSize: cancustomwidth
            ? Size(customwidth.toDouble(), 50)
            : Size.fromHeight(50),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
          color: textcolor,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}