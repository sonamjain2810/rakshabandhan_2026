// Package Name : top.latest.birthday.wishes.shayari.quotes.messages.images.gif.videos.creator
import 'dart:async';
import 'dart:io';
import 'package:app_tracking_transparency/app_tracking_transparency.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:rakshabandhan_app/data/Gifs.dart';
import 'package:rakshabandhan_app/utils/pass_data_between_screens.dart';
import 'package:url_launcher/url_launcher.dart';
import '../utils/SizeConfig.dart';
import 'AboutUs.dart';
import 'AdManager/ad_helper.dart';
import 'AdManager/ad_manager.dart';
import 'AppColors.dart';
import 'Enums/project_routes_enum.dart';
import 'GifsImages.dart';
import 'ImagesList.dart';
import 'MemeGenerator.dart';
import 'MessagesList.dart';
import 'MyDrawer.dart';
import 'ShayariList.dart';
import 'Singleton/project_manager.dart';
import 'data/Images.dart';
import 'widgets/CustomCardDesign.dart';
import 'widgets/CustomFeatureCard.dart';
import 'widgets/CustomFullCard.dart';
import 'widgets/TitleWithButton.dart';
import 'widgets/TitleWithCustomUnderLine.dart';

// Height = 8.96
// Width = 4.14
// design tutorial from this video
// https://www.youtube.com/watch?v=LN668OAUrK4
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

const String testDevice = 'c835aea0489176f272e2d174b8d921ca';
//const String testDevice = 'testDeviceId';

