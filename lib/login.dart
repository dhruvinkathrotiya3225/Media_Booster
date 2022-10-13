import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'global.dart';

void main() async {
  runApp(
    MaterialApp(
      home: login(),
    ),
  );
}

class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  GlobalKey<FormState> formloginkey = GlobalKey();
  TextEditingController namelogincontroller = TextEditingController();
  TextEditingController passwordlogincontroler = TextEditingController();
  bool ischeaked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("login"),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                await prefs.remove("isreg");
                Navigator.of(context)
                    .pushNamedAndRemoveUntil("/", (route) => false);
              },
              icon: Icon(Icons.report_gmailerrorred_sharp))
        ],
      ),
      body: Form(
        key: formloginkey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Login",
                style: TextStyle(
                  fontSize: 23,
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: namelogincontroller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter Your name",
                  label: Text("Name"),
                ),
                validator: (val) {
                  if (val!.isEmpty) {
                    return "please enter your name";
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: passwordlogincontroler,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter Your Password",
                  label: Text("Password"),
                ),
                validator: (val) {
                  if (val!.isEmpty) {
                    return "Please enter your password";
                  }
                  return null;
                },
              ),
              Row(
                children: [
                  Checkbox(
                      value: ischeaked,
                      onChanged: (val) {
                        setState(() {
                          ischeaked = val!;
                        });
                      }),
                  SizedBox(width: 20),
                  Text("Remember Me")
                ],
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  global.loginame = namelogincontroller.text;
                  global.loginpassword = passwordlogincontroler.text;
                  if (global.loginame == global.name &&
                      global.loginpassword == global.password) {
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    prefs.setBool("islogin", true);
                    Navigator.of(context)
                        .pushNamedAndRemoveUntil("dashboard", (route) => false);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Invalid info..."),
                        backgroundColor: Colors.redAccent,
                        behavior: SnackBarBehavior.floating,
                      ),
                    );
                  }
                },
                child: Text("Login"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
