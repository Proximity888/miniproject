import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:miniproject/login.dart';

import 'package:miniproject/Movie/action.dart';
import 'package:miniproject/Movie/adventure.dart';
import 'package:miniproject/Movie/comedy.dart';
import 'package:miniproject/Movie/animation.dart';
import 'package:miniproject/Movie/biography.dart';
import 'package:miniproject/Movie/crime.dart';
import 'package:miniproject/Movie/documentary.dart';
import 'package:miniproject/Movie/drama.dart';
import 'package:miniproject/Movie/family.dart';
import 'package:miniproject/Movie/fantasy.dart';
import 'package:miniproject/Movie/horror.dart';
import 'package:miniproject/Movie/musical.dart';
import 'package:miniproject/Movie/mystery.dart';
import 'package:miniproject/Movie/romance.dart';
import 'package:miniproject/Movie/sci_fipage.dart';
import 'package:miniproject/Movie/sport.dart';
import 'package:miniproject/Movie/thriller.dart';
import 'package:miniproject/Movie/war.dart';
import 'package:miniproject/Movie/western.dart';

class Thrillerpage extends StatefulWidget {
  const Thrillerpage({Key? key}) : super(key: key);
  @override
  _ThrillerpageState createState() => _ThrillerpageState();
}

class _ThrillerpageState extends State<Thrillerpage> {
  final List<Map<String, String>> movies = [
    {
      'title': 'Son (2021) เด็กผวา',
      'description':
          'เมื่อเด็กชายคนหนึ่งป่วยด้วยโรคลึกลับ แม่ของเขาต้องตัดสินใจว่าจะปกป้องเขาจากความน่ากลัวในอดีตได้ไกลแค่ไหน',
      'image':
          'https://mv-hd.com/wp-content/uploads/2023/03/fbf37dd183836a93cedf72080c214af8.jpg',
    },
    {
      'title': 'The Lightless Door (2021)',
      'description':
          'หลังจากเกิดเหตุการณ์สังหารหมู่ปีค.ศ.1990แล้ว เรื่องราวสยองขวัญของผู้อำนวยการสถาบันวิจัยจิตวิทยาที่มีเลือดของพ่อมดและนักศึกษาวิทยาลัยที่อยากรู้อยากเห็นได้ก้าวเข้าไปในพระธาตุบำเพ็ญเพียรผีสิงที่ถูกเอาปิดไว้',
      'image':
          'https://mv-hd.com/wp-content/uploads/2023/03/8b7e270a5db17b08c1a01721aee6df3c.jpg',
    },
    {
      'title': 'V/S/H94 (2021) เทปลับ… เขย่าอเวจี',
      'description':
          'ตำรวจส.ว.ท. ทีมสืบสาวเกี่ยวกับเทปวีเอชเอสลึกลับรวมทั้งศึกษาและทำการค้นพบลัทธิที่น่าสยดสยองซึ่งมีรายละเอียดที่บันทึกไว้ล่วงหน้าซึ่งเผยให้เห็นแนวทางสมรู้ร่วมคิดที่น่าหวาดกลัว',
      'image':
          'https://mv-hd.com/wp-content/uploads/2023/03/b0e633bbd62294c3fb2833cdbbb628fa.jpg',
    },
    {
      'title': 'Project Gemini (2022)',
      'description':
          'หนังไซไฟระทึกขวัญเกี่ยวกับภารกิจอวกาศที่ส่งไปสร้างภูมิประเทศของดาวเคราะห์ที่ห่างไกล อย่างไรก็ตาม ภารกิจได้พบกับบางสิ่งที่ไม่รู้จักซึ่งมีแผนที่เป็นของตัวเองสำหรับโลก',
      'image':
          'https://mv-hd.com/wp-content/uploads/2023/03/f90e760cf498ae2a8d915c684d0fd2e7.jpg',
    },
    // ... add more movies here
  ];

