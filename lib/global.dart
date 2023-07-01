import 'package:flutter/cupertino.dart';
import 'core/service/storage_service.dart';
import 'di/injection_container.dart' as di;

class Global{
  static late StorageService storageService;

  static Future init() async{
    WidgetsFlutterBinding.ensureInitialized();
    await di.init();
    storageService = await StorageService().init();
  }
}