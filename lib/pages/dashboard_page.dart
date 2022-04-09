import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> users =
        FirebaseFirestore.instance.collection('users').snapshots();

    final String uid = FirebaseAuth.instance.currentUser!.uid;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              const Center(
                child: Text(
                  'Referral Dashboard',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Your Rewards',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 28,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Total Cash Earned!\n\n#######',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Image.asset(
                          'assets/images/trophy.png',
                          height: 80,
                          width: 80,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Divider(
                thickness: 2.0,
                color: Colors.black,
              ),
              const Text(
                '  View Payment History >',
                style: TextStyle(fontSize: 20),
              ),
              const Divider(
                thickness: 2.0,
                color: Colors.black,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text(
                    'Your Referrals',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: Colors.yellow[700],
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: const Text('Remind All Pending'),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  Text(
                    'Name',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Reward Status',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Investment Status',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const Divider(
                thickness: 2.0,
                color: Colors.black,
              ),
              Container(
                  height: 200,
                  child: StreamBuilder<QuerySnapshot>(
                    stream: users,
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.hasError) {
                        return const Center(
                            child: Text("Something went wrong."));
                      }
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: Text('Loading...'));
                      }

                      final data = snapshot.requireData;
                      return ListView.builder(
                        shrinkWrap: true,
                        itemCount: data.size,
                        itemBuilder: (context, index) {
                          if (data.docs[index]['referral'].toString() == uid) {
                            return Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text('${data.docs[index]['name']}'),
                                    const Text('\t 10000'),
                                    const Text('\t\tRBF-Myntra'),
                                  ],
                                ),
                                const Divider(
                                    thickness: 2.0, color: Colors.black),
                              ],
                            );
                          }
                          return Container();
                        },
                      );
                    },
                  )),
              Container(
                margin: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'FAQ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'What are the incentives for the referring a friend?',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey[600],
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Is there any eligibility criteria for me to send to out invites?',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey[600],
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'When will I get my referral bonus?',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey[600],
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Where will I receive this bonus?',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey[600],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