  final user = FirebaseAuth.instance.currentUser!;
  //----------------------------แก้ใหม่1----------------------------
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  late User _user;
  late Stream<DocumentSnapshot> _userStream;
  @override
  void initState() {
    super.initState();
    _user = _auth.currentUser!;
    _userStream = _firestore
        .collection(_user.email! + '_Personal')
        .doc('user')
        .snapshots();
  }

//----------------------------แก้ใหม่1----------------------------
  @override
  Widget build(BuildContext context) {
    //----------------------------แก้ใหม่----------------------------
    return StreamBuilder<DocumentSnapshot>(
        stream: _userStream,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return CircularProgressIndicator();
          }
          var data = snapshot.data!.data()!;
          return Scaffold(
              appBar: AppBar(
                title: const Text("ระทึกขวัญ Thriller",
                    style: TextStyle(color: Colors.white)),
                actions: <Widget>[
                  IconButton(
                      onPressed: () {
                        FirebaseAuth.instance.signOut();
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => LoginPage()),
                          (Route<dynamic> route) => false,
                        );
                      },
                      icon: const Icon(Icons.exit_to_app))
                ],
              ),
              drawer: Drawer(
                  child: Drawer(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: <Widget>[
                    //----------------------------แก้ใหม่1----------------------------
                    UserAccountsDrawerHeader(
                      accountName: Text((snapshot.data!.data()
                          as Map<String, dynamic>)['name']),
                      accountEmail: Text(user.email!),
                      currentAccountPicture: CircleAvatar(
                        backgroundImage: NetworkImage(((snapshot.data!.data()
                            as Map<String, dynamic>)['image'])),
                        child: IconButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/personal');
                          },
                          icon: Icon(Icons.upgrade,
                              color: Color.fromARGB(0, 255, 235, 59)),
                        ),
                      ),
                    ),
                    //----------------------------แก้ใหม่1----------------------------
                    ListTile(
                        title: Text('NEW MOVIE'),
                        onTap: () {
                          Navigator.pushNamed(context, '/homepage');
                        }),
                    ListTile(
                        title: Text('หนังแอคชั่น Action'),
                        onTap: () {
                          Navigator.pushNamed(context, '/action');
                        }),
                    ListTile(
                        title: Text('หนังผจญภัย Adventure'),
                        onTap: () {
                          Navigator.pushNamed(context, '/adventure');
                        }),
                    ListTile(
                        title: Text('หนังตลก Comedy'),
                        onTap: () {
                          Navigator.pushNamed(context, '/comedy');
                        }),
                    ListTile(
                        title: Text('แอนนิเมชั่น Animation'),
                        onTap: () {
                          Navigator.pushNamed(context, '/animation');
                        }),
                    ListTile(
                        title: Text('ชีวิตจริง Biography'),
                        onTap: () {
                          Navigator.pushNamed(context, '/biography');
                        }),
                    ListTile(
                        title: Text('อาชญากรรม Crime'),
                        onTap: () {
                          Navigator.pushNamed(context, '/crime');
                        }),
                    ListTile(
                        title: Text('สารคดี Documentary'),
                        onTap: () {
                          Navigator.pushNamed(context, '/documentary');
                        }),
                    ListTile(
                        title: Text('หนังดราม่า Drama'),
                        onTap: () {
                          Navigator.pushNamed(context, '/drama');
                        }),
                    ListTile(
                        title: Text('ครอบครัว Family'),
                        onTap: () {
                          Navigator.pushNamed(context, '/family');
                        }),
                    ListTile(
                        title: Text('แฟนตาซี Fantasy'),
                        onTap: () {
                          Navigator.pushNamed(context, '/fantasy');
                        }),
                    ListTile(
                        title: Text('หนังสยองขวัญ Horror'),
                        onTap: () {
                          Navigator.pushNamed(context, '/horror');
                        }),
                    ListTile(
                        title: Text('เพลงดนตรี Musical'),
                        onTap: () {
                          Navigator.pushNamed(context, '/musical');
                        }),
                    ListTile(
                        title: Text('ลึกลับซ่อนเงื่อน Mystery'),
                        onTap: () {
                          Navigator.pushNamed(context, '/mystery');
                        }),
                    ListTile(
                        title: Text('โรแมนติก Romance'),
                        onTap: () {
                          Navigator.pushNamed(context, '/romance');
                        }),
                    ListTile(
                        title: Text('วิทยาศาสตร์ Sci-fi'),
                        onTap: () {
                          Navigator.pushNamed(context, '/sci-fi');
                        }),
                    ListTile(
                        title: Text('กีฬา Sport'),
                        onTap: () {
                          Navigator.pushNamed(context, '/sport');
                        }),
                    ListTile(
                        title: Text('ระทึกขวัญ Thriller'),
                        onTap: () {
                          Navigator.pushNamed(context, '/thriller');
                        }),
                    ListTile(
                        title: Text('สงคราม War'),
                        onTap: () {
                          Navigator.pushNamed(context, '/war');
                        }),
                    ListTile(
                      title: Text('คาวบอย Western'),
                      onTap: () {
                        Navigator.pushNamed(context, '/western');
                      },
                    ),
                  ],
                ),
              )),
              body: ListView(padding: EdgeInsets.zero, children: <Widget>[
                ListTile(
                  leading: Image.network(movies[0]['image']!),
                  title: Text(
                    'NEW ' + movies[0]['title']!,
                    style: TextStyle(color: Colors.red),
                  ),
                  subtitle: Row(children: const <Widget>[
                    Text('VSM 8.2', style: TextStyle(color: Colors.black)),
                    const Icon(Icons.star, color: Colors.yellow),
                  ]),
                  trailing: IconButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => AddPage1()));
                    },
                    icon: const Icon(Icons.favorite, color: Colors.pink),
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, '/Son');
                  },
                ),
                ListTile(
                  leading: Image.network(movies[1]['image']!),
                  title: Text(
                    movies[1]['title']!,
                    style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                  ),
                  subtitle: Row(children: const <Widget>[
                    Text('VSM 5.7', style: TextStyle(color: Colors.black)),
                    const Icon(Icons.star, color: Colors.yellow),
                  ]),
                  trailing: IconButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => AddPage2()));
                    },
                    icon: const Icon(Icons.favorite, color: Colors.pink),
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, '/The_Lightless_Door');
                  },
                ),
                ListTile(
                  leading: Image.network(movies[2]['image']!),
                  title: Text(
                    movies[2]['title']!,
                    style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                  ),
                  subtitle: Row(children: const <Widget>[
                    Text('VSM 6.4', style: TextStyle(color: Colors.black)),
                    const Icon(Icons.star, color: Colors.yellow),
                  ]),
                  trailing: IconButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => AddPage3()));
                    },
                    icon: const Icon(Icons.favorite, color: Colors.pink),
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, '/V_S_H');
                  },
                ),
                ListTile(
                  leading: Image.network(movies[3]['image']!),
                  title: Text(
                    movies[3]['title']!,
                    style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                  ),
                  subtitle: Row(children: const <Widget>[
                    Text('VSM 6.7', style: TextStyle(color: Colors.black)),
                    const Icon(Icons.star, color: Colors.yellow),
                  ]),
                  trailing: IconButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => AddPage4()));
                    },
                    icon: const Icon(Icons.favorite, color: Colors.pink),
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, '/Project_Gemini');
                  },
