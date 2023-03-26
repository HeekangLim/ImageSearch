import 'dart:convert';

import 'package:jvn_project/define/define.dart';
import 'package:jvn_project/domain/entities/response/res_search_image_documents.dart';
import 'package:jvn_project/options/initializer.dart';
import 'package:jvn_project/utils/pref_data/pref_img_map.dart';
import 'package:jvn_project/utils/preference_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferenceHelper {
  static final SharedPreferences? _pref = PreferenceManager().get();

  // PreferenceHelper() async {
  //   _pref ??= await PreferenceManager.initialize();
  // }

  static void _saveMap (String key, Map<String, dynamic> data) {
    logger.d('_saveMap');
    try {
      String encodedMap = json.encode(data);
      logger.d('_saveMap encodedMap length : ${encodedMap.length}');
      _pref?.setString(key, encodedMap);
    }
    catch(e) {
      logger.d('_saveMap exception $e');
    }
  }

  static Map<String, dynamic> _loadMap (String key) {
  // static dynamic _loadMap (String key) {
    String encodedMap = _pref?.getString(key) ?? '';
    if (encodedMap.isEmpty) return {};
    logger.d('encodedMap length : ${encodedMap.length}');
    Map<String, dynamic> decodedMap = json.decode(encodedMap) as Map<String, dynamic>;
    // dynamic decoded = json.decode(encodedMap);

    return decodedMap;
  }

  static void _saveDynamic (String key, dynamic data) {
    logger.d('_saveDynamic');
    if (_pref == null) logger.d('pref is null');
    try {
      String encodedMap = json.encode(data);
      logger.d('_saveDynamic encodedMap : $encodedMap');
      _pref?.setString(key, encodedMap);
    }
    catch(e) {
      logger.d('_saveDynamic exception $e');
    }
  }

  static dynamic _loadDynamic (String key) {
    if (_pref == null) logger.d('pref is null');
    String encodedMap = _pref?.getString(key) ?? '';
    // return encodedMap;
    dynamic decoded;
    try {
      decoded = json.decode(encodedMap);
    }
    catch(e) {
      logger.d('_loadDynamic exception $e');
      return '';
    }
    return decoded;
  }

  static Map<String, ResSearchImageDocuments> getImages() {
    final loadData = _loadDynamic(Define.prefKey.IMAGE_LIST);

    if (loadData.isNotEmpty) {
      try {
        return PrefImgMap.fromJson(loadData).maps;
      }
      catch(e) {
        logger.d('getImages exception $e');
        return {};
      }
    }
    return {};
  }

  static void saveImage(ResSearchImageDocuments? data) {
    if (data == null) {
      // 경고 후 리턴
      return;
    }

    var maps = getImages();

    maps[data.image_url ?? ''] = data;

    PrefImgMap saveData = PrefImgMap(maps: maps);
    _saveDynamic(Define.prefKey.IMAGE_LIST, saveData);

  }

  static void removeImage (ResSearchImageDocuments? data) {
    if (data == null) {
      // 경고 후 리턴
      return;
    }

    var maps = getImages();

    maps.remove(data.image_url);

    PrefImgMap saveData = PrefImgMap(maps: maps);
    _saveDynamic(Define.prefKey.IMAGE_LIST, saveData);
  }
}