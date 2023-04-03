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

class PersonalPage extends StatefulWidget {
  const PersonalPage({Key? key}) : super(key: key);

  @override
  _PersonalPageState createState() => _PersonalPageState();
}

class _PersonalPageState extends State<PersonalPage> {
  final user = FirebaseAuth.instance.currentUser!;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  late User _user;
  late Stream<DocumentSnapshot> _userStream;
  @override
  void initState() {
    super.initState();
    // Fetch user's profile information from backend or local storage
    // and update the widget's state with that data
    _user = _auth.currentUser!;
    _userStream = _firestore
        .collection(_user.email! + '_Personal')
        .doc('user')
        .snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot>(
        stream: _userStream,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return CircularProgressIndicator();
          }
          var data = snapshot.data!.data()!;
          return Scaffold(
            appBar: AppBar(
              title: const Text('Profile'),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 80,
                    backgroundImage: NetworkImage(((snapshot.data!.data()
                        as Map<String, dynamic>)['image'])),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    (snapshot.data!.data() as Map<String, dynamic>)['name'],
                    style: const TextStyle(
                      fontSize: 34,
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
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PersonalPage1()));
                        // Implement logout functionality here
                      },
                      child: const Text(
                        'Edit Profile',
                        style: const TextStyle(fontSize: 20),
                      ),
                      style: ButtonStyle(
                          fixedSize:
                              MaterialStateProperty.all(Size(200.0, 50.0)))),
                ],
              ),
            ),
          );
        });
  }
}

class PersonalPage1 extends StatefulWidget {
  const PersonalPage1({Key? key}) : super(key: key);

  @override
  State<PersonalPage1> createState() => _PersonalPage1State();
}

class _PersonalPage1State extends State<PersonalPage1> {
  final user = FirebaseAuth.instance.currentUser!;
  TextEditingController _controllerName = TextEditingController();

  GlobalKey<FormState> key = GlobalKey();
  final store = FirebaseFirestore.instance;
  late final DocumentReference documentReference;

  void initState() {
    super.initState();
    documentReference = store.collection(user.email! + '_Personal').doc('user');
  }

  String imageUrl = '';
  String? id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: key,
          child: Column(
            children: [
              TextFormField(
                controller: _controllerName,
                decoration: const InputDecoration(
                  icon: Icon(Icons.person),
                  hintText: 'Enter the username of the item',
                  labelText: 'Username *',
                ),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the item name';
                  }

                  return null;
                },
              ),
              IconButton(
                  onPressed: () async {
                    ImagePicker imagePicker = ImagePicker();
                    XFile? file =
                        await imagePicker.pickImage(source: ImageSource.camera);
                    print('${file?.path}');

                    if (file == null) return;
                    //Import dart:core
                    String uniqueFileName =
                        DateTime.now().millisecondsSinceEpoch.toString();

                    Reference referenceRoot = FirebaseStorage.instance.ref();
                    Reference referenceDirImages =
                        referenceRoot.child('images');

                    Reference referenceImageToUpload =
                        referenceDirImages.child(user.email! + '_Personal');

                    try {
                      await referenceImageToUpload.putFile(File(file.path));

                      imageUrl = await referenceImageToUpload.getDownloadURL();
                    } catch (error) {}
                  },
                  icon: Icon(Icons.camera_alt)),
              buildSaveButton()
            ],
          ),
        ),
      ),
    );
  }

  ElevatedButton buildSaveButton() {
    return ElevatedButton(
        onPressed: () async {
          if (imageUrl.isEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Please upload an image')));

            return;
          }

          if (key.currentState!.validate() && id == null) {
            String itemName = _controllerName.text;

            Map<String, String> dataToSend = {
              'name': itemName,
              'image': imageUrl,
            };

            documentReference.set(dataToSend);

            Navigator.pushNamed(context, '/homepage');
          }
        },
        child: Text('Save'));
  }
}