//----------------------------แก้ใหม่1----------------------------
                ),
              ]));
        });
  }
}
//----------------------------แก้ใหม่1----------------------------

class AddPage1 extends StatefulWidget {
  const AddPage1({Key? key}) : super(key: key);
  @override
  State createState() => _AddPage1State();
}

class _AddPage1State extends State<AddPage1> {
  final _form = GlobalKey<FormState>();
  final _title = TextEditingController();
  final _detail = TextEditingController();
  final _imageURL = TextEditingController();
  final store = FirebaseFirestore.instance;
  @override
  final List<Map<String, String>> movies = [
    {
      'title': 'Son (2021) เด็กผวา',
      'description': 'เมื่อเด็กชายคนหนึ่งป่วยด้วยโรคลึกลับ...',
      'image':
          'https://mv-hd.com/wp-content/uploads/2023/03/fbf37dd183836a93cedf72080c214af8.jpg',
    },
    {
      'title': 'The Lightless Door (2021)',
      'description':
          'หลังจากเกิดเหตุการณ์สังหารหมู่ปีค.ศ.1990แล้ว เรื่องราวสยองขวัญของผู้อำนวยการสถาบันวิจัยจิตวิทยาที่มีเลือดของพ่อมดและนักศึกษาวิทยาลัยที่อยากรู้อยากเห็นได้ก้าวเข้าไปในพระธาตุบำเพ็ญเพียรผีสิงที่ถูกเอาปิดไว้',
      'image':
          'https://mv-hd.com/wp-content/uploads/2023/03/8b7e270a5db17b08c1a01721aee6df3c.jpg',
    },
    {
      'title': 'V/S/H94 (2021) เทปลับ… เขย่าอเวจี',
      'description':
          'ตำรวจส.ว.ท. ทีมสืบสาวเกี่ยวกับเทปวีเอชเอสลึกลับรวมทั้งศึกษาและทำการค้นพบลัทธิที่น่าสยดสยองซึ่งมีรายละเอียดที่บันทึกไว้ล่วงหน้าซึ่งเผยให้เห็นแนวทางสมรู้ร่วมคิดที่น่าหวาดกลัว',
      'image':
          'https://mv-hd.com/wp-content/uploads/2023/03/b0e633bbd62294c3fb2833cdbbb628fa.jpg',
    },
    {
      'title': 'Project Gemini (2022)',
      'description':
          'หนังไซไฟระทึกขวัญเกี่ยวกับภารกิจอวกาศที่ส่งไปสร้างภูมิประเทศของดาวเคราะห์ที่ห่างไกล อย่างไรก็ตาม ภารกิจได้พบกับบางสิ่งที่ไม่รู้จักซึ่งมีแผนที่เป็นของตัวเองสำหรับโลก',
      'image':
          'https://mv-hd.com/wp-content/uploads/2023/03/f90e760cf498ae2a8d915c684d0fd2e7.jpg',
    },
    // ... add more movies here
  ];
  final user = FirebaseAuth.instance.currentUser!;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Movie to Favorites'),
      ),
      body: Form(
        key: _form,
        child: ListView(
          children: <Widget>[
            ListTile(
              leading: Image.network(movies[0]['image']!),
              title: Text(movies[0]['title']!),
              subtitle: Text(movies[0]['description']!),
            ),
            buildSaveButton()
          ],
        ),
      ),
    );
  }

  ElevatedButton buildSaveButton() {
    return ElevatedButton(
        child: const Text('Add to Favorites'),
        onPressed: () async {
          if (_form.currentState!.validate()) {
            print('save button press');
            Map<String, dynamic> data = {
              'title': movies[0]['title']!,
              'detail': movies[0]['description']!,
              'image': movies[0]['image']!
            };
            try {
              DocumentReference ref =
                  await store.collection(user.email!).add(data);
              print('save id = ${ref.id}');
              Navigator.pop(context);
            } catch (e) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Error $e'),
                ),
              );
            }
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Please validate value'),
              ),
            );
          }
        });
  }
}

