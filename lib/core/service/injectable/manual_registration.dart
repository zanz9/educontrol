import 'package:educontrol/core/service/injectable/di.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> manualRegistration() async {
  getIt.registerSingleton<SharedPreferences>(
      await SharedPreferences.getInstance());
}
