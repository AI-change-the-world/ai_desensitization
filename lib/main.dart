import 'package:ai_desensitization/src/components/app/app.dart';
import 'package:ai_desensitization/src/isar/database.dart';
import 'package:ai_desensitization/src/rust/frb_generated.dart';
import 'package:ai_desensitization/src/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:window_manager/window_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await windowManager.ensureInitialized();
  await RustLib.init();

  WindowOptions windowOptions = WindowOptions(
    size: Styles.size,
    minimumSize: Styles.size,
    backgroundColor: Colors.white,
    skipTaskbar: false,
  );
  windowManager.waitUntilReadyToShow(windowOptions, () async {
    await windowManager.show();
    await windowManager.focus();
  });

  IsarDatabase database = IsarDatabase();
  await database.initialDatabase();

  runApp(
    const ProviderScope(
      child: MaterialApp(debugShowCheckedModeBanner: false, home: App()),
    ),
  );
}