class AddPage2 extends StatefulWidget {
  const AddPage2({Key? key}) : super(key: key);
  @override
  State createState() => _AddPage2State();
}

class _AddPage2State extends State<AddPage2> {
  final _form = GlobalKey<FormState>();
  final _title = TextEditingController();
  final _detail = TextEditingController();
  final _imageURL = TextEditingController();
  final store = FirebaseFirestore.instance;
  @override
  final List<Map<String, String>> movies = [
    {
      'title': 'Son (2021) เด็กผวา',
      'description':
          'เมื่อเด็กชายคนหนึ่งป่วยด้วยโรคลึกลับ แม่ของเขาต้องตัดสินใจว่าจะปกป้องเขาจากความน่ากลัวในอดีตได้ไกลแค่ไหน',
      'image':
          'https://mv-hd.com/wp-content/uploads/2023/03/fbf37dd183836a93cedf72080c214af8.jpg',
    },
    {
      'title': 'The Lightless Door (2021)',
      'description': 'หลังจากเกิดเหตุการณ์สังหารหมู่ปีค.ศ.1990แล้ว...',
      'image':
          'https://mv-hd.com/wp-content/uploads/2023/03/8b7e270a5db17b08c1a01721aee6df3c.jpg',
    },
    {
      'title': 'V/S/H94 (2021) เทปลับ… เขย่าอเวจี',
      'description':
          'ตำรวจส.ว.ท. ทีมสืบสาวเกี่ยวกับเทปวีเอชเอสลึกลับรวมทั้งศึกษาและทำการค้นพบลัทธิที่น่าสยดสยองซึ่งมีรายละเอียดที่บันทึกไว้ล่วงหน้าซึ่งเผยให้เห็นแนวทางสมรู้ร่วมคิดที่น่าหวาดกลัว',
      'image':
          'https://mv-hd.com/wp-content/uploads/2023/03/b0e633bbd62294c3fb2833cdbbb628fa.jpg',
    },
    {
      'title': 'Project Gemini (2022)',
      'description':
          'หนังไซไฟระทึกขวัญเกี่ยวกับภารกิจอวกาศที่ส่งไปสร้างภูมิประเทศของดาวเคราะห์ที่ห่างไกล อย่างไรก็ตาม ภารกิจได้พบกับบางสิ่งที่ไม่รู้จักซึ่งมีแผนที่เป็นของตัวเองสำหรับโลก',
      'image':
          'https://mv-hd.com/wp-content/uploads/2023/03/f90e760cf498ae2a8d915c684d0fd2e7.jpg',
    },

    // ... add more movies here
  ];
  final user = FirebaseAuth.instance.currentUser!;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Movie to Favorites'),
      ),
      body: Form(
        key: _form,
        child: ListView(
          children: <Widget>[
            ListTile(
              leading: Image.network(movies[1]['image']!),
              title: Text(movies[1]['title']!),
              subtitle: Text(movies[1]['description']!),
            ),
            buildSaveButton()
          ],
        ),
      ),
    );
  }

  ElevatedButton buildSaveButton() {
    return ElevatedButton(
        child: const Text('Add to Favorites'),
        onPressed: () async {
          if (_form.currentState!.validate()) {
            print('save button press');
            Map<String, dynamic> data = {
              'title': movies[1]['title']!,
              'detail': movies[1]['description']!,
              'image': movies[1]['image']!
            };
            try {
              DocumentReference ref =
                  await store.collection(user.email!).add(data);
              print('save id = ${ref.id}');
              Navigator.pop(context);
            } catch (e) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Error $e'),
                ),
              );
            }
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Please validate value'),
              ),
            );
          }
        });
  }
}

