import 'package:json_store/json_store.dart';

JsonStore jsonStore = JsonStore();

Future<void> storeJson(String id, Map<String, dynamic> json) async {
  await jsonStore.setItem(id, json);
}

Future<Map<String, dynamic>?> loadJson(String id) async {
  return await jsonStore.getItem(id);
}