class _HomePageState extends State<HomePage>
    implements ProjectListener, AdListener {
  String _authStatus = 'Unknown';

  BannerAd? _bannerAd;
  ProjectManager projectManager = ProjectManager.instance;
  AdManager adManager = AdManager.instance;

  @override
  void initState() {
    super.initState();
    WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback(
      (_) => initPlugin(),
    );

    projectManager.listener = this;

    adManager.adListener = this;

    projectManager.startApp();

    adManager.loadAdsInAdManager();
  }

  BannerAd loadBannerAd() {
    return BannerAd(
      adUnitId: AdHelper.bannerAdUnitId,
      request: const AdRequest(),
      size: AdSize.banner,
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          setState(() {
            _bannerAd = ad as BannerAd;
          });
        },
        onAdFailedToLoad: (ad, err) {
          debugPrint('Failed to load a banner ad: ${err.message}');
          ad.dispose();
        },
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    debugPrint("Home Page: Dispose Called");
    projectManager.listener = null;
    adManager.adListener = null;
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlugin() async {
    final TrackingStatus status =
        await AppTrackingTransparency.trackingAuthorizationStatus;
    setState(() => _authStatus = '$status');
    // If the system can show an authorization request dialog
    if (status == TrackingStatus.notDetermined) {
      // Show a custom explainer dialog before the system dialog
      await showCustomTrackingDialog(context);
      // Wait for dialog popping animation
      await Future.delayed(const Duration(milliseconds: 200));
      // Request system's tracking authorization dialog
      final TrackingStatus status =
          await AppTrackingTransparency.requestTrackingAuthorization();
      setState(() => _authStatus = '$status');
    }

    final uuid = await AppTrackingTransparency.getAdvertisingIdentifier();
    debugPrint("UUID: $uuid");
  }

  Future<void> showCustomTrackingDialog(
    BuildContext context,
  ) async => await showDialog<void>(
    context: context,
    builder:
        (context) => AlertDialog(
                backgroundColor: Colors.white, // Solid white background

          title: const Text('Dear User'),
          content: const Text(
            'We care about your privacy and data security. We keep this app free by showing ads. '
            'Can we continue to use your data to tailor ads for you?\n\nYou can change your choice anytime in the app settings. '
            'Our partners will collect data and use a unique identifier on your device to show you ads.',
            style: TextStyle(color: Colors.black),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Continue',style: TextStyle(color: Colors.black)),
            ),
          ],
        ),
  );

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: buildAppBar(context),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(
                  bottom: 3.86 * SizeConfig.widthMultiplier * 2.5,
                ),
                height: size.height * 0.20,
                child: Stack(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(
                        left: 3.86 * SizeConfig.widthMultiplier,
                        right: 3.86 * SizeConfig.widthMultiplier,
                        bottom: 12 * SizeConfig.widthMultiplier,
                      ),
                      height:
                          size.height * 0.20 -
                          2.79 * SizeConfig.heightMultiplier,
                      decoration: BoxDecoration(
                        color:
                            Theme.of(context).brightness == Brightness.dark
                                ? AppColors.darkPrimaryVariant
                                : AppColors.lightPrimaryVariant,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(
                            7.25 * SizeConfig.widthMultiplier,
                          ),
                          bottomRight: Radius.circular(
                            7.25 * SizeConfig.widthMultiplier,
                          ),
                        ),
                      ),

                      child: Row(
                        children: <Widget>[
                          Text(
                            "Hello, User",
                            style: Theme.of(context).textTheme.displayLarge
                                ?.copyWith(color: Colors.white),
                          ),
                          Spacer(),
                          CircleAvatar(
                            backgroundImage: NetworkImage(
                              'https://pbs.twimg.com/profile_images/1158115409993691138/wABb5ZLe_400x400.jpg',
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      // Height = 8.96
                      // Width = 4.14
                      child: Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.symmetric(
                          horizontal: 7.25 * SizeConfig.widthMultiplier,
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 7.25 * SizeConfig.widthMultiplier,
                        ),
                        height: 7 * SizeConfig.heightMultiplier,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primary,
                          borderRadius: BorderRadius.circular(
                            4.83 * SizeConfig.widthMultiplier,
                          ),
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(0, 10),
                              blurRadius: 12 * SizeConfig.widthMultiplier,
                              color:
                                  Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? AppColors.darkPrimaryVariant
                                          .withOpacity(0.50)
                                      : AppColors.lightPrimaryVariant
                                          .withOpacity(0.50),
                            ),
                          ],
                        ),
                        child: Text(
                          "Hello, Check out Messages, Images, Gifs etc. for Your Loving Brothers & Sisters.",
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Recommeded Container
              TitleWithCustomUnderLine(text: "Get Started"),
              SizedBox(),
              SizedBox(),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: <Widget>[
                    CustomCardDesign(
                      size: size,
                      title: "Images",
                      image: 'assets/images.jpg',
                      ontap: () {
                        ProjectManager.instance
                      .clickOnButton(ProjectRoutes.imagesList.toString());
                      },
                    ),
                    CustomCardDesign(
                      size: size,
                      title: "Messages",
                      image: 'assets/messages.jpg',
                      ontap: () {
                        ProjectManager.instance
                      .clickOnButton(ProjectRoutes.messagesList.toString(),PassDataBetweenScreens("1", ""));
                      },
                    ),
                    CustomCardDesign(
                      size: size,
                      title: "Gifs",
                      image: 'assets/gifs.gif',
                      ontap: () {
                        ProjectManager.instance
                      .clickOnButton(ProjectRoutes.gifsList.toString());
                      },
                    ),
                    CustomCardDesign(
                      size: size,
                      title: "Shayari",
                      image: 'assets/shayari.jpg',
                      ontap: () {
                        ProjectManager.instance
                      .clickOnButton(ProjectRoutes.shayariList.toString());
                      },
                    ),
                    CustomCardDesign(
                      size: size,
                      title: "Wish Creator",
                      image: 'assets/wishcreator.gif',
                      ontap: () {
                        ProjectManager.instance
                      .clickOnButton(ProjectRoutes.memeGenerator.toString());
                      },
                    ),
                  ],
                ),
              ),
              Divider(),

              TitleWithButton(
                title: "Gifs for Brothers",
                press: () {
                  print("Gifs Clicked");

                  Navigator.of(context).push(
                    new MaterialPageRoute(
                      builder: (BuildContext context) => GifsImages(),
                    ),
                  );
                },
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: <Widget>[
                    CustomFeatureCard(
                      size: size,
                      imageUrl:
                          Gifs.gifsPath[0],
                      ontap: () {
                        ProjectManager.instance
                      .clickOnButton(ProjectRoutes.gifsList.toString());
                      },
                    ),
                    CustomFeatureCard(
                      size: size,
                      imageUrl:
                          Gifs.gifsPath[3],
                      ontap: () {
                        ProjectManager.instance
                      .clickOnButton(ProjectRoutes.gifsList.toString());
                      },
                    ),
                    CustomFeatureCard(
                      size: size,
                      imageUrl:
                          Gifs.gifsPath[6],
                      ontap: () {ProjectManager.instance
                      .clickOnButton(ProjectRoutes.gifsList.toString());},
                    ),
                    CustomFeatureCard(
                      size: size,
                      imageUrl:
                          Gifs.gifsPath[9],
                      ontap: () {ProjectManager.instance
                      .clickOnButton(ProjectRoutes.gifsList.toString());},
                    ),
                  ],
                ),
              ),
              Divider(),
              TitleWithButton(
                title: "Gifs for Sisters",
                press: () {
                  ProjectManager.instance
                      .clickOnButton(ProjectRoutes.gifsList.toString());
                  print("Gifs Clicked");
                },
              ),

              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: <Widget>[
                    CustomFeatureCard(
                      size: size,
                      imageUrl:
                          Gifs.gifsPath[15],
                      ontap: () {  ProjectManager.instance
                      .clickOnButton(ProjectRoutes.gifsList.toString());},
                    ),
                    CustomFeatureCard(
                      size: size,
                      imageUrl:
                          Gifs.gifsPath[21],
                      ontap: () {  ProjectManager.instance
                      .clickOnButton(ProjectRoutes.gifsList.toString());},
                    ),
                    CustomFeatureCard(
                      size: size,
                      imageUrl:
                          Gifs.gifsPath[22],
                      ontap: () {  ProjectManager.instance
                      .clickOnButton(ProjectRoutes.gifsList.toString());},
                    ),
                    CustomFeatureCard(
                      size: size,
                      imageUrl:
                          Gifs.gifsPath[24],
                      ontap: () {  ProjectManager.instance
                      .clickOnButton(ProjectRoutes.gifsList.toString());},
                    ),
                  ],
                ),
              ),

              Divider(),

              TitleWithButton(
                title: "Popular Images",
                press: () {
                  Navigator.of(context).push(
                    new MaterialPageRoute(
                      builder: (BuildContext context) => ImagesList(),
                    ),
                  );
                },
              ),

              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: <Widget>[
                    CustomFeatureCard(
                      size: size,
                      imageUrl:
                          Images.imagesPath[12],
                      ontap: () {
                          ProjectManager.instance
                      .clickOnButton(ProjectRoutes.imagesList.toString());
                      },
                    ),
                    CustomFeatureCard(
                      size: size,
                      imageUrl:
                          Images.imagesPath[35],
                      ontap: () {  ProjectManager.instance
                      .clickOnButton(ProjectRoutes.imagesList.toString());},
                    ),
                    CustomFeatureCard(
                      size: size,
                      imageUrl:
                          Images.imagesPath[58],
                      ontap: () {  ProjectManager.instance
                      .clickOnButton(ProjectRoutes.imagesList.toString());},
                    ),
                    CustomFeatureCard(
                      size: size,
                      imageUrl:
                          Images.imagesPath[20],
                      ontap: () {  ProjectManager.instance
                      .clickOnButton(ProjectRoutes.imagesList.toString());},
                    ),
                  ],
                ),
              ),
              Divider(),
              InkWell(
                child: Column(
                  children: <Widget>[
                    TitleWithButton(
                      title: "Rakshabandhan Game",
                      press: () {
                        if (Platform.isAndroid) {
                          // Android-specific code
                          print("More Button Clicked");
                          launch(
                            "https://play.google.com/store/apps/developer?id=Festival+Messages+SMS",
                          );
                        } else if (Platform.isIOS) {
                          // iOS-specific code
                          print("More Button Clicked");
                          launch(
                            "https://apps.apple.com/us/app/-/id1434054710",
                          );
                        }
                      },
                    ),
                    CustomFullCard(
                      size: size,
                      imageUrl: "assets/rakhigame.jpeg",
                      ontap: () {},
                    ),
                  ],
                ),
                onTap: () {
                  if (Platform.isAndroid) {
                    // Android-specific code
                    print("More Button Clicked");
                    launch(
                      "https://play.google.com/store/apps/developer?id=Festival+Messages+SMS",
                    );
                  } else if (Platform.isIOS) {
                    // iOS-specific code
                    print("More Button Clicked");
                    launch("https://apps.apple.com/us/app/-/id1434054710");
                  }
                },
              ),
            ],
          ),
        ),
      ),
      drawer: MyDrawer(),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      title: Text("Home", style: Theme.of(context).appBarTheme.titleTextStyle),
    );
  }

  @override
  void moveToScreen(String s, [PassDataBetweenScreens? object]) {
    // TODO: implement moveToScreen
    debugPrint("Home Page: Move to Screen $s");
    Navigator.of(context).pushNamed(s, arguments: object);
  }

  @override
  void moveToScreenAfterAd(String s, [PassDataBetweenScreens? object]) {
    // TODO: implement moveToScreenAfterAd
    debugPrint("Home Page: Move to Screen After Ad $s");
    Navigator.of(context).pushNamed(s, arguments: object);
  }

  @override
  void showAd(String s, [PassDataBetweenScreens? object]) {
    // TODO: implement showAd
    debugPrint("Home Page: Showing Ad Now");
    AdManager.instance.showInterstitialAd(s, object);
  }
}

