import 'package:bhive_assignment/services/dynamic_link.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:share_plus/share_plus.dart';

class HomeViewProvider extends ChangeNotifier {
  final deepLinkApi = GetIt.I.get<DynamicLinks>();
  String? referralCode;

  HomeViewProvider(context) {
    deepLinkApi.handleDynamicLink(context);
  }

  void onShare() async {
    final String? uid = FirebaseAuth.instance.currentUser?.uid;
    String referralLink = await deepLinkApi.createReferralLink(uid!);
    try {
      await Share.shareWithResult(
          'Hey, have you tried BHIVE.fund?\nI\'ve been investing with them and thought that you\'d love it too!\n\nBHIVE.fund is one of India\'s largest and fastest growing investment platforms.\n\nInvesting with them is fast and easy.\nClick on the link to start investing.\n\n$referralLink',
          subject: 'Did you try BHIVE yet?');
    } catch (e) {
      print(e.toString());
    }
  }
}
