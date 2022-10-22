import 'package:flutter/material.dart';
import 'package:flutter_windows_xp/components/window/window.store.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Notepad extends StatefulWidget {
  const Notepad({Key? key}) : super(key: key);

  @override
  State<Notepad> createState() => _NotepadState();
}

class _NotepadState extends State<Notepad> {
  @override
  void initState() {
    super.initState();

    context.read<WindowStore>().setName('Untitled - Notepad');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}