// ignore_for_file: avoid_print

// Gradient is string like  'rgb(0, 88, 238) 0%, rgb(53, 147, 255) 4%'

void cssToFlutterGradientValues(String gradient) {
  final split =
      gradient.replaceAll('rgb', '').replaceAll(', ', ',').split(',(');

  final colors = <String>[];
  final stops = <double>[];

  for (var color in split) {
    color = color.replaceAll('(', '').replaceAll(')', '').trim();

    final colorSplit = color.split(' ');
    final rgb = colorSplit.first;
    final percents = colorSplit.last.replaceAll('%', '');

    colors.add('Color.fromRGBO($rgb, 1)');

    stops.add(double.parse(percents) / 100);
  }

  print(colors.join(',\n'));
  print(stops.join(',\n'));
}