/*class CustomFullCard extends StatelessWidget {
  const CustomFullCard({
    Key key,
    @required this.size,
    this.imageUrl,
    this.onTap,
  }) : super(key: key);

  final Size size;
  final String imageUrl;
  final Function onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        margin: EdgeInsets.only(
            left: 3.86 * SizeConfig.widthMultiplier,
            top: 3.86 * SizeConfig.widthMultiplier / 2,
            bottom: 3.86 * SizeConfig.widthMultiplier / 2,
            right: 3.86 * SizeConfig.widthMultiplier),
        width: size.width,
        height: 30 * SizeConfig.heightMultiplier,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(imageUrl),
            )),
      ),
      //onTap: onTap,
    );
  }
}

class CustomFeatureCard extends StatelessWidget {
  const CustomFeatureCard({
    Key key,
    @required this.size,
    this.imageUrl,
    this.onTap,
  }) : super(key: key);

  final Size size;
  final String imageUrl;
  final Function onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        margin: EdgeInsets.only(
            left: 3.86 * SizeConfig.widthMultiplier,
            top: 3.86 * SizeConfig.widthMultiplier / 2,
            bottom: 3.86 * SizeConfig.widthMultiplier / 2),
        width: size.width * 0.8,
        height: 40 * SizeConfig.heightMultiplier,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(imageUrl),
            )),
      ),
      // onTap: onTap,
    );
  }
}



/*class TitleWithButton extends StatelessWidget {
  const TitleWithButton({
    Key key,
    this.title,
    this.press,
  }) : super(key: key);

  final String title;
  final Function press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: 3.86 * SizeConfig.widthMultiplier),
      child: Row(
        children: <Widget>[
          TitleWithCustomUnderLine(text: title),
          Spacer(),
          RaisedButton(
            onPressed: press,
            child: Text(
              "More",
            ),
          ),
        ],
      ),
    );
  }
}*/

/*class TitleWithCustomUnderLine extends StatelessWidget {
  const TitleWithCustomUnderLine({
    Key key,
    this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 3.68 * SizeConfig.heightMultiplier,
        child: Stack(
          children: <Widget>[
            Padding(
              padding:
                  EdgeInsets.only(left: 3.86 * SizeConfig.widthMultiplier / 4),
              child: Text(
                text,
                style: Theme.of(context).textTheme.headline1,
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                margin: EdgeInsets.only(
                    right: 3.86 * SizeConfig.widthMultiplier / 4),
                height: 0.90 * SizeConfig.widthMultiplier,
                color: Theme.of(context)
                    .colorScheme
                    .primaryVariant
                    .withOpacity(0.30),
              ),
            ),
          ],
        ));
  }
}*/*/
