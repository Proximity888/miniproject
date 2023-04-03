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

class Mysterypage extends StatefulWidget {
  const Mysterypage({Key? key}) : super(key: key);
  @override
  _MysterypageState createState() => _MysterypageState();
}

class _MysterypageState extends State<Mysterypage> {
  final List<Map<String, String>> movies = [
    {
      'title': 'Lupin (2021) จอมโจรลูแปง',
      'description':
          'ซีรี่ส์แนวขโมยแล้วก็สอบสวนสืบสวนที่คุณไม่สมควรพลาด มันเป็นซีรี่ส์ที่เล่าเกี่ยวกับรายละเอียดของผู้ที่ได้มารับทราบข้อเท็จจริงว่าบิดาของเขานั้นถูกให้ร้าย รวมทั้งเขาอยากที่จะล้างแค้นให้กับบิดาโดยยึดหลักการของขุนโจรอาร์แซน ลูแปง และก็ที่เขาเลือกกรรมวิธีการนี้สำหรับการทวงแค้นก็เพราะเหตุว่าหนังสือเล่มท้ายที่สุดที่บิดาเขาได้มอบให้ซึ่งก็คือหนังสือของขุนโจร ลูแปง',
      'image':
          'https://mv-hd.com/wp-content/uploads/2023/03/fe04f22c83cef943403c96fe43e2b7c9.jpg',
    },
    {
      'title': 'The Woman in the Window (2021) ส่องปมมรณะ',
      'description':
          'โรคกลัวที่ชุมชนทำให้นักจิตวิทยาคนหนึ่งต้องเก็บตัวอยู่แต่ในบ้าน แต่แล้วเธอก็เริ่มสอดส่องชีวิตของเพื่อนบ้านใหม่ด้วยความสนใจ… และได้เห็นอาชญากรรมสะเทือนขวัญจากหน้าต่าง',
      'image':
          'https://mv-hd.com/wp-content/uploads/2023/03/add4108fe93dea6d7416377eba7a2e4a.jpg',
    },
    {
      'title': 'The Soul (2021) จิตวิญญาณ',
      'description':
          'Wang Shicong ประธานกลุ่มที่มีชื่อเสียงเสียชีวิตที่บ้านอย่างอนาถ อัยการ Liang Wenchao (Zhang Zhen) และภรรยาของเขาตำรวจอาชญากร A Bao (Janine Chang) ได้เรียนรู้ระหว่างการสอบสวน: ลูกชายของผู้ตาย',
      'image':
          'https://mv-hd.com/wp-content/uploads/2023/03/1be18c791543e08f2a2b0cd62b455dfe.jpg',
    },
    {
      'title': 'The Night House (2021)',
      'description':
          'หญิงม่ายคนหนึ่งเริ่มเปิดเผยความลับที่น่าเป็นห่วงของสามีที่เพิ่งเสียชีวิต เรื่องราวของ Beth หญิงสาวที่สามีของเธอตายไปอย่างกระทันหันและทิ้งเธอไว้ให้อยู่อย่างโดดเดี่ยวในบ้านริมน้ำที่เขาสร้างให้เธอ ซึ่ง Beth เองก็พยายามที่จะอยู่กับตัวเองให้ได้',
      'image':
          'https://mv-hd.com/wp-content/uploads/2023/03/05c5d44c058dfe4428ff7d11c0c5d931.jpg',
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
                title: const Text("ลึกลับซ่อนเงื่อน Mystery",
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
                    movies[0]['title']!,
                    style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                  ),
                  subtitle: Row(children: const <Widget>[
                    Text('VSM 9.6', style: TextStyle(color: Colors.black)),
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
                    Navigator.pushNamed(context, '/Lupin');
                  },
                ),
                ListTile(
                  leading: Image.network(movies[1]['image']!),
                  title: Text(
                    movies[1]['title']!,
                    style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                  ),
                  subtitle: Row(children: const <Widget>[
                    Text('VSM 6.7', style: TextStyle(color: Colors.black)),
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
                    Navigator.pushNamed(context, '/The_Woman_in_the_Window');
                  },
                ),
                ListTile(
                  leading: Image.network(movies[2]['image']!),
                  title: Text(
                    movies[2]['title']!,
                    style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                  ),
                  subtitle: Row(children: const <Widget>[
                    Text('VSM 5.9', style: TextStyle(color: Colors.black)),
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
                    Navigator.pushNamed(context, '/The_Soul');
                  },
                ),
                ListTile(
                  leading: Image.network(movies[3]['image']!),
                  title: Text(
                    movies[3]['title']!,
                    style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                  ),
                  subtitle: Row(children: const <Widget>[
                    Text('VSM 6.4', style: TextStyle(color: Colors.black)),
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
                    Navigator.pushNamed(context, '/The_Night_House');
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
      'title': 'Lupin (2021) จอมโจรลูแปง',
      'description': 'ซีรี่ส์แนวขโมยแล้วก็สอบสวนสืบสวนที่คุณไม่สมควรพลาด...',
      'image':
          'https://mv-hd.com/wp-content/uploads/2023/03/fe04f22c83cef943403c96fe43e2b7c9.jpg',
    },
    {
      'title': 'The Woman in the Window (2021) ส่องปมมรณะ',
      'description':
          'โรคกลัวที่ชุมชนทำให้นักจิตวิทยาคนหนึ่งต้องเก็บตัวอยู่แต่ในบ้าน แต่แล้วเธอก็เริ่มสอดส่องชีวิตของเพื่อนบ้านใหม่ด้วยความสนใจ… และได้เห็นอาชญากรรมสะเทือนขวัญจากหน้าต่าง',
      'image':
          'https://mv-hd.com/wp-content/uploads/2023/03/add4108fe93dea6d7416377eba7a2e4a.jpg',
    },
    {
      'title': 'The Soul (2021) จิตวิญญาณ',
      'description':
          'Wang Shicong ประธานกลุ่มที่มีชื่อเสียงเสียชีวิตที่บ้านอย่างอนาถ อัยการ Liang Wenchao (Zhang Zhen) และภรรยาของเขาตำรวจอาชญากร A Bao (Janine Chang) ได้เรียนรู้ระหว่างการสอบสวน: ลูกชายของผู้ตาย',
      'image':
          'https://mv-hd.com/wp-content/uploads/2023/03/1be18c791543e08f2a2b0cd62b455dfe.jpg',
    },
    {
      'title': 'The Night House (2021)',
      'description':
          'หญิงม่ายคนหนึ่งเริ่มเปิดเผยความลับที่น่าเป็นห่วงของสามีที่เพิ่งเสียชีวิต เรื่องราวของ Beth หญิงสาวที่สามีของเธอตายไปอย่างกระทันหันและทิ้งเธอไว้ให้อยู่อย่างโดดเดี่ยวในบ้านริมน้ำที่เขาสร้างให้เธอ ซึ่ง Beth เองก็พยายามที่จะอยู่กับตัวเองให้ได้',
      'image':
          'https://mv-hd.com/wp-content/uploads/2023/03/05c5d44c058dfe4428ff7d11c0c5d931.jpg',
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
      'title': 'Lupin (2021) จอมโจรลูแปง',
      'description':
          'ซีรี่ส์แนวขโมยแล้วก็สอบสวนสืบสวนที่คุณไม่สมควรพลาด มันเป็นซีรี่ส์ที่เล่าเกี่ยวกับรายละเอียดของผู้ที่ได้มารับทราบข้อเท็จจริงว่าบิดาของเขานั้นถูกให้ร้าย รวมทั้งเขาอยากที่จะล้างแค้นให้กับบิดาโดยยึดหลักการของขุนโจรอาร์แซน ลูแปง และก็ที่เขาเลือกกรรมวิธีการนี้สำหรับการทวงแค้นก็เพราะเหตุว่าหนังสือเล่มท้ายที่สุดที่บิดาเขาได้มอบให้ซึ่งก็คือหนังสือของขุนโจร ลูแปง',
      'image':
          'https://mv-hd.com/wp-content/uploads/2023/03/fe04f22c83cef943403c96fe43e2b7c9.jpg',
    },
    {
      'title': 'The Woman in the Window (2021) ส่องปมมรณะ',
      'description': 'โรคกลัวที่ชุมชนทำให้นักจิตวิทยาคนหนึ่ง...',
      'image':
          'https://mv-hd.com/wp-content/uploads/2023/03/add4108fe93dea6d7416377eba7a2e4a.jpg',
    },
    {
      'title': 'The Soul (2021) จิตวิญญาณ',
      'description':
          'Wang Shicong ประธานกลุ่มที่มีชื่อเสียงเสียชีวิตที่บ้านอย่างอนาถ อัยการ Liang Wenchao (Zhang Zhen) และภรรยาของเขาตำรวจอาชญากร A Bao (Janine Chang) ได้เรียนรู้ระหว่างการสอบสวน: ลูกชายของผู้ตาย',
      'image':
          'https://mv-hd.com/wp-content/uploads/2023/03/1be18c791543e08f2a2b0cd62b455dfe.jpg',
    },
    {
      'title': 'The Night House (2021)',
      'description':
          'หญิงม่ายคนหนึ่งเริ่มเปิดเผยความลับที่น่าเป็นห่วงของสามีที่เพิ่งเสียชีวิต เรื่องราวของ Beth หญิงสาวที่สามีของเธอตายไปอย่างกระทันหันและทิ้งเธอไว้ให้อยู่อย่างโดดเดี่ยวในบ้านริมน้ำที่เขาสร้างให้เธอ ซึ่ง Beth เองก็พยายามที่จะอยู่กับตัวเองให้ได้',
      'image':
          'https://mv-hd.com/wp-content/uploads/2023/03/05c5d44c058dfe4428ff7d11c0c5d931.jpg',
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
      'title': 'Lupin (2021) จอมโจรลูแปง',
      'description':
          'ซีรี่ส์แนวขโมยแล้วก็สอบสวนสืบสวนที่คุณไม่สมควรพลาด มันเป็นซีรี่ส์ที่เล่าเกี่ยวกับรายละเอียดของผู้ที่ได้มารับทราบข้อเท็จจริงว่าบิดาของเขานั้นถูกให้ร้าย รวมทั้งเขาอยากที่จะล้างแค้นให้กับบิดาโดยยึดหลักการของขุนโจรอาร์แซน ลูแปง และก็ที่เขาเลือกกรรมวิธีการนี้สำหรับการทวงแค้นก็เพราะเหตุว่าหนังสือเล่มท้ายที่สุดที่บิดาเขาได้มอบให้ซึ่งก็คือหนังสือของขุนโจร ลูแปง',
      'image':
          'https://mv-hd.com/wp-content/uploads/2023/03/fe04f22c83cef943403c96fe43e2b7c9.jpg',
    },
    {
      'title': 'The Woman in the Window (2021) ส่องปมมรณะ',
      'description':
          'โรคกลัวที่ชุมชนทำให้นักจิตวิทยาคนหนึ่งต้องเก็บตัวอยู่แต่ในบ้าน แต่แล้วเธอก็เริ่มสอดส่องชีวิตของเพื่อนบ้านใหม่ด้วยความสนใจ… และได้เห็นอาชญากรรมสะเทือนขวัญจากหน้าต่าง',
      'image':
          'https://mv-hd.com/wp-content/uploads/2023/03/add4108fe93dea6d7416377eba7a2e4a.jpg',
    },
    {
      'title': 'The Soul (2021) จิตวิญญาณ',
      'description':
          'Wang Shicong ประธานกลุ่มที่มีชื่อเสียงเสียชีวิตที่บ้านอย่างอนาถ...',
      'image':
          'https://mv-hd.com/wp-content/uploads/2023/03/1be18c791543e08f2a2b0cd62b455dfe.jpg',
    },
    {
      'title': 'The Night House (2021)',
      'description':
          'หญิงม่ายคนหนึ่งเริ่มเปิดเผยความลับที่น่าเป็นห่วงของสามีที่เพิ่งเสียชีวิต เรื่องราวของ Beth หญิงสาวที่สามีของเธอตายไปอย่างกระทันหันและทิ้งเธอไว้ให้อยู่อย่างโดดเดี่ยวในบ้านริมน้ำที่เขาสร้างให้เธอ ซึ่ง Beth เองก็พยายามที่จะอยู่กับตัวเองให้ได้',
      'image':
          'https://mv-hd.com/wp-content/uploads/2023/03/05c5d44c058dfe4428ff7d11c0c5d931.jpg',
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
      'title': 'Lupin (2021) จอมโจรลูแปง',
      'description':
          'ซีรี่ส์แนวขโมยแล้วก็สอบสวนสืบสวนที่คุณไม่สมควรพลาด มันเป็นซีรี่ส์ที่เล่าเกี่ยวกับรายละเอียดของผู้ที่ได้มารับทราบข้อเท็จจริงว่าบิดาของเขานั้นถูกให้ร้าย รวมทั้งเขาอยากที่จะล้างแค้นให้กับบิดาโดยยึดหลักการของขุนโจรอาร์แซน ลูแปง และก็ที่เขาเลือกกรรมวิธีการนี้สำหรับการทวงแค้นก็เพราะเหตุว่าหนังสือเล่มท้ายที่สุดที่บิดาเขาได้มอบให้ซึ่งก็คือหนังสือของขุนโจร ลูแปง',
      'image':
          'https://mv-hd.com/wp-content/uploads/2023/03/fe04f22c83cef943403c96fe43e2b7c9.jpg',
    },
    {
      'title': 'The Woman in the Window (2021) ส่องปมมรณะ',
      'description':
          'โรคกลัวที่ชุมชนทำให้นักจิตวิทยาคนหนึ่งต้องเก็บตัวอยู่แต่ในบ้าน แต่แล้วเธอก็เริ่มสอดส่องชีวิตของเพื่อนบ้านใหม่ด้วยความสนใจ… และได้เห็นอาชญากรรมสะเทือนขวัญจากหน้าต่าง',
      'image':
          'https://mv-hd.com/wp-content/uploads/2023/03/add4108fe93dea6d7416377eba7a2e4a.jpg',
    },
    {
      'title': 'The Soul (2021) จิตวิญญาณ',
      'description':
          'Wang Shicong ประธานกลุ่มที่มีชื่อเสียงเสียชีวิตที่บ้านอย่างอนาถ อัยการ Liang Wenchao (Zhang Zhen) และภรรยาของเขาตำรวจอาชญากร A Bao (Janine Chang) ได้เรียนรู้ระหว่างการสอบสวน: ลูกชายของผู้ตาย',
      'image':
          'https://mv-hd.com/wp-content/uploads/2023/03/1be18c791543e08f2a2b0cd62b455dfe.jpg',
    },
    {
      'title': 'The Night House (2021)',
      'description':
          'หญิงม่ายคนหนึ่งเริ่มเปิดเผยความลับที่น่าเป็นห่วงของสามีที่เพิ่งเสียชีวิต...',
      'image':
          'https://mv-hd.com/wp-content/uploads/2023/03/05c5d44c058dfe4428ff7d11c0c5d931.jpg',
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
