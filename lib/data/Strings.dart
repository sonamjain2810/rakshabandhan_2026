import 'dart:io';
import 'package:launch_review/launch_review.dart';

class Strings {
  Strings._();

  static const accountName = "GJOneStudio";

  static const accountEmail = "gj1studio@gmail.com";

  static const appName = "Rakshabandhan Images Greetings";

  static const mailAppName = "Rakshabandhan%20Images%20Greetings";

  static const iosAppId = "1523619788";

  static const iosAdmobAppId = "ca-app-pub-8179797674906935~9232945545";

  static const iosAdmobBannerId = "ca-app-pub-8179797674906935/5293700537";

  static const iosAdmobInterstitialId =
      "ca-app-pub-8179797674906935/3980618866"; //8452635043

  static const iosAdmobNativeId = "ca-app-pub-8179797674906935/7054392812";

  static const iosAdmobRewardedId = "ca-app-pub-8179797674906935/6383420929";

  static const iosFBInterstitialId = "266846741590142_266846904923459";

  static const iosFBBannerId = "266846741590142_270405771234239";

  static const androidAppPackageName = "good.morning.images.messages";

  static const androidAdmobAppId = "ca-app-pub-8179797674906935~2769888473";

  static const androidAdmobBannerId = "ca-app-pub-8179797674906935/8263223464";

  static const androidAdmobInterstitialId = "ca-app-pub-8179797674906935/9198483887";

  static const androidAdmobNativeId = "ca-app-pub-8179797674906935/5640929557";

  static const androidAdmobRewardedId = "ca-app-pub-8179797674906935/9676996032";

  static const testDevice = 'c835aea0489176f272e2d174b8d921ca';

  static String appUrl = Platform.isAndroid
      ? "https://play.google.com/store/apps/details?id=${Strings.androidAppPackageName}"
      : "https://apps.apple.com/us/app/-/id${Strings.iosAppId}";

  static String accountUrl = Platform.isAndroid
      ? "https://play.google.com/store/apps/developer?id=Festival+Messages+SMS"
      : "https://apps.apple.com/us/developer/sonam-jain/id1440118616";

  static const String mailContent =
      'mailto:sonamjain2810@yahoo.com?subject=feedback%20from%20${Strings.mailAppName}&body=Your%20Apps%20Rocks!!';

  static String shareAppText =
      "Hey I have found this amazing app for you.\nHave a look on\n${Strings.appName}\n${Strings.appUrl}";

  static void RateNReview() {
    LaunchReview.launch(iOSAppId: Strings.iosAppId);
  }
}