class AddPage3 extends StatefulWidget {
  const AddPage3({Key? key}) : super(key: key);
  @override
  State createState() => _AddPage3State();
}

class _AddPage3State extends State<AddPage3> {
  final _form = GlobalKey<FormState>();
  final _title = TextEditingController();
  final _detail = TextEditingController();
  final _imageURL = TextEditingController();
  final store = FirebaseFirestore.instance;
  @override
  final List<Map<String, String>> movies = [
    {
      'title': 'Son (2021) เด็กผวา',
      'description':
          'เมื่อเด็กชายคนหนึ่งป่วยด้วยโรคลึกลับ แม่ของเขาต้องตัดสินใจว่าจะปกป้องเขาจากความน่ากลัวในอดีตได้ไกลแค่ไหน',
      'image':
          'https://mv-hd.com/wp-content/uploads/2023/03/fbf37dd183836a93cedf72080c214af8.jpg',
    },
    {
      'title': 'The Lightless Door (2021)',
      'description':
          'หลังจากเกิดเหตุการณ์สังหารหมู่ปีค.ศ.1990แล้ว เรื่องราวสยองขวัญของผู้อำนวยการสถาบันวิจัยจิตวิทยาที่มีเลือดของพ่อมดและนักศึกษาวิทยาลัยที่อยากรู้อยากเห็นได้ก้าวเข้าไปในพระธาตุบำเพ็ญเพียรผีสิงที่ถูกเอาปิดไว้',
      'image':
          'https://mv-hd.com/wp-content/uploads/2023/03/8b7e270a5db17b08c1a01721aee6df3c.jpg',
    },
    {
      'title': 'V/S/H94 (2021) เทปลับ… เขย่าอเวจี',
      'description': 'ตำรวจส.ว.ท. ทีมสืบสาวเกี่ยวกับเทปวีเอชเอสลึกลับรวม...',
      'image':
          'https://mv-hd.com/wp-content/uploads/2023/03/b0e633bbd62294c3fb2833cdbbb628fa.jpg',
    },
    {
      'title': 'Project Gemini (2022)',
      'description':
          'หนังไซไฟระทึกขวัญเกี่ยวกับภารกิจอวกาศที่ส่งไปสร้างภูมิประเทศของดาวเคราะห์ที่ห่างไกล อย่างไรก็ตาม ภารกิจได้พบกับบางสิ่งที่ไม่รู้จักซึ่งมีแผนที่เป็นของตัวเองสำหรับโลก',
      'image':
          'https://mv-hd.com/wp-content/uploads/2023/03/f90e760cf498ae2a8d915c684d0fd2e7.jpg',
    },
    // ... add more movies here
  ];
  final user = FirebaseAuth.instance.currentUser!;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Movie to Favorites'),
      ),
      body: Form(
        key: _form,
        child: ListView(
          children: <Widget>[
            ListTile(
              leading: Image.network(movies[2]['image']!),
              title: Text(movies[2]['title']!),
              subtitle: Text(movies[2]['description']!),
            ),
            buildSaveButton()
          ],
        ),
      ),
    );
  }

  ElevatedButton buildSaveButton() {
    return ElevatedButton(
        child: const Text('Add to Favorites'),
        onPressed: () async {
          if (_form.currentState!.validate()) {
            print('save button press');
            Map<String, dynamic> data = {
              'title': movies[2]['title']!,
              'detail': movies[2]['description']!,
              'image': movies[2]['image']!
            };
            try {
              DocumentReference ref =
                  await store.collection(user.email!).add(data);
              print('save id = ${ref.id}');
              Navigator.pop(context);
            } catch (e) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Error $e'),
                ),
              );
            }
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Please validate value'),
              ),
            );
          }
        });
  }
}

