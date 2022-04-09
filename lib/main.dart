import 'package:bhive_assignment/services/get_it.dart';
import 'package:bhive_assignment/services/home_view_provider.dart';
import 'package:bhive_assignment/services/route_generator.dart';
import 'package:bhive_assignment/services/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  setupGetIt();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: HomeViewProvider(context),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        // initialRoute: '/',
        // routes: {
        //   '/': (context) => const SignUpPage(),
        //   MyRoutes.loginRoute: (context) => const LoginPage(),
        //   MyRoutes.homeRoute: (context) => const HomePage(),
        //   MyRoutes.referRoute: (context) => const ReferPage(),
        //   MyRoutes.dashboardRoute: (context) => const DashboardPage(),
        //   MyRoutes.signupRoute: (context) => const SignUpPage(),
        // },
        navigatorKey: GeneratedRoute.navigatorKey,
        initialRoute: MyRoutes.signupRoute,
        onGenerateRoute: GeneratedRoute.onGenerate,
      ),
    );
  }
}

// class MainPage extends StatelessWidget {
//   const MainPage({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: StreamBuilder<User?>(
//         stream: FirebaseAuth.instance.authStateChanges(),
//         builder: (context, snapshot) {
//           if (snapshot.hasData) {
//             return HomePage();
//           } else {
//             return LoginPage();
//           }
//         },
//       ),
//     );
//   }
// }
