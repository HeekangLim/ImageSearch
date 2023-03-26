class Define {
  static const String ASSET_IMAGE_DEFAULT_ICON = 'assets/images/jnv.png';

  static Arguments arguments = const Arguments();
  static PrefKey prefKey = const PrefKey();
}

class Arguments {
  const Arguments();
  String get detail_img => 'arg_detail_img';

  String get detail_img_index => 'arg_detail_img_index';
}

class PrefKey {
  const PrefKey();
  String get IMAGE_LIST => 'IMAGE_LIST';      // 이미지 목록 키
}
