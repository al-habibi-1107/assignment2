import 'package:assignment2/controllers/register_state.dart';
import 'package:assignment2/models/user_model.dart';
import 'package:assignment2/pages/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  GlobalKey<FormState> _regKey = GlobalKey<FormState>();
  String? username;
  String? password;
  String? email;
  String? phone;
  String? profession;
  @override
  Widget build(BuildContext context) {
    var device = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 50, horizontal: 40),
        child: Form(
          key: _regKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
// USERNAME
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
                height: 30,
              ),
//EMAIL
              TextFormField(
                  validator: (value) {
                    if (value!.length <= 0) {
                      return "Email cannot be empty";
                    }
                  },
                  onSaved: (value) {
                    email = value!.trim();
                  },
                  decoration: InputDecoration(hintText: "Email")),
              SizedBox(
                height: 30,
              ),
// PASSWORD
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
                height: 30,
              ),
              TextFormField(
                validator: (value) {
                  if (value!.length <= 0) {
                    return "Phone No cannot be empty";
                  }
                },
                onSaved: (value) {
                  phone = value!.trim();
                },
                decoration: InputDecoration(hintText: "Phone No"),
              ),
              SizedBox(
                height: 30,
              ),
              DropdownButtonFormField<String>(
                  validator: (value) {
                    if (value == null) {
                      return "Please Select A Profession";
                    }
                  },
                  hint: Text("Profession"),
                  onChanged: (value) {
                    profession = value;
                  },
                  items: [
                    DropdownMenuItem(
                      child: Text("Businessman"),
                      value: "Businessman",
                    ),
                    DropdownMenuItem(
                      child: Text("Service"),
                      value: "Service",
                    ),
                    DropdownMenuItem(
                      child: Text("Self Employed"),
                      value: "SelfEmployed",
                    )
                  ]),
              SizedBox(
                height: 40,
              ),
              InkWell(
                onTap: () async {
                  if (_regKey.currentState!.validate()) {
                    _regKey.currentState!.save();
                    UserModel myUser =
                        UserModel(username, password, email, phone, profession);
                    await BlocProvider.of<RegisterCubit>(context)
                        .register(myUser)
                        .then((value) {
                      print("done");
                    });
                  }
                },
                child: Container(
                  height: 40,
                  width: device.width,
                  color: Colors.blueAccent,
                  child: Center(
                      child: Text(
                    "Register",
                    style: TextStyle(color: Colors.white),
                  )),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(LoginPage.routename);
                  },
                  child: Text("Go to Login"))
            ],
          ),
        ),
      ),
    );
  }
}
