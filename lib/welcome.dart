import 'package:flutter/material.dart';
import 'dart:io';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:intl/intl.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';

class LoginNewBPage extends StatefulWidget {
  const LoginNewBPage({Key? key}) : super(key: key);

  @override
  LoginNewBPageState createState() => LoginNewBPageState();
}

class LoginNewBPageState extends State<LoginNewBPage> {
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
            ],
          ),
        ));
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
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => welcomePage()));
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

class welcomePage extends StatefulWidget {
  const welcomePage({Key? key}) : super(key: key);

  @override
  welcomePageState createState() => welcomePageState();
}

class welcomePageState extends State<welcomePage> {
  final user = FirebaseAuth.instance.currentUser!;
  TextEditingController _controllerName = TextEditingController();

  GlobalKey<FormState> key = GlobalKey();
  final store = FirebaseFirestore.instance;
  late final DocumentReference documentReference;
  @override
  void initState() {
    super.initState();
    documentReference = store.collection(user.email! + '_Personal').doc('user');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_back,
              color: Color.fromARGB(0, 233, 30, 98)),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome',
              style: const TextStyle(
                fontSize: 55,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text('',
                style: const TextStyle(
                  fontSize: 30,
                )),
            CircleAvatar(
              radius: 120,
              backgroundImage: NetworkImage(
                'https://media.discordapp.net/attachments/1047009026396913664/1089283377502376117/image_asd.png',
              ),
            ),
            Text('',
                style: const TextStyle(
                  fontSize: 35,
                )),
            Text(
              'Visual Movie',
              style: const TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              user.email!,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                Map<String, String> dataToSend = {
                  'name': 'Visual Movie',
                  'image':
                      'https://media.discordapp.net/attachments/1047009026396913664/1089283377502376117/image_asd.png',
                };

                documentReference.set(dataToSend);

                Navigator.pushNamed(context, '/homepage');
              },
              child: const Text('Next'),
              style: ButtonStyle(
                fixedSize: MaterialStateProperty.all(Size(200.0, 50.0)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
