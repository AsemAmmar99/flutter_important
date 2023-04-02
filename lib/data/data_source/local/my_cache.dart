import 'package:flutter_important/core/my_cache_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyCache {
  static SharedPreferences? preferences;

  static Future<void> initCache() async{
    preferences = await SharedPreferences.getInstance();
  }

  static void putString({required MyCacheKeys key, required String value}){
    preferences!.setString(key.name, value);
}

  static String getString({required MyCacheKeys key,}){
    return preferences!.getString(key.name) ?? '';
  }

  static void putInt({required MyCacheKeys key, required int value}){
    preferences!.setInt(key.name, value);
  }

  static int getInt({required MyCacheKeys key,}) {
    return preferences!.getInt(key.name) ?? 0;
  }

  static void putDouble({required MyCacheKeys key, required double value}){
    preferences!.setDouble(key.name, value);
  }

  static double getDouble({required MyCacheKeys key,}){
    return preferences!.getDouble(key.name) ?? 0.0;
  }

  static void putBool({required MyCacheKeys key, required bool value}){
    preferences!.setBool(key.name, value);
  }

  static bool getBool({required MyCacheKeys key,}){
    return preferences!.getBool(key.name) ?? false;
  }

  static void putStringList({required MyCacheKeys key, required List<String> value}){
    preferences!.setStringList(key.name, value);
  }

  static List<String> getStringList({required MyCacheKeys key,}){
    return preferences!.getStringList(key.name) ?? [];
  }

  static void removeFromCache({required MyCacheKeys key,}){
    preferences!.remove(key.name,);
  }

  static void clearCache(){
    preferences!.clear();
  }
}