import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:miniproject/repass.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final _formstate = GlobalKey<FormState>();
  String? email;
  String? password;
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:
              const Text("Visual Movie", style: TextStyle(color: Colors.white)),
        ),
        body: Form(
          autovalidateMode: AutovalidateMode.always,
          key: _formstate,
          child: ListView(
            children: <Widget>[
              const SizedBox(height: 30),
              Image.network(
                'https://media.discordapp.net/attachments/1047009026396913664/1089283377502376117/image_asd.png',
                height: 200,
                width: 200,
              ),
              const SizedBox(height: 10),
              emailTextFormField(),
              passwordTextFormField(),
              loginButton(),
              registerButton(context),
              forgotpassword(),
            ],
          ),
        ));
  }

  ElevatedButton forgotpassword() {
    return ElevatedButton(
      child: Text('Forgot Password'),
      onPressed: () {
        Navigator.pushNamed(context, '/forgotpassword');
      },
    );
  }

  ElevatedButton registerButton(BuildContext context) {
    return ElevatedButton(
      // ignore: prefer_const_constructors
      child: Text('Register new account'),
      onPressed: () {
        print('Goto  Regis pagge');
        Navigator.pushNamed(context, '/register');
      },
    );
  }

  ElevatedButton loginButton() {
    return ElevatedButton(
        child: Text('Login'),
        onPressed: () async {
          if (_formstate.currentState!.validate()) {
            print('Valid Form');
            _formstate.currentState!.save();
            try {
              await auth
                  .signInWithEmailAndPassword(
                      email: email!, password: password!)
                  .then((value) {
                if (value.user!.emailVerified) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Login Pass")));
                  print('Goto  Home pagge');
                  Navigator.pushNamed(context, '/homepage');
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Please verify email")));
                }
              }).catchError((reason) {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Login or Password Invalid")));
              });
            } on FirebaseAuthException catch (e) {
              if (e.code == 'user-not-found') {
                print('No user found for that email.');
              } else if (e.code == 'wrong-password') {
                print('Wrong password provided for that user.');
              }
            }
          } else
            print('Invalid Form');
        });
  }

  TextFormField passwordTextFormField() {
    return TextFormField(
      onSaved: (value) {
        password = value!.trim();
      },
      validator: (value) {
        if (value!.length < 8)
          return 'Please Enter more than 8 Character';
        else
          return null;
      },
      obscureText: true,
      keyboardType: TextInputType.text,
      decoration: const InputDecoration(
        labelText: 'Password',
        icon: Icon(Icons.lock),
      ),
    );
  }

  TextFormField emailTextFormField() {
    return TextFormField(
      onSaved: (value) {
        email = value!.trim();
      },
      validator: (value) {
        if (!validateEmail(value!))
          return 'Please fill in E-mail field';
        else
          return null;
      },
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      decoration: const InputDecoration(
        labelText: 'E-mail',
        icon: Icon(Icons.email),
        hintText: 'x@x.com',
      ),
    );
  }

  bool validateEmail(String value) {
    RegExp regex = RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');

    return (!regex.hasMatch(value)) ? false : true;
  }
}
