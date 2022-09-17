class Settings {
  ComBitlinksChineseIptvM3ulist? comBitlinksChineseIptvM3ulist;

  Settings({this.comBitlinksChineseIptvM3ulist});

  Settings.fromJson(Map<String, dynamic> json) {
    comBitlinksChineseIptvM3ulist =
    json['com.bitlinks.chinese.iptv.m3ulist'] != null
        ? new ComBitlinksChineseIptvM3ulist.fromJson(
        json['com.bitlinks.chinese.iptv.m3ulist'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.comBitlinksChineseIptvM3ulist != null) {
      data['com.bitlinks.chinese.iptv.m3ulist'] =
          this.comBitlinksChineseIptvM3ulist!.toJson();
    }
    return data;
  }
}

class ComBitlinksChineseIptvM3ulist {
  List<String>? adsSequence;
  String? moreAppUrl;
  String? extraUrl;
  String? iptvPlayerUrl;
  AdSetting? adSetting;
  AppUpdate? appUpdate;
  ExitDialog? exitDialog;
  RewardDialog? rewardDialog;
  AboutApp? aboutApp;
  RateApp? rateApp;
  ShareApp? shareApp;
  PrivacyPolicy? privacyPolicy;
  TermsOfUse? termsOfUse;
  ErrorReport? errorReport;
  FeedbackSupport? feedbackSupport;
  GoogleAds? googleAds;
  FacebookAds? facebookAds;
  CustomAds? customAds;
  AppLovin? appLovin;
  UnityAds? unityAds;

  ComBitlinksChineseIptvM3ulist(
      {this.adsSequence,
        this.moreAppUrl,
        this.extraUrl,
        this.iptvPlayerUrl,
        this.adSetting,
        this.appUpdate,
        this.exitDialog,
        this.rewardDialog,
        this.aboutApp,
        this.rateApp,
        this.shareApp,
        this.privacyPolicy,
        this.termsOfUse,
        this.errorReport,
        this.feedbackSupport,
        this.googleAds,
        this.facebookAds,
        this.customAds,
        this.appLovin,
        this.unityAds});

  ComBitlinksChineseIptvM3ulist.fromJson(Map<String, dynamic> json) {
    adsSequence = json['ads_sequence'].cast<String>();
    moreAppUrl = json['more_app_url'];
    extraUrl = json['extra_url'];
    iptvPlayerUrl = json['iptv_player_url'];
    adSetting = json['ad_setting'] != null
        ? new AdSetting.fromJson(json['ad_setting'])
        : null;
    appUpdate = json['app_update'] != null
        ? new AppUpdate.fromJson(json['app_update'])
        : null;
    exitDialog = json['exit_dialog'] != null
        ? new ExitDialog.fromJson(json['exit_dialog'])
        : null;
    rewardDialog = json['reward_dialog'] != null
        ? new RewardDialog.fromJson(json['reward_dialog'])
        : null;
    aboutApp = json['About_App'] != null
        ? new AboutApp.fromJson(json['About_App'])
        : null;
    rateApp = json['rate_app'] != null
        ? new RateApp.fromJson(json['rate_app'])
        : null;
    shareApp = json['share_app'] != null
        ? new ShareApp.fromJson(json['share_app'])
        : null;
    privacyPolicy = json['privacy_policy'] != null
        ? new PrivacyPolicy.fromJson(json['privacy_policy'])
        : null;
    termsOfUse = json['terms_of_use'] != null
        ? new TermsOfUse.fromJson(json['terms_of_use'])
        : null;
    errorReport = json['error_report'] != null
        ? new ErrorReport.fromJson(json['error_report'])
        : null;
    feedbackSupport = json['feedback_support'] != null
        ? new FeedbackSupport.fromJson(json['feedback_support'])
        : null;
    googleAds = json['google_ads'] != null
        ? new GoogleAds.fromJson(json['google_ads'])
        : null;
    facebookAds = json['facebook_ads'] != null
        ? new FacebookAds.fromJson(json['facebook_ads'])
        : null;
    customAds = json['custom_ads'] != null
        ? new CustomAds.fromJson(json['custom_ads'])
        : null;
    appLovin = json['app_lovin'] != null
        ? new AppLovin.fromJson(json['app_lovin'])
        : null;
    unityAds = json['unity_ads'] != null
        ? new UnityAds.fromJson(json['unity_ads'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ads_sequence'] = this.adsSequence;
    data['more_app_url'] = this.moreAppUrl;
    data['extra_url'] = this.extraUrl;
    data['iptv_player_url'] = this.iptvPlayerUrl;
    if (this.adSetting != null) {
      data['ad_setting'] = this.adSetting!.toJson();
    }
    if (this.appUpdate != null) {
      data['app_update'] = this.appUpdate!.toJson();
    }
    if (this.exitDialog != null) {
      data['exit_dialog'] = this.exitDialog!.toJson();
    }
    if (this.rewardDialog != null) {
      data['reward_dialog'] = this.rewardDialog!.toJson();
    }
    if (this.aboutApp != null) {
      data['About_App'] = this.aboutApp!.toJson();
    }
    if (this.rateApp != null) {
      data['rate_app'] = this.rateApp!.toJson();
    }
    if (this.shareApp != null) {
      data['share_app'] = this.shareApp!.toJson();
    }
    if (this.privacyPolicy != null) {
      data['privacy_policy'] = this.privacyPolicy!.toJson();
    }
    if (this.termsOfUse != null) {
      data['terms_of_use'] = this.termsOfUse!.toJson();
    }
    if (this.errorReport != null) {
      data['error_report'] = this.errorReport!.toJson();
    }
    if (this.feedbackSupport != null) {
      data['feedback_support'] = this.feedbackSupport!.toJson();
    }
    if (this.googleAds != null) {
      data['google_ads'] = this.googleAds!.toJson();
    }
    if (this.facebookAds != null) {
      data['facebook_ads'] = this.facebookAds!.toJson();
    }
    if (this.customAds != null) {
      data['custom_ads'] = this.customAds!.toJson();
    }
    if (this.appLovin != null) {
      data['app_lovin'] = this.appLovin!.toJson();
    }
    if (this.unityAds != null) {
      data['unity_ads'] = this.unityAds!.toJson();
    }
    return data;
  }
}

class AdSetting {
  int? appVersionCode;
  bool? isFullAds;
  String? onesignalId;
  String? adsLoadingText;
  int? globalIntraIntervalClick;
  int? interstitialAdTimeInterval;

  AdSetting(
      {this.appVersionCode,
        this.isFullAds,
        this.onesignalId,
        this.adsLoadingText,
        this.globalIntraIntervalClick,
        this.interstitialAdTimeInterval});

  AdSetting.fromJson(Map<String, dynamic> json) {
    appVersionCode = json['app_version_code'];
    isFullAds = json['is_full_ads'];
    onesignalId = json['onesignal_id'];
    adsLoadingText = json['ads_loading_text'];
    globalIntraIntervalClick = json['global_intra_interval_click'];
    interstitialAdTimeInterval = json['interstitial_ad_time_interval'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['app_version_code'] = this.appVersionCode;
    data['is_full_ads'] = this.isFullAds;
    data['onesignal_id'] = this.onesignalId;
    data['ads_loading_text'] = this.adsLoadingText;
    data['global_intra_interval_click'] = this.globalIntraIntervalClick;
    data['interstitial_ad_time_interval'] = this.interstitialAdTimeInterval;
    return data;
  }
}

class AppUpdate {
  bool? isPopupDialog;
  bool? isUpdateRequire;
  String? packageId;
  String? websiteUrl;
  String? appIcon;
  int? updatedVersionCode;
  String? title;
  String? defaultMessage;

  AppUpdate(
      {this.isPopupDialog,
        this.isUpdateRequire,
        this.packageId,
        this.websiteUrl,
        this.appIcon,
        this.updatedVersionCode,
        this.title,
        this.defaultMessage});

  AppUpdate.fromJson(Map<String, dynamic> json) {
    isPopupDialog = json['is_popup_dialog'];
    isUpdateRequire = json['is_update_require'];
    packageId = json['package_id'];
    websiteUrl = json['website_url'];
    appIcon = json['app_icon'];
    updatedVersionCode = json['updated_version_code'];
    title = json['title'];
    defaultMessage = json['default_message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['is_popup_dialog'] = this.isPopupDialog;
    data['is_update_require'] = this.isUpdateRequire;
    data['package_id'] = this.packageId;
    data['website_url'] = this.websiteUrl;
    data['app_icon'] = this.appIcon;
    data['updated_version_code'] = this.updatedVersionCode;
    data['title'] = this.title;
    data['default_message'] = this.defaultMessage;
    return data;
  }
}

class ExitDialog {
  bool? isExitRequire;
  String? exitTitle;
  String? exitMessage;

  ExitDialog({this.isExitRequire, this.exitTitle, this.exitMessage});

  ExitDialog.fromJson(Map<String, dynamic> json) {
    isExitRequire = json['is_exit_require'];
    exitTitle = json['exit_title'];
    exitMessage = json['exit_message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['is_exit_require'] = this.isExitRequire;
    data['exit_title'] = this.exitTitle;
    data['exit_message'] = this.exitMessage;
    return data;
  }
}

class RewardDialog {
  bool? isRewardRequire;
  String? rewardMessage;

  RewardDialog({this.isRewardRequire, this.rewardMessage});

  RewardDialog.fromJson(Map<String, dynamic> json) {
    isRewardRequire = json['is_reward_require'];
    rewardMessage = json['reward_message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['is_reward_require'] = this.isRewardRequire;
    data['reward_message'] = this.rewardMessage;
    return data;
  }
}

class AboutApp {
  bool? isOverride;
  bool? isAboutApp;
  String? aboutTitle;
  String? aboutMessage;
  String? registrationDetail;
  String? versionDetail;

  AboutApp(
      {this.isOverride,
        this.isAboutApp,
        this.aboutTitle,
        this.aboutMessage,
        this.registrationDetail,
        this.versionDetail});

  AboutApp.fromJson(Map<String, dynamic> json) {
    isOverride = json['is_override'];
    isAboutApp = json['is_about_app'];
    aboutTitle = json['about_title'];
    aboutMessage = json['about_message'];
    registrationDetail = json['registration_detail'];
    versionDetail = json['version_detail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['is_override'] = this.isOverride;
    data['is_about_app'] = this.isAboutApp;
    data['about_title'] = this.aboutTitle;
    data['about_message'] = this.aboutMessage;
    data['registration_detail'] = this.registrationDetail;
    data['version_detail'] = this.versionDetail;
    return data;
  }
}

class RateApp {
  bool? isRateApp;
  String? packageId;
  String? rateAppUrl;
  String? rateMessage;

  RateApp({this.isRateApp, this.packageId, this.rateAppUrl, this.rateMessage});

  RateApp.fromJson(Map<String, dynamic> json) {
    isRateApp = json['is_rate_app'];
    packageId = json['package_id'];
    rateAppUrl = json['rate_app_url'];
    rateMessage = json['rate_message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['is_rate_app'] = this.isRateApp;
    data['package_id'] = this.packageId;
    data['rate_app_url'] = this.rateAppUrl;
    data['rate_message'] = this.rateMessage;
    return data;
  }
}

class ShareApp {
  bool? isShareApp;
  String? shareTitle;
  String? shareMessage;

  ShareApp({this.isShareApp, this.shareTitle, this.shareMessage});

  ShareApp.fromJson(Map<String, dynamic> json) {
    isShareApp = json['is_share_app'];
    shareTitle = json['share_title'];
    shareMessage = json['share_message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['is_share_app'] = this.isShareApp;
    data['share_title'] = this.shareTitle;
    data['share_message'] = this.shareMessage;
    return data;
  }
}

class PrivacyPolicy {
  bool? isPrivacyPolicy;
  bool? isSystemBrowser;
  String? privacyPolicy;

  PrivacyPolicy(
      {this.isPrivacyPolicy, this.isSystemBrowser, this.privacyPolicy});

  PrivacyPolicy.fromJson(Map<String, dynamic> json) {
    isPrivacyPolicy = json['is_privacy_policy'];
    isSystemBrowser = json['is_system_browser'];
    privacyPolicy = json['privacy_policy'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['is_privacy_policy'] = this.isPrivacyPolicy;
    data['is_system_browser'] = this.isSystemBrowser;
    data['privacy_policy'] = this.privacyPolicy;
    return data;
  }
}

class TermsOfUse {
  bool? isTermsOfUse;
  bool? isSystemBrowser;
  String? termsOfUse;

  TermsOfUse({this.isTermsOfUse, this.isSystemBrowser, this.termsOfUse});

  TermsOfUse.fromJson(Map<String, dynamic> json) {
    isTermsOfUse = json['is_terms_of_use'];
    isSystemBrowser = json['is_system_browser'];
    termsOfUse = json['terms_of_use'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['is_terms_of_use'] = this.isTermsOfUse;
    data['is_system_browser'] = this.isSystemBrowser;
    data['terms_of_use'] = this.termsOfUse;
    return data;
  }
}

class ErrorReport {
  bool? isErrorReportSupport;
  String? emailId;

  ErrorReport({this.isErrorReportSupport, this.emailId});

  ErrorReport.fromJson(Map<String, dynamic> json) {
    isErrorReportSupport = json['is_error_report_support'];
    emailId = json['email_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['is_error_report_support'] = this.isErrorReportSupport;
    data['email_id'] = this.emailId;
    return data;
  }
}

class FeedbackSupport {
  bool? isFeedbackSupport;
  String? emailId;
  String? feedbackTitle;
  String? feedbackMessage;
  String? emailSubject;
  String? emailMessage;

  FeedbackSupport(
      {this.isFeedbackSupport,
        this.emailId,
        this.feedbackTitle,
        this.feedbackMessage,
        this.emailSubject,
        this.emailMessage});

  FeedbackSupport.fromJson(Map<String, dynamic> json) {
    isFeedbackSupport = json['is_feedback_support'];
    emailId = json['email_id'];
    feedbackTitle = json['feedback_title'];
    feedbackMessage = json['feedback_message'];
    emailSubject = json['email_subject'];
    emailMessage = json['email_message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['is_feedback_support'] = this.isFeedbackSupport;
    data['email_id'] = this.emailId;
    data['feedback_title'] = this.feedbackTitle;
    data['feedback_message'] = this.feedbackMessage;
    data['email_subject'] = this.emailSubject;
    data['email_message'] = this.emailMessage;
    return data;
  }
}

class GoogleAds {
  String? bannerAdUnitIdAndroid;
  String? interstitialAdUnitIdAndroid;
  String? appOpenAdUnitIdAndroid;
  String? nativeAdsUnitIdAndroid;
  String? rewaredAdsUnitId;
  String? nativeVideoAdsUnitIdAndroid;
  bool? isBannerAds;
  bool? isOpenAds;
  bool? isInterstitialAds;
  bool? isRewaredAds;
  bool? isNativeAds;
  int? noOfClickInterstitial;

  GoogleAds(
      {this.bannerAdUnitIdAndroid,
        this.interstitialAdUnitIdAndroid,
        this.appOpenAdUnitIdAndroid,
        this.nativeAdsUnitIdAndroid,
        this.rewaredAdsUnitId,
        this.nativeVideoAdsUnitIdAndroid,
        this.isBannerAds,
        this.isOpenAds,
        this.isInterstitialAds,
        this.isRewaredAds,
        this.isNativeAds,
        this.noOfClickInterstitial});

  GoogleAds.fromJson(Map<String, dynamic> json) {
    bannerAdUnitIdAndroid = json['banner_ad_unit_id_android'];
    interstitialAdUnitIdAndroid = json['interstitial_ad_unit_id_android'];
    appOpenAdUnitIdAndroid = json['app_open_ad_unit_id_android'];
    nativeAdsUnitIdAndroid = json['native_ads_unit_id_android'];
    rewaredAdsUnitId = json['rewared_ads_unit_id'];
    nativeVideoAdsUnitIdAndroid = json['native_video_ads_unit_id_android'];
    isBannerAds = json['is_banner_ads'];
    isOpenAds = json['is_open_ads'];
    isInterstitialAds = json['is_interstitial_ads'];
    isRewaredAds = json['is_rewared_ads'];
    isNativeAds = json['is_native_ads'];
    noOfClickInterstitial = json['no_of_click_interstitial'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['banner_ad_unit_id_android'] = this.bannerAdUnitIdAndroid;
    data['interstitial_ad_unit_id_android'] = this.interstitialAdUnitIdAndroid;
    data['app_open_ad_unit_id_android'] = this.appOpenAdUnitIdAndroid;
    data['native_ads_unit_id_android'] = this.nativeAdsUnitIdAndroid;
    data['rewared_ads_unit_id'] = this.rewaredAdsUnitId;
    data['native_video_ads_unit_id_android'] = this.nativeVideoAdsUnitIdAndroid;
    data['is_banner_ads'] = this.isBannerAds;
    data['is_open_ads'] = this.isOpenAds;
    data['is_interstitial_ads'] = this.isInterstitialAds;
    data['is_rewared_ads'] = this.isRewaredAds;
    data['is_native_ads'] = this.isNativeAds;
    data['no_of_click_interstitial'] = this.noOfClickInterstitial;
    return data;
  }
}

class FacebookAds {
  String? bannerAdUnitIdAndroid;
  String? interstitialAdUnitIdAndroid;
  String? rewaredAdsUnitId;
  String? nativeAdsUnitIdAndroid;
  bool? isBannerAds;
  bool? isInterstitialAds;
  bool? isRewaredAds;
  bool? isNativeAds;
  int? noOfClickInterstitial;

  FacebookAds(
      {this.bannerAdUnitIdAndroid,
        this.interstitialAdUnitIdAndroid,
        this.rewaredAdsUnitId,
        this.nativeAdsUnitIdAndroid,
        this.isBannerAds,
        this.isInterstitialAds,
        this.isRewaredAds,
        this.isNativeAds,
        this.noOfClickInterstitial});

  FacebookAds.fromJson(Map<String, dynamic> json) {
    bannerAdUnitIdAndroid = json['banner_ad_unit_id_android'];
    interstitialAdUnitIdAndroid = json['interstitial_ad_unit_id_android'];
    rewaredAdsUnitId = json['rewared_ads_unit_id'];
    nativeAdsUnitIdAndroid = json['native_ads_unit_id_android'];
    isBannerAds = json['is_banner_ads'];
    isInterstitialAds = json['is_interstitial_ads'];
    isRewaredAds = json['is_rewared_ads'];
    isNativeAds = json['is_native_ads'];
    noOfClickInterstitial = json['no_of_click_interstitial'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['banner_ad_unit_id_android'] = this.bannerAdUnitIdAndroid;
    data['interstitial_ad_unit_id_android'] = this.interstitialAdUnitIdAndroid;
    data['rewared_ads_unit_id'] = this.rewaredAdsUnitId;
    data['native_ads_unit_id_android'] = this.nativeAdsUnitIdAndroid;
    data['is_banner_ads'] = this.isBannerAds;
    data['is_interstitial_ads'] = this.isInterstitialAds;
    data['is_rewared_ads'] = this.isRewaredAds;
    data['is_native_ads'] = this.isNativeAds;
    data['no_of_click_interstitial'] = this.noOfClickInterstitial;
    return data;
  }
}

class CustomAds {
  String? qurekaLink;
  bool? isQurakaBanner;
  bool? isQurakaIntera;
  bool? closeButtonToDirectWeb;
  List<String>? qurakaIntraImage;
  List<String>? qurakaBannerImage;

  CustomAds(
      {this.qurekaLink,
        this.isQurakaBanner,
        this.isQurakaIntera,
        this.closeButtonToDirectWeb,
        this.qurakaIntraImage,
        this.qurakaBannerImage});

  CustomAds.fromJson(Map<String, dynamic> json) {
    qurekaLink = json['qureka_link'];
    isQurakaBanner = json['is_quraka_banner'];
    isQurakaIntera = json['is_quraka_intera'];
    closeButtonToDirectWeb = json['close_button_to_direct_web'];
    qurakaIntraImage = json['quraka_intra_image'].cast<String>();
    qurakaBannerImage = json['quraka_banner_image'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['qureka_link'] = this.qurekaLink;
    data['is_quraka_banner'] = this.isQurakaBanner;
    data['is_quraka_intera'] = this.isQurakaIntera;
    data['close_button_to_direct_web'] = this.closeButtonToDirectWeb;
    data['quraka_intra_image'] = this.qurakaIntraImage;
    data['quraka_banner_image'] = this.qurakaBannerImage;
    return data;
  }
}

class AppLovin {
  bool? isUnlimitedAds;
  String? idUnitBanner;
  String? idUnitIntra;
  IdUnitNativeMultiple? idUnitNativeMultiple;
  String? rewaredAdsUnitId;
  bool? isBannerAds;
  bool? isInterstitialAds;
  bool? isNativeAds;
  bool? isRewaredAds;

  AppLovin(
      {this.isUnlimitedAds,
        this.idUnitBanner,
        this.idUnitIntra,
        this.idUnitNativeMultiple,
        this.rewaredAdsUnitId,
        this.isBannerAds,
        this.isInterstitialAds,
        this.isNativeAds,
        this.isRewaredAds});

  AppLovin.fromJson(Map<String, dynamic> json) {
    isUnlimitedAds = json['is_unlimited_ads'];
    idUnitBanner = json['id_unit_banner'];
    idUnitIntra = json['id_unit_intra'];
    idUnitNativeMultiple = json['id_unit_native_multiple'] != null
        ? new IdUnitNativeMultiple.fromJson(json['id_unit_native_multiple'])
        : null;
    rewaredAdsUnitId = json['rewared_ads_unit_id'];
    isBannerAds = json['is_banner_ads'];
    isInterstitialAds = json['is_interstitial_ads'];
    isNativeAds = json['is_native_ads'];
    isRewaredAds = json['is_rewared_ads'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['is_unlimited_ads'] = this.isUnlimitedAds;
    data['id_unit_banner'] = this.idUnitBanner;
    data['id_unit_intra'] = this.idUnitIntra;
    if (this.idUnitNativeMultiple != null) {
      data['id_unit_native_multiple'] = this.idUnitNativeMultiple!.toJson();
    }
    data['rewared_ads_unit_id'] = this.rewaredAdsUnitId;
    data['is_banner_ads'] = this.isBannerAds;
    data['is_interstitial_ads'] = this.isInterstitialAds;
    data['is_native_ads'] = this.isNativeAds;
    data['is_rewared_ads'] = this.isRewaredAds;
    return data;
  }
}

class IdUnitNativeMultiple {
  String? small;
  String? medium;
  String? manual;

  IdUnitNativeMultiple({this.small, this.medium, this.manual});

  IdUnitNativeMultiple.fromJson(Map<String, dynamic> json) {
    small = json['small'];
    medium = json['medium'];
    manual = json['manual'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['small'] = this.small;
    data['medium'] = this.medium;
    data['manual'] = this.manual;
    return data;
  }
}

class UnityAds {
  String? gameId;
  bool? isIntraAds;
  bool? isBannerAds;
  bool? isRewaredAds;

  UnityAds({this.gameId, this.isIntraAds, this.isBannerAds, this.isRewaredAds});

  UnityAds.fromJson(Map<String, dynamic> json) {
    gameId = json['game_id'];
    isIntraAds = json['is_intra_ads'];
    isBannerAds = json['is_banner_ads'];
    isRewaredAds = json['is_rewared_ads'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['game_id'] = this.gameId;
    data['is_intra_ads'] = this.isIntraAds;
    data['is_banner_ads'] = this.isBannerAds;
    data['is_rewared_ads'] = this.isRewaredAds;
    return data;
  }
}
