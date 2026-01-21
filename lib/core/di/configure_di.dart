import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:todo_list/core/di/configure_di.config.dart';

final GetIt getIt = GetIt.instance;

@InjectableInit()
void configureDependencies () => getIt.init();

