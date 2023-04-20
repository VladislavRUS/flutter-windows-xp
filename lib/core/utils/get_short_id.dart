import 'package:short_uuids/short_uuids.dart';

String getShortId() {
  return const ShortUuid().generate();
}
