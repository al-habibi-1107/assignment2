import 'package:assignment2/controllers/login_state.dart';
import 'package:assignment2/pages/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  static const routename = "/login";
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey<FormState> _loginKey = GlobalKey<FormState>();
  String? username;
  String? password;
  @override
  Widget build(BuildContext context) {
    var device = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 50, horizontal: 40),
        child: Form(
          key: _loginKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                  validator: (value) {
                    if (value!.length <= 0) {
                      return "Username cannot be empty";
                    }
                  },
                  onSaved: (value) {
                    username = value!.trim();
                  },
                  decoration: InputDecoration(hintText: "Username")),
              SizedBox(
                height: 40,
              ),
              TextFormField(
                  validator: (value) {
                    if (value!.length <= 0) {
                      return "Password cannot be empty";
                    }
                  },
                  onSaved: (value) {
                    password = value!.trim();
                  },
                  decoration: InputDecoration(hintText: "Password")),
              SizedBox(
                height: 40,
              ),
              InkWell(
                onTap: () async {
                  if (_loginKey.currentState!.validate()) {
                    _loginKey.currentState!.save();

                    bool result = await BlocProvider.of<LoginCubit>(context)
                        .login(username!, password);
                    if (result == true) {
                      Navigator.of(context)
                          .pushReplacementNamed(HomePage.routename);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Invalid Credentials")));
                    }
                  }
                },
                child: Container(
                  height: 40,
                  width: device.width,
                  color: Colors.blueAccent,
                  child: Center(
                      child: Text(
                    "Login",
                    style: TextStyle(color: Colors.white),
                  )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
