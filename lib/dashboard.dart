import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: dashboard(),
    ),
  );
}

class dashboard extends StatefulWidget {
  const dashboard({Key? key}) : super(key: key);

  @override
  State<dashboard> createState() => _dashboardState();
}

class _dashboardState extends State<dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("dashboad"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () async {
              SharedPreferences prefs = await SharedPreferences.getInstance();

              await prefs.setBool("isvisible", false);
              Navigator.of(context)
                  .pushNamedAndRemoveUntil("/", (route) => false);
              // Navigator.of(context).pushReplacementNamed("dashboard");
            },
            icon: Icon(Icons.logout_outlined),
          ),
        ],
      ),
    );
  }
}
