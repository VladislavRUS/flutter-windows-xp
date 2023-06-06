import 'package:url_launcher/url_launcher.dart';

void openLink(String link) async {
  final url = Uri.parse(link);

  if (!await launchUrl(url)) {
    throw Exception('Could not launch $url');
  }
}
