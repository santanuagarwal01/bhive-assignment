import 'package:bhive_assignment/services/home_view_provider.dart';
import 'package:bhive_assignment/services/route_generator.dart';
import 'package:bhive_assignment/services/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<HomeViewProvider>(builder: (context, provider, child) {
        return SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                const Center(
                  child: Text(
                    'Referral Section',
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
                    children: const [
                      Text(
                        'Hey Investor Name,',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 28,
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        'Why don\'t you introduce us to your friends ?\n\nInvite a friend to invest on BHive.fund and get a cashback equal to 1% of their investment.',
                        style: TextStyle(
                          fontSize: 24,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  margin: const EdgeInsets.all(20),
                  width: double.infinity,
                  height: 80,
                  child: TextButton(
                    onPressed: () {
                      GeneratedRoute.navigateTo(MyRoutes.referRoute);
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.yellow[700],
                      primary: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: const Text(
                      'Refer A Friend!',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(20),
                  width: double.infinity,
                  height: 80,
                  child: TextButton(
                    onPressed: () {
                      GeneratedRoute.navigateTo(MyRoutes.dashboardRoute);
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.yellow[700],
                      primary: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: const Text(
                      'Referral Dashboard',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
