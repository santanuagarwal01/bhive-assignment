import 'package:bhive_assignment/services/route_generator.dart';
import 'package:bhive_assignment/services/routes.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';

class DynamicLinks {
  final dynamicLink = FirebaseDynamicLinks.instance;

  handleDynamicLink(BuildContext context) async {
    print("trying to link");
    await dynamicLink.getInitialLink();
    dynamicLink.onLink.listen((dynamicLinkData) {
      handleSuccessLinking(dynamicLinkData, context);
    }).onError((error) {
      print(error.toString());
      // Handle errors
    });
  }

  Future<String> createReferralLink(String referralCode) async {
    final DynamicLinkParameters dynamicLinkParameters = DynamicLinkParameters(
      link: Uri.parse('https://bhivetestapp.com/refer?code=$referralCode'),
      uriPrefix: 'https://bhivetestapp.page.link',
      androidParameters: const AndroidParameters(
          packageName: 'com.example.santanu.bhive_assignment'),
      socialMetaTagParameters: const SocialMetaTagParameters(
        title: 'Refer A Friend',
        description: 'Refer and Earn',
      ),
    );

    final shortLink = await FirebaseDynamicLinks.instance
        .buildShortLink(dynamicLinkParameters);

    final Uri dynamicUrl = shortLink.shortUrl;
    return dynamicUrl.toString();
  }

  void handleSuccessLinking(
      PendingDynamicLinkData dynamicLinkData, BuildContext context) {
    print("Success link !!");
    final Uri? deepLink = dynamicLinkData.link;

    if (deepLink != null) {
      var isRefer = deepLink.pathSegments.contains('refer');
      if (isRefer) {
        var code = deepLink.queryParameters['code'];
        if (code != null) {
          print("Code received: $code");
          GeneratedRoute.navigateTo(
            MyRoutes.signupRoute,
            args: code,
          );
        }
      }
    }
  }
}
