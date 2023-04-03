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

class Adventurepage extends StatefulWidget {
  const Adventurepage({Key? key}) : super(key: key);
  @override
  _AdventurepageState createState() => _AdventurepageState();
}

class _AdventurepageState extends State<Adventurepage> {
  final List<Map<String, String>> movies = [
    {
      'title': 'Rampage (2018) ใหญ่ชนยักษ์',
      'description':
          'เรื่องราวของนักวานรวิทยา ดาวิส โอโคเย (จอห์นสัน) ชายผู้หลบเลี่ยงห่างไกลจากผู้คน เขามีสายสัมพันธ์อันแน่นหนาที่ไม่มีวันสั่นคลอนกับจอร์จ กอริล่าหลังเงินที่เฉลียวฉลาดยิ่งกว่ากอริลล่าทั่วไปที่เขาเป็นผู้เลี้ยงดูมาตั้งแต่มันเกิด แต่แล้วยีนส์แห่งความโหดร้ายในร่างมันได้เกิดการกลายพันธุ์',
      'image':
          'https://www.24-hd.com/wp-content/uploads/2023/02/Rampage-2018-%E0%B9%83%E0%B8%AB%E0%B8%8D%E0%B9%88%E0%B8%8A%E0%B8%99%E0%B8%A2%E0%B8%B1%E0%B8%81%E0%B8%A9%E0%B9%8C.jpg',
    },
    {
      'title': 'Deliverance (1972) ล่องแก่งธนูเลือด',
      'description':
          'ล่องแก่งธนูเลือด หุบเขาแม่น้ำ Cahulawassee ทางตอนเหนือของจอร์เจียเป็นหนึ่งในพื้นที่ธรรมชาติที่บริสุทธิ์แห่งสุดท้ายของรัฐ ซึ่งจะเปลี่ยนไปในเร็วๆ นี้พร้อมกับการสร้างเขื่อนในแม่น้ำที่ใกล้เข้ามา ซึ่งจะทำให้น้ำท่วมพื้นที่ส่วนใหญ่โดยรอบ',
      'image':
          'https://www.24-hd.com/wp-content/uploads/2023/03/Deliverance-1972-%E0%B8%A5%E0%B9%88%E0%B8%AD%E0%B8%87%E0%B9%81%E0%B8%81%E0%B9%88%E0%B8%87%E0%B8%98%E0%B8%99%E0%B8%B9%E0%B9%80%E0%B8%A5%E0%B8%B7%E0%B8%AD%E0%B8%94.jpg',
    },
    {
      'title': 'Vikings Valhalla Season 1 (2022) ไวกิ้ง วัลฮัลลา',
      'description':
          'ไวกิ้ง วัลฮัลลา ซีรีส์ภาคต่อของ “ไวกิ้ง” ที่บอกเล่าเรื่องราวร้อยปีให้หลัง ถึงเวลาที่วีรชนในตำนานรุ่นต่อมาจะผงาดท้าทายโชคชะตาและขีดเขียนประวัติศาสตร์ของตัวเอง',
      'image':
          'https://www.24-hd.com/wp-content/uploads/2023/01/Vikings-Valhalla-Season-1-2022.jpg',
    },
    {
      'title': 'Exorcist (2022) มือปราบปีศาจ',
      'description':
          'มือปราบปีศาจ เรื่องราวของมือปราบปีศาจ “หลินเทียนซือ” และลูกศิษย์ของเขา “หลิวอีเจ๋อ” พวกเขาช่วยเหลือผู้คนโดยไม่เกรงกลัวต่อภยันอันตราย และยึดมั่นในความดี วิธีการสยบปีศาจจิ้งจอกแท้จริงแล้ว เป็นการสอนให้ผู้คนอย่าหลงเชื่ออะไรผิดๆ และอย่าให้อะไรมาบดบังความคิดทางโลก เพื่อแยกแยะระหว่างความดีและความชั่ว',
      'image':
          'https://www.24-hd.com/wp-content/uploads/2023/01/Exorcist-2022-%E0%B8%A1%E0%B8%B7%E0%B8%AD%E0%B8%9B%E0%B8%A3%E0%B8%B2%E0%B8%9A%E0%B8%9B%E0%B8%B5%E0%B8%A8%E0%B8%B2%E0%B8%88.jpg',
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
                title: const Text("หนังผจญภัย Adventure",
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
                    Text('VSM 4.7', style: TextStyle(color: Colors.black)),
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
                    Navigator.pushNamed(context, '/Rampage');
                  },
                ),
                ListTile(
                  leading: Image.network(movies[1]['image']!),
                  title: Text(
                    movies[1]['title']!,
                    style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                  ),
                  subtitle: Row(children: const <Widget>[
                    Text('VSM 5.2', style: TextStyle(color: Colors.black)),
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
                    Navigator.pushNamed(context, '/Deliverance');
                  },
                ),
                ListTile(
                  leading: Image.network(movies[2]['image']!),
                  title: Text(
                    movies[2]['title']!,
                    style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                  ),
                  subtitle: Row(children: const <Widget>[
                    Text('VSM 7.1', style: TextStyle(color: Colors.black)),
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
                    Navigator.pushNamed(context, '/Vikings_Valhalla_Season_1');
                  },
                ),
                ListTile(
                  leading: Image.network(movies[3]['image']!),
                  title: Text(
                    movies[3]['title']!,
                    style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                  ),
                  subtitle: Row(children: const <Widget>[
                    Text('VSM 4.4', style: TextStyle(color: Colors.black)),
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
                    Navigator.pushNamed(context, '/Exorcist');
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
      'title': 'Rampage (2018) ใหญ่ชนยักษ์',
      'description':
          'เรื่องราวของนักวานรวิทยา ดาวิส โอโคเย (จอห์นสัน) ชายผู้หลบเลี่ยงห่างไกลจากผู้คน...',
      'image':
          'https://www.24-hd.com/wp-content/uploads/2023/02/Rampage-2018-%E0%B9%83%E0%B8%AB%E0%B8%8D%E0%B9%88%E0%B8%8A%E0%B8%99%E0%B8%A2%E0%B8%B1%E0%B8%81%E0%B8%A9%E0%B9%8C.jpg',
    },
    {
      'title': 'Deliverance (1972) ล่องแก่งธนูเลือด',
      'description':
          'ล่องแก่งธนูเลือด หุบเขาแม่น้ำ Cahulawassee ทางตอนเหนือของจอร์เจียเป็นหนึ่งในพื้นที่ธรรมชาติที่บริสุทธิ์แห่งสุดท้ายของรัฐ ซึ่งจะเปลี่ยนไปในเร็วๆ นี้พร้อมกับการสร้างเขื่อนในแม่น้ำที่ใกล้เข้ามา ซึ่งจะทำให้น้ำท่วมพื้นที่ส่วนใหญ่โดยรอบ',
      'image':
          'https://www.24-hd.com/wp-content/uploads/2023/03/Deliverance-1972-%E0%B8%A5%E0%B9%88%E0%B8%AD%E0%B8%87%E0%B9%81%E0%B8%81%E0%B9%88%E0%B8%87%E0%B8%98%E0%B8%99%E0%B8%B9%E0%B9%80%E0%B8%A5%E0%B8%B7%E0%B8%AD%E0%B8%94.jpg',
    },
    {
      'title': 'Vikings Valhalla Season 1 (2022) ไวกิ้ง วัลฮัลลา',
      'description':
          'ไวกิ้ง วัลฮัลลา ซีรีส์ภาคต่อของ “ไวกิ้ง” ที่บอกเล่าเรื่องราวร้อยปีให้หลัง ถึงเวลาที่วีรชนในตำนานรุ่นต่อมาจะผงาดท้าทายโชคชะตาและขีดเขียนประวัติศาสตร์ของตัวเอง',
      'image':
          'https://www.24-hd.com/wp-content/uploads/2023/01/Vikings-Valhalla-Season-1-2022.jpg',
    },
    {
      'title': 'Exorcist (2022) มือปราบปีศาจ',
      'description':
          'มือปราบปีศาจ เรื่องราวของมือปราบปีศาจ “หลินเทียนซือ” และลูกศิษย์ของเขา “หลิวอีเจ๋อ” พวกเขาช่วยเหลือผู้คนโดยไม่เกรงกลัวต่อภยันอันตราย และยึดมั่นในความดี วิธีการสยบปีศาจจิ้งจอกแท้จริงแล้ว เป็นการสอนให้ผู้คนอย่าหลงเชื่ออะไรผิดๆ และอย่าให้อะไรมาบดบังความคิดทางโลก เพื่อแยกแยะระหว่างความดีและความชั่ว',
      'image':
          'https://www.24-hd.com/wp-content/uploads/2023/01/Exorcist-2022-%E0%B8%A1%E0%B8%B7%E0%B8%AD%E0%B8%9B%E0%B8%A3%E0%B8%B2%E0%B8%9A%E0%B8%9B%E0%B8%B5%E0%B8%A8%E0%B8%B2%E0%B8%88.jpg',
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
      'title': 'Rampage (2018) ใหญ่ชนยักษ์',
      'description':
          'เรื่องราวของนักวานรวิทยา ดาวิส โอโคเย (จอห์นสัน) ชายผู้หลบเลี่ยงห่างไกลจากผู้คน เขามีสายสัมพันธ์อันแน่นหนาที่ไม่มีวันสั่นคลอนกับจอร์จ กอริล่าหลังเงินที่เฉลียวฉลาดยิ่งกว่ากอริลล่าทั่วไปที่เขาเป็นผู้เลี้ยงดูมาตั้งแต่มันเกิด แต่แล้วยีนส์แห่งความโหดร้ายในร่างมันได้เกิดการกลายพันธุ์',
      'image':
          'https://www.24-hd.com/wp-content/uploads/2023/02/Rampage-2018-%E0%B9%83%E0%B8%AB%E0%B8%8D%E0%B9%88%E0%B8%8A%E0%B8%99%E0%B8%A2%E0%B8%B1%E0%B8%81%E0%B8%A9%E0%B9%8C.jpg',
    },
    {
      'title': 'Deliverance (1972) ล่องแก่งธนูเลือด',
      'description':
          'ล่องแก่งธนูเลือด หุบเขาแม่น้ำ Cahulawassee ทางตอนเหนือของจอร์เจียเป็นหนึ่งในพื้นที่ธรรมชาติ...',
      'image':
          'https://www.24-hd.com/wp-content/uploads/2023/03/Deliverance-1972-%E0%B8%A5%E0%B9%88%E0%B8%AD%E0%B8%87%E0%B9%81%E0%B8%81%E0%B9%88%E0%B8%87%E0%B8%98%E0%B8%99%E0%B8%B9%E0%B9%80%E0%B8%A5%E0%B8%B7%E0%B8%AD%E0%B8%94.jpg',
    },
    {
      'title': 'Vikings Valhalla Season 1 (2022) ไวกิ้ง วัลฮัลลา',
      'description':
          'ไวกิ้ง วัลฮัลลา ซีรีส์ภาคต่อของ “ไวกิ้ง” ที่บอกเล่าเรื่องราวร้อยปีให้หลัง ถึงเวลาที่วีรชนในตำนานรุ่นต่อมาจะผงาดท้าทายโชคชะตาและขีดเขียนประวัติศาสตร์ของตัวเอง',
      'image':
          'https://www.24-hd.com/wp-content/uploads/2023/01/Vikings-Valhalla-Season-1-2022.jpg',
    },
    {
      'title': 'Exorcist (2022) มือปราบปีศาจ',
      'description':
          'มือปราบปีศาจ เรื่องราวของมือปราบปีศาจ “หลินเทียนซือ” และลูกศิษย์ของเขา “หลิวอีเจ๋อ” พวกเขาช่วยเหลือผู้คนโดยไม่เกรงกลัวต่อภยันอันตราย และยึดมั่นในความดี วิธีการสยบปีศาจจิ้งจอกแท้จริงแล้ว เป็นการสอนให้ผู้คนอย่าหลงเชื่ออะไรผิดๆ และอย่าให้อะไรมาบดบังความคิดทางโลก เพื่อแยกแยะระหว่างความดีและความชั่ว',
      'image':
          'https://www.24-hd.com/wp-content/uploads/2023/01/Exorcist-2022-%E0%B8%A1%E0%B8%B7%E0%B8%AD%E0%B8%9B%E0%B8%A3%E0%B8%B2%E0%B8%9A%E0%B8%9B%E0%B8%B5%E0%B8%A8%E0%B8%B2%E0%B8%88.jpg',
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
      'title': 'Rampage (2018) ใหญ่ชนยักษ์',
      'description':
          'เรื่องราวของนักวานรวิทยา ดาวิส โอโคเย (จอห์นสัน) ชายผู้หลบเลี่ยงห่างไกลจากผู้คน เขามีสายสัมพันธ์อันแน่นหนาที่ไม่มีวันสั่นคลอนกับจอร์จ กอริล่าหลังเงินที่เฉลียวฉลาดยิ่งกว่ากอริลล่าทั่วไปที่เขาเป็นผู้เลี้ยงดูมาตั้งแต่มันเกิด แต่แล้วยีนส์แห่งความโหดร้ายในร่างมันได้เกิดการกลายพันธุ์',
      'image':
          'https://www.24-hd.com/wp-content/uploads/2023/02/Rampage-2018-%E0%B9%83%E0%B8%AB%E0%B8%8D%E0%B9%88%E0%B8%8A%E0%B8%99%E0%B8%A2%E0%B8%B1%E0%B8%81%E0%B8%A9%E0%B9%8C.jpg',
    },
    {
      'title': 'Deliverance (1972) ล่องแก่งธนูเลือด',
      'description':
          'ล่องแก่งธนูเลือด หุบเขาแม่น้ำ Cahulawassee ทางตอนเหนือของจอร์เจียเป็นหนึ่งในพื้นที่ธรรมชาติที่บริสุทธิ์',
      'image':
          'https://www.24-hd.com/wp-content/uploads/2023/03/Deliverance-1972-%E0%B8%A5%E0%B9%88%E0%B8%AD%E0%B8%87%E0%B9%81%E0%B8%81%E0%B9%88%E0%B8%87%E0%B8%98%E0%B8%99%E0%B8%B9%E0%B9%80%E0%B8%A5%E0%B8%B7%E0%B8%AD%E0%B8%94.jpg',
    },
    {
      'title': 'Vikings Valhalla Season 1 (2022) ไวกิ้ง วัลฮัลลา',
      'description': 'ไวกิ้ง วัลฮัลลา ซีรีส์ภาคต่อของ “ไวกิ้ง”...',
      'image':
          'https://www.24-hd.com/wp-content/uploads/2023/01/Vikings-Valhalla-Season-1-2022.jpg',
    },
    {
      'title': 'Exorcist (2022) มือปราบปีศาจ',
      'description':
          'มือปราบปีศาจ เรื่องราวของมือปราบปีศาจ “หลินเทียนซือ” และลูกศิษย์ของเขา “หลิวอีเจ๋อ” พวกเขาช่วยเหลือผู้คนโดยไม่เกรงกลัวต่อภยันอันตราย และยึดมั่นในความดี วิธีการสยบปีศาจจิ้งจอกแท้จริงแล้ว เป็นการสอนให้ผู้คนอย่าหลงเชื่ออะไรผิดๆ และอย่าให้อะไรมาบดบังความคิดทางโลก เพื่อแยกแยะระหว่างความดีและความชั่ว',
      'image':
          'https://www.24-hd.com/wp-content/uploads/2023/01/Exorcist-2022-%E0%B8%A1%E0%B8%B7%E0%B8%AD%E0%B8%9B%E0%B8%A3%E0%B8%B2%E0%B8%9A%E0%B8%9B%E0%B8%B5%E0%B8%A8%E0%B8%B2%E0%B8%88.jpg',
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
      'title': 'Rampage (2018) ใหญ่ชนยักษ์',
      'description':
          'เรื่องราวของนักวานรวิทยา ดาวิส โอโคเย (จอห์นสัน) ชายผู้หลบเลี่ยงห่างไกลจากผู้คน เขามีสายสัมพันธ์อันแน่นหนาที่ไม่มีวันสั่นคลอนกับจอร์จ กอริล่าหลังเงินที่เฉลียวฉลาดยิ่งกว่ากอริลล่าทั่วไปที่เขาเป็นผู้เลี้ยงดูมาตั้งแต่มันเกิด แต่แล้วยีนส์แห่งความโหดร้ายในร่างมันได้เกิดการกลายพันธุ์',
      'image':
          'https://www.24-hd.com/wp-content/uploads/2023/02/Rampage-2018-%E0%B9%83%E0%B8%AB%E0%B8%8D%E0%B9%88%E0%B8%8A%E0%B8%99%E0%B8%A2%E0%B8%B1%E0%B8%81%E0%B8%A9%E0%B9%8C.jpg',
    },
    {
      'title': 'Deliverance (1972) ล่องแก่งธนูเลือด',
      'description':
          'ล่องแก่งธนูเลือด หุบเขาแม่น้ำ Cahulawassee ทางตอนเหนือของจอร์เจียเป็นหนึ่งในพื้นที่ธรรมชาติที่บริสุทธิ์แห่งสุดท้ายของรัฐ ซึ่งจะเปลี่ยนไปในเร็วๆ นี้พร้อมกับการสร้างเขื่อนในแม่น้ำที่ใกล้เข้ามา ซึ่งจะทำให้น้ำท่วมพื้นที่ส่วนใหญ่โดยรอบ',
      'image':
          'https://www.24-hd.com/wp-content/uploads/2023/03/Deliverance-1972-%E0%B8%A5%E0%B9%88%E0%B8%AD%E0%B8%87%E0%B9%81%E0%B8%81%E0%B9%88%E0%B8%87%E0%B8%98%E0%B8%99%E0%B8%B9%E0%B9%80%E0%B8%A5%E0%B8%B7%E0%B8%AD%E0%B8%94.jpg',
    },
    {
      'title': 'Vikings Valhalla Season 1 (2022) ไวกิ้ง วัลฮัลลา',
      'description':
          'ไวกิ้ง วัลฮัลลา ซีรีส์ภาคต่อของ “ไวกิ้ง” ที่บอกเล่าเรื่องราวร้อยปีให้หลัง ถึงเวลาที่วีรชนในตำนานรุ่นต่อมาจะผงาดท้าทายโชคชะตาและขีดเขียนประวัติศาสตร์ของตัวเอง',
      'image':
          'https://www.24-hd.com/wp-content/uploads/2023/01/Vikings-Valhalla-Season-1-2022.jpg',
    },
    {
      'title': 'Exorcist (2022) มือปราบปีศาจ',
      'description':
          'มือปราบปีศาจ เรื่องราวของมือปราบปีศาจ “หลินเทียนซือ” และลูกศิษย์ของเขา “หลิวอีเจ๋อ” ...',
      'image':
          'https://www.24-hd.com/wp-content/uploads/2023/01/Exorcist-2022-%E0%B8%A1%E0%B8%B7%E0%B8%AD%E0%B8%9B%E0%B8%A3%E0%B8%B2%E0%B8%9A%E0%B8%9B%E0%B8%B5%E0%B8%A8%E0%B8%B2%E0%B8%88.jpg',
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
