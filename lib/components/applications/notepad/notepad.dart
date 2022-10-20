import 'package:flutter/material.dart';
import 'package:flutter_windows_xp/components/app_window/app_window.dart';
import 'package:google_fonts/google_fonts.dart';

class Notepad extends StatelessWidget {
  const Notepad({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppWindow(
      child: Container(
        padding: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: const Color.fromRGBO(150, 171, 255, 1)),
        ),
        child: TextField(
          maxLines: null,
          keyboardType: TextInputType.multiline,
          decoration: const InputDecoration.collapsed(hintText: ''),
          style: GoogleFonts.varela(
            fontSize: 13,
            height: 1.07,
          ),
        ),
      ),
    );
  }
}
