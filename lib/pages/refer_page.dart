import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/home_view_provider.dart';

class ReferPage extends StatelessWidget {
  const ReferPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Consumer<HomeViewProvider>(builder: (context, provider, child) {
        return SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              const Center(
                child: Text(
                  'Referral Section!',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Hey Investor Name,',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 28,
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    const Text(
                      'Refer to',
                      style: TextStyle(
                        fontSize: 24,
                      ),
                    ),
                    const SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(
                          Icons.share,
                          size: 80,
                        ),
                        Column(
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  'assets/images/facebook.jpeg',
                                  width: 60,
                                  height: 60,
                                ),
                                const SizedBox(width: 15),
                                Image.asset(
                                  'assets/images/twitter.png',
                                  width: 60,
                                  height: 60,
                                ),
                                const SizedBox(width: 15),
                                const Icon(
                                  Icons.email_rounded,
                                  size: 60,
                                ),
                              ],
                            ),
                            const SizedBox(height: 15),
                            Row(
                              children: [
                                Image.asset(
                                  'assets/images/whatsapp.jpeg',
                                  width: 60,
                                  height: 60,
                                ),
                                const SizedBox(width: 15),
                                Image.asset(
                                  'assets/images/insta.jpeg',
                                  width: 60,
                                  height: 60,
                                ),
                                const SizedBox(width: 15),
                                const Icon(
                                  Icons.sms_rounded,
                                  size: 60,
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              Container(
                margin: const EdgeInsets.all(20),
                width: double.infinity,
                height: 80,
                child: TextButton(
                  onPressed: () {
                    provider.onShare();
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.yellow[700],
                    primary: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: const Text(
                    'Click to share',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
