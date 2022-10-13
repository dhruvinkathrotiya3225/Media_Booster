import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'dashboard.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool? isvisible = prefs.getBool("isvisible") ?? false;

  await prefs.setBool("isvisible", isvisible);
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: (isvisible == false) ? "/" : "dashboard",
      routes: {
        "/": (context) => homepage(),
        "dashboard": (context) => dashboard(),
      },
    ),
  );
}

class homepage extends StatefulWidget {
  const homepage({Key? key}) : super(key: key);

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  int currentindex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Spalsh Screen"),
        centerTitle: true,
      ),
      body: IndexedStack(
        index: currentindex,
        children: [
          Container(
            alignment: Alignment.center,
            child: Container(
              height: 400,
              width: 200,
              color: Colors.grey,
              child: Column(
                children: [
                  SizedBox(height: 40),
                  Text(
                    "step 1",
                    style: TextStyle(color: Colors.white, fontSize: 23),
                  ),
                  SizedBox(height: 50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                          onPressed: () async {
                            SharedPreferences prefs =
                                await SharedPreferences.getInstance();

                            await prefs.setBool("isvisible", true);
                            Navigator.of(context)
                                .pushReplacementNamed("dashboard");
                          },
                          child: Text("Skip")),
                      ElevatedButton(
                          onPressed: () {
                            setState(() {
                              currentindex++;
                            });
                          },
                          child: Text("Next"))
                    ],
                  ),
                ],
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: Container(
              height: 400,
              width: 200,
              color: Colors.grey,
              child: Column(
                children: [
                  SizedBox(height: 40),
                  Text(
                    "step 2",
                    style: TextStyle(color: Colors.white, fontSize: 23),
                  ),
                  SizedBox(height: 50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                          onPressed: () async {
                            SharedPreferences prefs =
                                await SharedPreferences.getInstance();

                            await prefs.setBool("isvisible", true);
                            Navigator.of(context)
                                .pushReplacementNamed("dashboard");
                          },
                          child: Text("Skip")),
                      ElevatedButton(
                          onPressed: () {
                            setState(() {
                              currentindex++;
                            });
                          },
                          child: Text("Next"))
                    ],
                  ),
                ],
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: Container(
              height: 400,
              width: 200,
              color: Colors.grey,
              child: Column(
                children: [
                  SizedBox(height: 40),
                  Text(
                    "step 3",
                    style: TextStyle(color: Colors.white, fontSize: 23),
                  ),
                  SizedBox(height: 50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                          onPressed: () async {
                            SharedPreferences prefs =
                                await SharedPreferences.getInstance();

                            await prefs.setBool("isvisible", true);
                            Navigator.of(context)
                                .pushReplacementNamed("dashboard");
                          },
                          child: Text("Skip")),
                      ElevatedButton(
                          onPressed: () {
                            setState(() {
                              currentindex++;
                            });
                          },
                          child: Text("Next"))
                    ],
                  ),
                ],
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: Container(
              height: 400,
              width: 200,
              color: Colors.grey,
              child: Column(
                children: [
                  SizedBox(height: 40),
                  Text(
                    "step 4",
                    style: TextStyle(color: Colors.white, fontSize: 23),
                  ),
                  SizedBox(height: 50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                          onPressed: () async {
                            SharedPreferences prefs =
                                await SharedPreferences.getInstance();

                            await prefs.setBool("isvisible", true);
                            Navigator.of(context)
                                .pushReplacementNamed("dashboard");
                          },
                          child: Text("Skip")),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pushNamed("dashboard");
                          },
                          child: Text("Next"))
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
