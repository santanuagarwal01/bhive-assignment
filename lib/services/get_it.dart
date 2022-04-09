import 'package:bhive_assignment/services/dynamic_link.dart';
import 'package:get_it/get_it.dart';

void setupGetIt() {
  print("1");
  GetIt.I.registerSingleton<DynamicLinks>(DynamicLinks());
}
