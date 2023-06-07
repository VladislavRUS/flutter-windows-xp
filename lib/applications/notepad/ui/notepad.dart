import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:flutter_windows_xp/applications/notepad/ui/notepad_menu/notepad_menu.dart';
import 'package:flutter_windows_xp/ui/widgets/regular_window/regular_window.dart';
import 'package:flutter_windows_xp/ui/widgets/window/bloc/window_bloc.dart';

class Notepad extends StatefulWidget {
  const Notepad({
    Key? key,
  }) : super(key: key);

  @override
  State<Notepad> createState() => _NotepadState();
}

class _NotepadState extends State<Notepad> {
  @override
  void initState() {
    super.initState();

    context.read<WindowBloc>()
      ..setSize(width: 800, height: 600)
      ..setName('Untitled - Notepad');
  }

  @override
  Widget build(BuildContext context) {
    return RegularWindow(
      child: Column(
        children: [
          const NotepadMenu(),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                color: Colors.white,
                border:
                    Border.all(color: const Color.fromRGBO(150, 171, 255, 1)),
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 1, vertical: 4),
                child: TextField(
                  maxLines: null,
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration.collapsed(hintText: ''),
                  style: TextStyle(
                    fontSize: 13,
                    height: 1.07,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
