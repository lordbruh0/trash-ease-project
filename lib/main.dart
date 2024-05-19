import 'package:flutter/material.dart';
import 'package:trash_rase/Akun.dart';
import 'package:trash_rase/Data.dart';
import 'package:trash_rase/Home.dart';
import 'package:trash_rase/notif.dart';

Future<void> main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RootPage(),
    );
  }
}

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int currentPage = 0;
  List<Widget> pages = [Data(), Home(), Akun()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   backgroundColor: Colors.white,
        //   title: Text(
        //     "Welcome Home Admin! ",
        //     style: TextStyle(color: Colors.black),
        //   ),
        //   actions: [
        //     IconButton(
        //       icon: Icon(Icons.notifications_outlined),
        //       color: Colors.black,
        //       onPressed: () {
        //         Navigator.push(
        //           context,
        //           MaterialPageRoute(builder: (context) => Notif()),
        //         );
        //       },
        //     ),
        //   ],
        // ),
        body: pages[currentPage], // Use currentPage to switch between pages
        bottomNavigationBar: NavigationBarTheme(
          data: NavigationBarThemeData(
            indicatorColor: Colors.green.shade50,
            backgroundColor: Colors.white,
            labelTextStyle: const MaterialStatePropertyAll(
                TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
          ),
          child: NavigationBar(
              height: 60,
              backgroundColor: Colors.white,
              labelBehavior:
                  NavigationDestinationLabelBehavior.onlyShowSelected,
              selectedIndex: currentPage,
              animationDuration: Duration(seconds: 1),
              onDestinationSelected: (indxe) =>
                  setState(() => this.currentPage = indxe),
              destinations: const [
                NavigationDestination(
                  icon: Icon(
                    Icons.window_outlined,
                    color: Colors.black54,
                  ),
                  selectedIcon: Icon(Icons.window),
                  label: "Data",
                ),
                NavigationDestination(
                  icon: Icon(
                    Icons.home_outlined,
                    color: Colors.black54,
                  ),
                  selectedIcon: Icon(Icons.home),
                  label: "Home",
                ),
                NavigationDestination(
                  icon: Icon(
                    Icons.person_outline,
                    color: Colors.black54,
                  ),
                  selectedIcon: Icon(Icons.person),
                  label: "Acount",
                )
              ]),
        ));
  }
}
