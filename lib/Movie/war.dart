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

class Warpage extends StatefulWidget {
  const Warpage({Key? key}) : super(key: key);
  @override
  _WarpageState createState() => _WarpageState();
}

class _WarpageState extends State<Warpage> {
  final List<Map<String, String>> movies = [
    {
      'title': 'Narvik (2023) นาร์วิค',
      'description':
          'เมษายน พ.ศ. 2483 สายตาของโลกจับจ้องไปที่นาร์วิค เมืองเล็กๆ ทางตอนเหนือของนอร์เวย์ ซึ่งเป็นแหล่งแร่เหล็กที่จำเป็นสำหรับเครื่องจักรสงครามของฮิตเตอร์ ตลอดสองเดือนแห่งสงครามฤดูหนาวอันดุเดือด ฮิตเลอร์พ่ายแพ้ครั้งแรก',
      'image':
          'https://www.24-hd.com/wp-content/uploads/2023/01/Narvik-2023-%E0%B8%99%E0%B8%B2%E0%B8%A3%E0%B9%8C%E0%B8%A7%E0%B8%B4%E0%B8%84.jpg',
    },
    {
      'title': 'Saving Private Ryan (1998) เซฟวิ่ง ไพรเวท ไรอัน ฝ่าสมรภูมินรก',
      'description':
          'สงครามโลกครั้งที่สอง หลังการบุกหาดโอมาฮ่าเมื่อวันที่ 6 มิถุนายน ค.ศ. 1944 แล้ว กองทัพอเมริกันประสบความสูญเสียเป็นอย่างมาก ทหารหลายคนบาดเจ็บ พิการ และล้มตาย ร้อยเอก จอห์น มิลเลอร์ (ทอม แฮงค์) ผู้นำกองทหารกองหนึ่ง ก็พบกับความสูญเสียของผู้ใต้บังคับบัญชาในครั้งนี้ด้วย',
      'image':
          'https://www.24-hd.com/wp-content/uploads/2023/02/Saving-Private-Ryan-1998-%E0%B9%80%E0%B8%8B%E0%B8%9F%E0%B8%A7%E0%B8%B4%E0%B9%88%E0%B8%87-%E0%B9%84%E0%B8%9E%E0%B8%A3%E0%B9%80%E0%B8%A7%E0%B8%97-%E0%B9%84%E0%B8%A3%E0%B8%AD%E0%B8%B1%E0%B8%99-%E0%B8%9D%E0%B9%88%E0%B8%B2%E0%B8%AA%E0%B8%A1%E0%B8%A3%E0%B8%A0%E0%B8%B9%E0%B8%A1%E0%B8%B4%E0%B8%99%E0%B8%A3%E0%B8%81.jpg',
    },
    {
      'title': 'Battlebox (2023)',
      'description':
          'ด้วยการโจมตีอย่างกะทันหันโดยญี่ปุ่น พลตรี Maltby ของอังกฤษและเจ้าหน้าที่ระดับสูงของเขาต่อสู้กับการตัดสินใจที่จะต่อสู้จนตัวตายหรือยอมจำนนต่ออาณานิคมอังกฤษแห่งฮ่องกงอย่างอัปยศ',
      'image':
          'https://www.24-hd.com/wp-content/uploads/2023/03/Battlebox-2023.jpg',
    },
    {
      'title': '1917 (2019)',
      'description':
          'แชม เมนเดส ผู้กำกับรางวัลออสการ์ที่เคยมีผลงานอย่าง Skyfall, Spectre และ American Beauty นำเสนอมุมมองที่แตกต่างในภาพยนตร์เกี่ยวกับสงครามโลกครั้งที่ 1 ในภาพยนตร์ 1917 โดยได้ โรเจอร์ ดีกินส์ ผู้กำกับภาพเจ้าของรางวัลออสการ์ รับหน้าที่ผู้กำกับภาพ ภาพยนตร์ถ่ายทอดมุมมองของสงครามโดยใช้การเล่าเรื่องราวแบบเรียลไทม์ เป็นภาพยนตร์เล่าเรื่องแบบช็อตเดียว ซึ่งจะทำให้ผู้ชมรู้สึกเสมือนอยู่ในสนามรบ ระหว่างสงครามโลกครั้งที่ 1 ทหารอังกฤษ',
      'image': 'https://www.24-hd.com/wp-content/uploads/2022/09/1917-2019.jpg',
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
                title: const Text("สงคราม War",
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
                    Text('VSM 5.0', style: TextStyle(color: Colors.black)),
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
                    Navigator.pushNamed(context, '/Narvik');
                  },
                ),
                ListTile(
                  leading: Image.network(movies[1]['image']!),
                  title: Text(
                    movies[1]['title']!,
                    style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                  ),
                  subtitle: Row(children: const <Widget>[
                    Text('VSM 3.9', style: TextStyle(color: Colors.black)),
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
                    Navigator.pushNamed(context, '/Saving_Private_Ryan');
                  },
                ),
                ListTile(
                  leading: Image.network(movies[2]['image']!),
                  title: Text(
                    movies[2]['title']!,
                    style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                  ),
                  subtitle: Row(children: const <Widget>[
                    Text('VSM 3.9', style: TextStyle(color: Colors.black)),
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
                    Navigator.pushNamed(context, '/Battlebox');
                  },
                ),
                ListTile(
                  leading: Image.network(movies[3]['image']!),
                  title: Text(
                    movies[3]['title']!,
                    style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                  ),
                  subtitle: Row(children: const <Widget>[
                    Text('VSM 3.9', style: TextStyle(color: Colors.black)),
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
                    Navigator.pushNamed(context, '/The_1917');
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
      'title': 'Narvik (2023) นาร์วิค',
      'description': 'เมษายน พ.ศ. 2483 สายตาของโลกจับจ้องไปที่นาร์วิค...',
      'image':
          'https://www.24-hd.com/wp-content/uploads/2023/01/Narvik-2023-%E0%B8%99%E0%B8%B2%E0%B8%A3%E0%B9%8C%E0%B8%A7%E0%B8%B4%E0%B8%84.jpg',
    },
    {
      'title': 'Saving Private Ryan (1998) เซฟวิ่ง ไพรเวท ไรอัน ฝ่าสมรภูมินรก',
      'description':
          'สงครามโลกครั้งที่สอง หลังการบุกหาดโอมาฮ่าเมื่อวันที่ 6 มิถุนายน ค.ศ. 1944 แล้ว กองทัพอเมริกันประสบความสูญเสียเป็นอย่างมาก ทหารหลายคนบาดเจ็บ พิการ และล้มตาย ร้อยเอก จอห์น มิลเลอร์ (ทอม แฮงค์) ผู้นำกองทหารกองหนึ่ง ก็พบกับความสูญเสียของผู้ใต้บังคับบัญชาในครั้งนี้ด้วย',
      'image':
          'https://www.24-hd.com/wp-content/uploads/2023/02/Saving-Private-Ryan-1998-%E0%B9%80%E0%B8%8B%E0%B8%9F%E0%B8%A7%E0%B8%B4%E0%B9%88%E0%B8%87-%E0%B9%84%E0%B8%9E%E0%B8%A3%E0%B9%80%E0%B8%A7%E0%B8%97-%E0%B9%84%E0%B8%A3%E0%B8%AD%E0%B8%B1%E0%B8%99-%E0%B8%9D%E0%B9%88%E0%B8%B2%E0%B8%AA%E0%B8%A1%E0%B8%A3%E0%B8%A0%E0%B8%B9%E0%B8%A1%E0%B8%B4%E0%B8%99%E0%B8%A3%E0%B8%81.jpg',
    },
    {
      'title': 'Battlebox (2023)',
      'description':
          'ด้วยการโจมตีอย่างกะทันหันโดยญี่ปุ่น พลตรี Maltby ของอังกฤษและเจ้าหน้าที่ระดับสูงของเขาต่อสู้กับการตัดสินใจที่จะต่อสู้จนตัวตายหรือยอมจำนนต่ออาณานิคมอังกฤษแห่งฮ่องกงอย่างอัปยศ',
      'image':
          'https://www.24-hd.com/wp-content/uploads/2023/03/Battlebox-2023.jpg',
    },
    {
      'title': '1917 (2019)',
      'description':
          'แชม เมนเดส ผู้กำกับรางวัลออสการ์ที่เคยมีผลงานอย่าง Skyfall, Spectre และ American Beauty นำเสนอมุมมองที่แตกต่างในภาพยนตร์เกี่ยวกับสงครามโลกครั้งที่ 1 ในภาพยนตร์ 1917 โดยได้ โรเจอร์ ดีกินส์ ผู้กำกับภาพเจ้าของรางวัลออสการ์ รับหน้าที่ผู้กำกับภาพ ภาพยนตร์ถ่ายทอดมุมมองของสงครามโดยใช้การเล่าเรื่องราวแบบเรียลไทม์ เป็นภาพยนตร์เล่าเรื่องแบบช็อตเดียว ซึ่งจะทำให้ผู้ชมรู้สึกเสมือนอยู่ในสนามรบ ระหว่างสงครามโลกครั้งที่ 1 ทหารอังกฤษ',
      'image': 'https://www.24-hd.com/wp-content/uploads/2022/09/1917-2019.jpg',
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
      'title': 'Narvik (2023) นาร์วิค',
      'description':
          'เมษายน พ.ศ. 2483 สายตาของโลกจับจ้องไปที่นาร์วิค เมืองเล็กๆ ทางตอนเหนือของนอร์เวย์ ซึ่งเป็นแหล่งแร่เหล็กที่จำเป็นสำหรับเครื่องจักรสงครามของฮิตเตอร์ ตลอดสองเดือนแห่งสงครามฤดูหนาวอันดุเดือด ฮิตเลอร์พ่ายแพ้ครั้งแรก',
      'image':
          'https://www.24-hd.com/wp-content/uploads/2023/01/Narvik-2023-%E0%B8%99%E0%B8%B2%E0%B8%A3%E0%B9%8C%E0%B8%A7%E0%B8%B4%E0%B8%84.jpg',
    },
    {
      'title': 'Saving Private Ryan (1998) เซฟวิ่ง ไพรเวท ไรอัน ฝ่าสมรภูมินรก',
      'description': 'สงครามโลกครั้งที่สอง หลังการบุกหาดโอมาฮ่า...',
      'image':
          'https://www.24-hd.com/wp-content/uploads/2023/02/Saving-Private-Ryan-1998-%E0%B9%80%E0%B8%8B%E0%B8%9F%E0%B8%A7%E0%B8%B4%E0%B9%88%E0%B8%87-%E0%B9%84%E0%B8%9E%E0%B8%A3%E0%B9%80%E0%B8%A7%E0%B8%97-%E0%B9%84%E0%B8%A3%E0%B8%AD%E0%B8%B1%E0%B8%99-%E0%B8%9D%E0%B9%88%E0%B8%B2%E0%B8%AA%E0%B8%A1%E0%B8%A3%E0%B8%A0%E0%B8%B9%E0%B8%A1%E0%B8%B4%E0%B8%99%E0%B8%A3%E0%B8%81.jpg',
    },
    {
      'title': 'Battlebox (2023)',
      'description':
          'ด้วยการโจมตีอย่างกะทันหันโดยญี่ปุ่น พลตรี Maltby ของอังกฤษและเจ้าหน้าที่ระดับสูงของเขาต่อสู้กับการตัดสินใจที่จะต่อสู้จนตัวตายหรือยอมจำนนต่ออาณานิคมอังกฤษแห่งฮ่องกงอย่างอัปยศ',
      'image':
          'https://www.24-hd.com/wp-content/uploads/2023/03/Battlebox-2023.jpg',
    },
    {
      'title': '1917 (2019)',
      'description':
          'แชม เมนเดส ผู้กำกับรางวัลออสการ์ที่เคยมีผลงานอย่าง Skyfall, Spectre และ American Beauty นำเสนอมุมมองที่แตกต่างในภาพยนตร์เกี่ยวกับสงครามโลกครั้งที่ 1 ในภาพยนตร์ 1917 โดยได้ โรเจอร์ ดีกินส์ ผู้กำกับภาพเจ้าของรางวัลออสการ์ รับหน้าที่ผู้กำกับภาพ ภาพยนตร์ถ่ายทอดมุมมองของสงครามโดยใช้การเล่าเรื่องราวแบบเรียลไทม์ เป็นภาพยนตร์เล่าเรื่องแบบช็อตเดียว ซึ่งจะทำให้ผู้ชมรู้สึกเสมือนอยู่ในสนามรบ ระหว่างสงครามโลกครั้งที่ 1 ทหารอังกฤษ',
      'image': 'https://www.24-hd.com/wp-content/uploads/2022/09/1917-2019.jpg',
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
      'title': 'Narvik (2023) นาร์วิค',
      'description':
          'เมษายน พ.ศ. 2483 สายตาของโลกจับจ้องไปที่นาร์วิค เมืองเล็กๆ ทางตอนเหนือของนอร์เวย์ ซึ่งเป็นแหล่งแร่เหล็กที่จำเป็นสำหรับเครื่องจักรสงครามของฮิตเตอร์ ตลอดสองเดือนแห่งสงครามฤดูหนาวอันดุเดือด ฮิตเลอร์พ่ายแพ้ครั้งแรก',
      'image':
          'https://www.24-hd.com/wp-content/uploads/2023/01/Narvik-2023-%E0%B8%99%E0%B8%B2%E0%B8%A3%E0%B9%8C%E0%B8%A7%E0%B8%B4%E0%B8%84.jpg',
    },
    {
      'title': 'Saving Private Ryan (1998) เซฟวิ่ง ไพรเวท ไรอัน ฝ่าสมรภูมินรก',
      'description':
          'สงครามโลกครั้งที่สอง หลังการบุกหาดโอมาฮ่าเมื่อวันที่ 6 มิถุนายน ค.ศ. 1944 แล้ว กองทัพอเมริกันประสบความสูญเสียเป็นอย่างมาก ทหารหลายคนบาดเจ็บ พิการ และล้มตาย ร้อยเอก จอห์น มิลเลอร์ (ทอม แฮงค์) ผู้นำกองทหารกองหนึ่ง ก็พบกับความสูญเสียของผู้ใต้บังคับบัญชาในครั้งนี้ด้วย',
      'image':
          'https://www.24-hd.com/wp-content/uploads/2023/02/Saving-Private-Ryan-1998-%E0%B9%80%E0%B8%8B%E0%B8%9F%E0%B8%A7%E0%B8%B4%E0%B9%88%E0%B8%87-%E0%B9%84%E0%B8%9E%E0%B8%A3%E0%B9%80%E0%B8%A7%E0%B8%97-%E0%B9%84%E0%B8%A3%E0%B8%AD%E0%B8%B1%E0%B8%99-%E0%B8%9D%E0%B9%88%E0%B8%B2%E0%B8%AA%E0%B8%A1%E0%B8%A3%E0%B8%A0%E0%B8%B9%E0%B8%A1%E0%B8%B4%E0%B8%99%E0%B8%A3%E0%B8%81.jpg',
    },
    {
      'title': 'Battlebox (2023)',
      'description': 'ด้วยการโจมตีอย่างกะทันหันโดยญี่ปุ่น พลตรี Maltby',
      'image':
          'https://www.24-hd.com/wp-content/uploads/2023/03/Battlebox-2023.jpg',
    },
    {
      'title': '1917 (2019)',
      'description':
          'แชม เมนเดส ผู้กำกับรางวัลออสการ์ที่เคยมีผลงานอย่าง Skyfall, Spectre และ American Beauty นำเสนอมุมมองที่แตกต่างในภาพยนตร์เกี่ยวกับสงครามโลกครั้งที่ 1 ในภาพยนตร์ 1917 โดยได้ โรเจอร์ ดีกินส์ ผู้กำกับภาพเจ้าของรางวัลออสการ์ รับหน้าที่ผู้กำกับภาพ ภาพยนตร์ถ่ายทอดมุมมองของสงครามโดยใช้การเล่าเรื่องราวแบบเรียลไทม์ เป็นภาพยนตร์เล่าเรื่องแบบช็อตเดียว ซึ่งจะทำให้ผู้ชมรู้สึกเสมือนอยู่ในสนามรบ ระหว่างสงครามโลกครั้งที่ 1 ทหารอังกฤษ',
      'image': 'https://www.24-hd.com/wp-content/uploads/2022/09/1917-2019.jpg',
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
      'title': 'Narvik (2023) นาร์วิค',
      'description':
          'เมษายน พ.ศ. 2483 สายตาของโลกจับจ้องไปที่นาร์วิค เมืองเล็กๆ ทางตอนเหนือของนอร์เวย์ ซึ่งเป็นแหล่งแร่เหล็กที่จำเป็นสำหรับเครื่องจักรสงครามของฮิตเตอร์ ตลอดสองเดือนแห่งสงครามฤดูหนาวอันดุเดือด ฮิตเลอร์พ่ายแพ้ครั้งแรก',
      'image':
          'https://www.24-hd.com/wp-content/uploads/2023/01/Narvik-2023-%E0%B8%99%E0%B8%B2%E0%B8%A3%E0%B9%8C%E0%B8%A7%E0%B8%B4%E0%B8%84.jpg',
    },
    {
      'title': 'Saving Private Ryan (1998) เซฟวิ่ง ไพรเวท ไรอัน ฝ่าสมรภูมินรก',
      'description':
          'สงครามโลกครั้งที่สอง หลังการบุกหาดโอมาฮ่าเมื่อวันที่ 6 มิถุนายน ค.ศ. 1944 แล้ว กองทัพอเมริกันประสบความสูญเสียเป็นอย่างมาก ทหารหลายคนบาดเจ็บ พิการ และล้มตาย ร้อยเอก จอห์น มิลเลอร์ (ทอม แฮงค์) ผู้นำกองทหารกองหนึ่ง ก็พบกับความสูญเสียของผู้ใต้บังคับบัญชาในครั้งนี้ด้วย',
      'image':
          'https://www.24-hd.com/wp-content/uploads/2023/02/Saving-Private-Ryan-1998-%E0%B9%80%E0%B8%8B%E0%B8%9F%E0%B8%A7%E0%B8%B4%E0%B9%88%E0%B8%87-%E0%B9%84%E0%B8%9E%E0%B8%A3%E0%B9%80%E0%B8%A7%E0%B8%97-%E0%B9%84%E0%B8%A3%E0%B8%AD%E0%B8%B1%E0%B8%99-%E0%B8%9D%E0%B9%88%E0%B8%B2%E0%B8%AA%E0%B8%A1%E0%B8%A3%E0%B8%A0%E0%B8%B9%E0%B8%A1%E0%B8%B4%E0%B8%99%E0%B8%A3%E0%B8%81.jpg',
    },
    {
      'title': 'Battlebox (2023)',
      'description':
          'ด้วยการโจมตีอย่างกะทันหันโดยญี่ปุ่น พลตรี Maltby ของอังกฤษและเจ้าหน้าที่ระดับสูงของเขาต่อสู้กับการตัดสินใจที่จะต่อสู้จนตัวตายหรือยอมจำนนต่ออาณานิคมอังกฤษแห่งฮ่องกงอย่างอัปยศ',
      'image':
          'https://www.24-hd.com/wp-content/uploads/2023/03/Battlebox-2023.jpg',
    },
    {
      'title': '1917 (2019)',
      'description':
          'แชม เมนเดส ผู้กำกับรางวัลออสการ์ที่เคยมีผลงานอย่าง Skyfall...',
      'image': 'https://www.24-hd.com/wp-content/uploads/2022/09/1917-2019.jpg',
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
