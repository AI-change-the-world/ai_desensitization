import 'package:ai_desensitization/src/isar/rule.dart';
import 'package:ai_desensitization/src/utils/logger.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class IsarDatabase {
  // ignore: avoid_init_to_null
  late Isar? isar = null;
  static final _instance = IsarDatabase._init();

  factory IsarDatabase() => _instance;

  IsarDatabase._init();

  Future initialDatabase() async {
    if (isar != null && isar!.isOpen) {
      return;
    }
    final dir = await getApplicationSupportDirectory();
    logger.i("database save to ${dir.path}");
    isar = await Isar.open(
      schemas,
      name: "ai_desensitization",
      directory: dir.path,
    );
  }

  late List<CollectionSchema<Object>> schemas = [RuleSchema];
}
