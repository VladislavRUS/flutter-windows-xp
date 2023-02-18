import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_windows_xp/applications/paint/store/tools/eraser.tool.dart';

class EraserToolOptions extends StatelessWidget {
  final EraserTool tool;

  const EraserToolOptions({
    Key? key,
    required this.tool,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          for (double size = 4; size <= 10; size += 2)
            Expanded(
              child: GestureDetector(
                onTap: () => tool.onSelectSize(size),
                child: Container(
                  decoration: BoxDecoration(
                    color: tool.size == size
                        ? const Color.fromRGBO(0, 0, 123, 1)
                        : Colors.transparent,
                  ),
                  child: Center(
                    child: Container(
                      width: size,
                      height: size,
                      color: tool.size == size ? Colors.white : Colors.black,
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
