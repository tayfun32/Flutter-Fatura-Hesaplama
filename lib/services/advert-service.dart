import 'dart:io';
import 'package:firebase_admob/firebase_admob.dart';

class AdvertService {
  static final AdvertService _instance = AdvertService._internal();

  factory AdvertService() => _instance;
  MobileAdTargetingInfo _targetingInfo;
  final String _bannerAd = Platform.isAndroid
      ? 'ca-app-pub-4186110447334251/7484761280'
      : 'ca-app-pub-4186110447334251/8560031628';
  final String _gecisAd="ca-app-pub-4186110447334251/9513843032";

  AdvertService._internal() {
    _targetingInfo = MobileAdTargetingInfo();
  }

  showBanner() {
    BannerAd banner = BannerAd(
        adUnitId:_bannerAd,
        //_bannerAd,
        //_bannerAd,
        //,
        //BannerAd.testAdUnitId
        size: AdSize.smartBanner,
        targetingInfo: _targetingInfo);

    banner
      ..load()
      ..show(); //
    banner.dispose();
  }

  showIntersitial() {
    InterstitialAd interstitialAd = InterstitialAd(
        adUnitId:_gecisAd, targetingInfo: _targetingInfo);
    // InterstitialAd.testAdUnitId
    //_gecisAd
    interstitialAd
      ..load()
      ..show();
    interstitialAd.dispose();
  }
}