class AddPage4 extends StatefulWidget {
  const AddPage4({Key? key}) : super(key: key);
  @override
  State createState() => _AddPage4State();
}

class _AddPage4State extends State<AddPage4> {
  final _form = GlobalKey<FormState>();
  final _title = TextEditingController();
  final _detail = TextEditingController();
  final _imageURL = TextEditingController();
  final store = FirebaseFirestore.instance;
  @override
  final List<Map<String, String>> movies = [
    {
      'title': 'Son (2021) เด็กผวา',
      'description':
          'เมื่อเด็กชายคนหนึ่งป่วยด้วยโรคลึกลับ แม่ของเขาต้องตัดสินใจว่าจะปกป้องเขาจากความน่ากลัวในอดีตได้ไกลแค่ไหน',
      'image':
          'https://mv-hd.com/wp-content/uploads/2023/03/fbf37dd183836a93cedf72080c214af8.jpg',
    },
    {
      'title': 'The Lightless Door (2021)',
      'description':
          'หลังจากเกิดเหตุการณ์สังหารหมู่ปีค.ศ.1990แล้ว เรื่องราวสยองขวัญของผู้อำนวยการสถาบันวิจัยจิตวิทยาที่มีเลือดของพ่อมดและนักศึกษาวิทยาลัยที่อยากรู้อยากเห็นได้ก้าวเข้าไปในพระธาตุบำเพ็ญเพียรผีสิงที่ถูกเอาปิดไว้',
      'image':
          'https://mv-hd.com/wp-content/uploads/2023/03/8b7e270a5db17b08c1a01721aee6df3c.jpg',
    },
    {
      'title': 'V/S/H94 (2021) เทปลับ… เขย่าอเวจี',
      'description':
          'ตำรวจส.ว.ท. ทีมสืบสาวเกี่ยวกับเทปวีเอชเอสลึกลับรวมทั้งศึกษาและทำการค้นพบลัทธิที่น่าสยดสยองซึ่งมีรายละเอียดที่บันทึกไว้ล่วงหน้าซึ่งเผยให้เห็นแนวทางสมรู้ร่วมคิดที่น่าหวาดกลัว',
      'image':
          'https://mv-hd.com/wp-content/uploads/2023/03/b0e633bbd62294c3fb2833cdbbb628fa.jpg',
    },
    {
      'title': 'Project Gemini (2022)',
      'description':
          'หนังไซไฟระทึกขวัญเกี่ยวกับภารกิจอวกาศที่ส่งไปสร้างภูมิประเทศของดาวเคราะห์...',
      'image':
          'https://mv-hd.com/wp-content/uploads/2023/03/f90e760cf498ae2a8d915c684d0fd2e7.jpg',
    },
    // ... add more movies here
  ];
  final user = FirebaseAuth.instance.currentUser!;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Movie to Favorites'),
      ),
      body: Form(
        key: _form,
        child: ListView(
          children: <Widget>[
            ListTile(
              leading: Image.network(movies[3]['image']!),
              title: Text(movies[3]['title']!),
              subtitle: Text(movies[3]['description']!),
            ),
            buildSaveButton()
          ],
        ),
      ),
    );
  }

  ElevatedButton buildSaveButton() {
    return ElevatedButton(
        child: const Text('Add to Favorites'),
        onPressed: () async {
          if (_form.currentState!.validate()) {
            print('save button press');
            Map<String, dynamic> data = {
              'title': movies[3]['title']!,
              'detail': movies[3]['description']!,
              'image': movies[3]['image']!
            };
            try {
              DocumentReference ref =
                  await store.collection(user.email!).add(data);
              print('save id = ${ref.id}');
              Navigator.pop(context);
            } catch (e) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Error $e'),
                ),
              );
            }
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Please validate value'),
              ),
            );
          }
        });
  }
}
