
import 'package:BTechAppLatihan/core/utils/color_pallete.dart';
import 'package:flutter/material.dart';

class BgaButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;

  BgaButton({
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 348,
      height: 50,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          text, style: const TextStyle(fontSize: 16, fontFamily: 'Poppins'),
        ),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(BgaColor.bgaOrange), // warna utama
          overlayColor: MaterialStateProperty.all<Color>(BgaColor.bgaOrange50), // warna ketika ditekan
        ),
      ),
    );
  }
}
