import 'package:flutter/material.dart';
import 'package:flutter_app/app/dependency_injections/init_app_module.dart';

import 'app/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initAppModule();
  runApp(MyApp());
}
 