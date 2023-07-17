import 'package:flutter/material.dart';
import 'package:flutter_navigation/views/NextPage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage();
  static String id = ' home';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final TextEditingController emailController = TextEditingController();
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/dart.jpg"), fit: BoxFit.fill)),
              child: Column(
                children: [],
              ),
            ),
          ),
          Expanded(
            child: Container(
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.person,
                      color: Color.fromARGB(255, 14, 131, 209),
                      size: 60,
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: TextFormField(
                        controller: emailController,
                        decoration: InputDecoration(
                            border: UnderlineInputBorder(),
                            hintText: 'Email',
                            hintStyle: TextStyle(color: Colors.grey)),
                        validator: (value) {
                          if (value!.contains("@")) {
                            return null;
                          } else {
                            return "Invaild email";
                          }
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(15),
                      child: TextFormField(
                        decoration: InputDecoration(
                            border: UnderlineInputBorder(),
                            hintText: 'Password',
                            hintStyle: TextStyle(color: Colors.grey)),
                        validator: (value) {
                          if (value!.length < 8) {
                            return "password should contain 8 characters or more";
                          }
                        },
                      ),
                    ),
                    SizedBox(
                      height: 30, // <-- SEE HERE
                    ),
                    InkWell(
                      onTap: () {},
                      child: FilledButton(
                          style: const ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll<Color>(
                                Color.fromARGB(255, 33, 142, 243)),
                            foregroundColor:
                                MaterialStatePropertyAll<Color>(Colors.white),
                          ),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              saveEmail(emailController.text);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => NextPage(
                                          email: emailController.text,
                                        )),
                              );
                            }
                          },
                          child: const Text('Log In',
                              style: TextStyle(fontSize: 20))),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  saveEmail(String email) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("email", email);
  }
}
