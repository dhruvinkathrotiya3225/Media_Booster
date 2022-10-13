import 'package:flutter/material.dart';
import 'package:reg_and_login/dashboard.dart';
import 'package:reg_and_login/global.dart';
import 'package:reg_and_login/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();

  bool? isreg = prefs.getBool("isreg") ?? false;
  bool? islogin = prefs.getBool("islogin") ?? false;

  await prefs.setBool("isreg", isreg);
  await prefs.setBool("islogin", islogin);

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: (isreg == false)
          ? "/"
          : (islogin == false)
              ? "login"
              : "dashboard",
      routes: {
        "/": (context) => homepage(),
        "login": (context) => login(),
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
  GlobalKey<FormState> formkey = GlobalKey();
  TextEditingController namecontroller = TextEditingController();
  TextEditingController passwordcontroler = TextEditingController();
  TextEditingController conformpasswordcontroler = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Regester"),
        centerTitle: true,
      ),
      body: Form(
        key: formkey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Regester",
                style: TextStyle(
                  fontSize: 23,
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: namecontroller,
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
                onSaved: (val) {
                  setState(() {
                    global.name = val!;
                  });
                },
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: passwordcontroler,
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
                onSaved: (val) {
                  setState(() {
                    global.password = val!;
                  });
                },
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: conformpasswordcontroler,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Conform password",
                  label: Text("conform password"),
                ),
                validator: (val) {
                  if (val!.isEmpty) {
                    return "Please enter your conforim password";
                  }
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  global.name = namecontroller.text;
                  global.password = passwordcontroler.text;
                  global.conformpassword = conformpasswordcontroler.text;
                  if (formkey.currentState!.validate()) {
                    formkey.currentState!.save();
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    await prefs.setBool("isreg", true);

                    Navigator.of(context)
                        .pushNamedAndRemoveUntil("login", (route) => false);
                  } else {
                    print("faild");
                  }
                  print(global.name);
                  print(global.password);
                  print(global.conformpassword);
                },
                child: Text("regester"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
