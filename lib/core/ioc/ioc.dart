import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'ioc.config.dart';

final locator = GetIt.instance;

@InjectableInit(
  initializerName: 'init', // default
  preferRelativeImports: true, // default
  asExtension: true, // default
)
void configureDependencies() => locator.init();
