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

class Sci_fipage extends StatefulWidget {
  const Sci_fipage({Key? key}) : super(key: key);
  @override
  _Sci_fipageState createState() => _Sci_fipageState();
}

class _Sci_fipageState extends State<Sci_fipage> {
  final List<Map<String, String>> movies = [
    {
      'title': '2012 (2009) วันสิ้นโลก',
      'description':
          'ตามปฏิทินโบราณของชาวมายา ทำนายไว้ว่าโลกจะพบกับจุดจบซึ่งจะเกิดเหตุในช่วง 21 ธันวาคม 2012 แจ็คสัน เคอร์ติส (จอห์น คูแซค) และลูกอีกสองคนอยู่ระหว่างการเดินทางไปเยลโล่สโตน เมื่อความลับของอโพคาลิพส์ที่แสนอันตรายถูกเปิดเผย แจ็คสัน ต้องปกป้องครอบครัวของเขาจากแผ่นดินไหว ลาวาระเบิด สึนามิ และภัยธรรมชาติอื่นๆ เหมือนที่เผ่ามายันโบราณเคยวาดถึงวันแห่งอโพคาลิพส์ไว้',
      'image':
          'https://www.24-hd.com/wp-content/uploads/2022/12/2012-2009-%E0%B8%A7%E0%B8%B1%E0%B8%99%E0%B8%AA%E0%B8%B4%E0%B9%89%E0%B8%99%E0%B9%82%E0%B8%A5%E0%B8%81.jpg',
    },
    {
      'title': 'Moonfall (2022) วันวิบัติ จันทร์ถล่มโลก',
      'description':
          'โรแลนด์ เอ็มเมอริค เจ้าพ่อหนังหายนะภัยพิบัติผู้สร้าง Independence Day , The Day After Tomorrow, 2012 กับการกลับมาใน Moonfall เป็นหนังภัยพิบัติที่เกิดจากดวงจันทร์ที่วงโครของมันกำลังจะพุ่งเข้าหาโลก โดยมีนักบินอวกาศและนักทฤษฎีวิทยาศาสตร์ช่วยกันหาวิธีหยุดยั้งการพุ่งชนในครั้งนี้ ซึ่งพวกเขามีเวลาไม่กี่สัปดาห์เท่านั้นเพื่อไม่ให้มันทำลายล้างโลก',
      'image':
          'https://www.24-hd.com/wp-content/uploads/2022/12/Moonfall-2022-%E0%B8%A7%E0%B8%B1%E0%B8%99%E0%B8%A7%E0%B8%B4%E0%B8%9A%E0%B8%B1%E0%B8%95%E0%B8%B4-%E0%B8%88%E0%B8%B1%E0%B8%99%E0%B8%97%E0%B8%A3%E0%B9%8C%E0%B8%96%E0%B8%A5%E0%B9%88%E0%B8%A1%E0%B9%82%E0%B8%A5%E0%B8%81.jpg',
    },
    {
      'title':
          'The Day After Tomorrow (2004) เดอะ เดย์ อ๊าฟเตอร์ ทูมอร์โรว์ วิกฤติวันสิ้นโลก',
      'description':
          'เมื่อโลกประสบปัญหาเรือนกระจกและภาวะโลกร้อน อันนำมาซึ่งมหาภัยพิบัติต่างๆ ซึ่งส่งผลให้โลกเข้าสู่ยุคน้ำแข็งอีกครั้ง นักวิทยาศาตร์ผู้หนึ่งซึ่งเป็นศูนย์กลางของเรื่องราว เร่งหาทางป้องกันหายนะ และเวลาเดียวกันก็พยายามช่วยเหลือลูกชายของเขาที่ติดอยู่ในนิวยอร์ค เมืองที่อยู่ใจกลางการเปลี่ยนแปลงสู่ยุคน้ำแข็งของโลก จากผู้กำกับ ID-4 กับงานสเปเชี่ยลเอฟเฟ็กต์ระดับสุดยอด เจ้าของฉากพายุทอร์นาโดถล่มแอล.เอ., ฉากคลื่นยักษ์ถล่มนิวยอร์ค ที่ตื่นตะลึง',
      'image':
          'https://www.24-hd.com/wp-content/uploads/2022/12/The-Day-After-Tomorrow-2004.jpg',
    },
    {
      'title': 'Deep Impact (1998) วันสิ้นโลก ฟ้าถล่มแผ่นดินทลาย',
      'description':
          'คุณจะทำอย่างไร ถ้ารู้ว่าเหลือเวลาอีกไม่กี่วัน โลกจะถึงคราดับสิ้น และมนุษย์จะถูกล้างเผ่าพันธุ์ด้วยการพุ่งชนของอุกกาบาตขนาดยักษ์ นับถอยหลังสู่วันสิ้นโลก จากการกำกับของ มิมิ ลีเดอร์ (The Peacemaker) นำแสดงโดย โรเบิร์ท ดูวัลล์, เท เลโอนี, อีไลจาห์ วู้ด และมอร์แกน ฟรีแมน ในภาพยนตร์เรื่องยิ่งใหญ่ที่รวมความมหึมาของมหันตภัยกับความรักที่ใหญ่กว่าของมนุษย์เข้าไว้ด้วยกัน',
      'image':
          'https://www.24-hd.com/wp-content/uploads/2022/12/Deep-Impact-1998.jpg',
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
                title: const Text("วิทยาศาสตร์ Sci-fi",
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
                    Text('VSM 8.4', style: TextStyle(color: Colors.black)),
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
                    Navigator.pushNamed(context, '/The_2012');
                  },
                ),
                ListTile(
                  leading: Image.network(movies[1]['image']!),
                  title: Text(
                    movies[1]['title']!,
                    style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                  ),
                  subtitle: Row(children: const <Widget>[
                    Text('VSM 5.4', style: TextStyle(color: Colors.black)),
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
                    Navigator.pushNamed(context, '/Moonfall');
                  },
                ),
                ListTile(
                  leading: Image.network(movies[2]['image']!),
                  title: Text(
                    movies[2]['title']!,
                    style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                  ),
                  subtitle: Row(children: const <Widget>[
                    Text('VSM 5.0', style: TextStyle(color: Colors.black)),
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
                    Navigator.pushNamed(context, '/The_Day_After_Tomorrow');
                  },
                ),
                ListTile(
                  leading: Image.network(movies[3]['image']!),
                  title: Text(
                    movies[3]['title']!,
                    style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                  ),
                  subtitle: Row(children: const <Widget>[
                    Text('VSM 5.5', style: TextStyle(color: Colors.black)),
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
                    Navigator.pushNamed(context, '/Deep_Impact');
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
      'title': '2012 (2009) วันสิ้นโลก',
      'description': 'ตามปฏิทินโบราณของชาวมายา ทำนายไว้ว่าโลก...',
      'image':
          'https://www.24-hd.com/wp-content/uploads/2022/12/2012-2009-%E0%B8%A7%E0%B8%B1%E0%B8%99%E0%B8%AA%E0%B8%B4%E0%B9%89%E0%B8%99%E0%B9%82%E0%B8%A5%E0%B8%81.jpg',
    },
    {
      'title': 'Moonfall (2022) วันวิบัติ จันทร์ถล่มโลก',
      'description':
          'โรแลนด์ เอ็มเมอริค เจ้าพ่อหนังหายนะภัยพิบัติผู้สร้าง Independence Day , The Day After Tomorrow, 2012 กับการกลับมาใน Moonfall เป็นหนังภัยพิบัติที่เกิดจากดวงจันทร์ที่วงโครของมันกำลังจะพุ่งเข้าหาโลก โดยมีนักบินอวกาศและนักทฤษฎีวิทยาศาสตร์ช่วยกันหาวิธีหยุดยั้งการพุ่งชนในครั้งนี้ ซึ่งพวกเขามีเวลาไม่กี่สัปดาห์เท่านั้นเพื่อไม่ให้มันทำลายล้างโลก',
      'image':
          'https://www.24-hd.com/wp-content/uploads/2022/12/Moonfall-2022-%E0%B8%A7%E0%B8%B1%E0%B8%99%E0%B8%A7%E0%B8%B4%E0%B8%9A%E0%B8%B1%E0%B8%95%E0%B8%B4-%E0%B8%88%E0%B8%B1%E0%B8%99%E0%B8%97%E0%B8%A3%E0%B9%8C%E0%B8%96%E0%B8%A5%E0%B9%88%E0%B8%A1%E0%B9%82%E0%B8%A5%E0%B8%81.jpg',
    },
    {
      'title':
          'The Day After Tomorrow (2004) เดอะ เดย์ อ๊าฟเตอร์ ทูมอร์โรว์ วิกฤติวันสิ้นโลก',
      'description':
          'เมื่อโลกประสบปัญหาเรือนกระจกและภาวะโลกร้อน อันนำมาซึ่งมหาภัยพิบัติต่างๆ ซึ่งส่งผลให้โลกเข้าสู่ยุคน้ำแข็งอีกครั้ง นักวิทยาศาตร์ผู้หนึ่งซึ่งเป็นศูนย์กลางของเรื่องราว เร่งหาทางป้องกันหายนะ และเวลาเดียวกันก็พยายามช่วยเหลือลูกชายของเขาที่ติดอยู่ในนิวยอร์ค เมืองที่อยู่ใจกลางการเปลี่ยนแปลงสู่ยุคน้ำแข็งของโลก จากผู้กำกับ ID-4 กับงานสเปเชี่ยลเอฟเฟ็กต์ระดับสุดยอด เจ้าของฉากพายุทอร์นาโดถล่มแอล.เอ., ฉากคลื่นยักษ์ถล่มนิวยอร์ค ที่ตื่นตะลึง',
      'image':
          'https://www.24-hd.com/wp-content/uploads/2022/12/The-Day-After-Tomorrow-2004.jpg',
    },
    {
      'title': 'Deep Impact (1998) วันสิ้นโลก ฟ้าถล่มแผ่นดินทลาย',
      'description':
          'คุณจะทำอย่างไร ถ้ารู้ว่าเหลือเวลาอีกไม่กี่วัน โลกจะถึงคราดับสิ้น และมนุษย์จะถูกล้างเผ่าพันธุ์ด้วยการพุ่งชนของอุกกาบาตขนาดยักษ์ นับถอยหลังสู่วันสิ้นโลก จากการกำกับของ มิมิ ลีเดอร์ (The Peacemaker) นำแสดงโดย โรเบิร์ท ดูวัลล์, เท เลโอนี, อีไลจาห์ วู้ด และมอร์แกน ฟรีแมน ในภาพยนตร์เรื่องยิ่งใหญ่ที่รวมความมหึมาของมหันตภัยกับความรักที่ใหญ่กว่าของมนุษย์เข้าไว้ด้วยกัน',
      'image':
          'https://www.24-hd.com/wp-content/uploads/2022/12/Deep-Impact-1998.jpg',
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
      'title': '2012 (2009) วันสิ้นโลก',
      'description':
          'ตามปฏิทินโบราณของชาวมายา ทำนายไว้ว่าโลกจะพบกับจุดจบซึ่งจะเกิดเหตุในช่วง 21 ธันวาคม 2012 แจ็คสัน เคอร์ติส (จอห์น คูแซค) และลูกอีกสองคนอยู่ระหว่างการเดินทางไปเยลโล่สโตน เมื่อความลับของอโพคาลิพส์ที่แสนอันตรายถูกเปิดเผย แจ็คสัน ต้องปกป้องครอบครัวของเขาจากแผ่นดินไหว ลาวาระเบิด สึนามิ และภัยธรรมชาติอื่นๆ เหมือนที่เผ่ามายันโบราณเคยวาดถึงวันแห่งอโพคาลิพส์ไว้',
      'image':
          'https://www.24-hd.com/wp-content/uploads/2022/12/2012-2009-%E0%B8%A7%E0%B8%B1%E0%B8%99%E0%B8%AA%E0%B8%B4%E0%B9%89%E0%B8%99%E0%B9%82%E0%B8%A5%E0%B8%81.jpg',
    },
    {
      'title': 'Moonfall (2022) วันวิบัติ จันทร์ถล่มโลก',
      'description':
          'โรแลนด์ เอ็มเมอริค เจ้าพ่อหนังหายนะภัยพิบัติผู้สร้าง Independence Day...',
      'image':
          'https://www.24-hd.com/wp-content/uploads/2022/12/Moonfall-2022-%E0%B8%A7%E0%B8%B1%E0%B8%99%E0%B8%A7%E0%B8%B4%E0%B8%9A%E0%B8%B1%E0%B8%95%E0%B8%B4-%E0%B8%88%E0%B8%B1%E0%B8%99%E0%B8%97%E0%B8%A3%E0%B9%8C%E0%B8%96%E0%B8%A5%E0%B9%88%E0%B8%A1%E0%B9%82%E0%B8%A5%E0%B8%81.jpg',
    },
    {
      'title':
          'The Day After Tomorrow (2004) เดอะ เดย์ อ๊าฟเตอร์ ทูมอร์โรว์ วิกฤติวันสิ้นโลก',
      'description':
          'เมื่อโลกประสบปัญหาเรือนกระจกและภาวะโลกร้อน อันนำมาซึ่งมหาภัยพิบัติต่างๆ ซึ่งส่งผลให้โลกเข้าสู่ยุคน้ำแข็งอีกครั้ง นักวิทยาศาตร์ผู้หนึ่งซึ่งเป็นศูนย์กลางของเรื่องราว เร่งหาทางป้องกันหายนะ และเวลาเดียวกันก็พยายามช่วยเหลือลูกชายของเขาที่ติดอยู่ในนิวยอร์ค เมืองที่อยู่ใจกลางการเปลี่ยนแปลงสู่ยุคน้ำแข็งของโลก จากผู้กำกับ ID-4 กับงานสเปเชี่ยลเอฟเฟ็กต์ระดับสุดยอด เจ้าของฉากพายุทอร์นาโดถล่มแอล.เอ., ฉากคลื่นยักษ์ถล่มนิวยอร์ค ที่ตื่นตะลึง',
      'image':
          'https://www.24-hd.com/wp-content/uploads/2022/12/The-Day-After-Tomorrow-2004.jpg',
    },
    {
      'title': 'Deep Impact (1998) วันสิ้นโลก ฟ้าถล่มแผ่นดินทลาย',
      'description':
          'คุณจะทำอย่างไร ถ้ารู้ว่าเหลือเวลาอีกไม่กี่วัน โลกจะถึงคราดับสิ้น และมนุษย์จะถูกล้างเผ่าพันธุ์ด้วยการพุ่งชนของอุกกาบาตขนาดยักษ์ นับถอยหลังสู่วันสิ้นโลก จากการกำกับของ มิมิ ลีเดอร์ (The Peacemaker) นำแสดงโดย โรเบิร์ท ดูวัลล์, เท เลโอนี, อีไลจาห์ วู้ด และมอร์แกน ฟรีแมน ในภาพยนตร์เรื่องยิ่งใหญ่ที่รวมความมหึมาของมหันตภัยกับความรักที่ใหญ่กว่าของมนุษย์เข้าไว้ด้วยกัน',
      'image':
          'https://www.24-hd.com/wp-content/uploads/2022/12/Deep-Impact-1998.jpg',
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
      'title': '2012 (2009) วันสิ้นโลก',
      'description':
          'ตามปฏิทินโบราณของชาวมายา ทำนายไว้ว่าโลกจะพบกับจุดจบซึ่งจะเกิดเหตุในช่วง 21 ธันวาคม 2012 แจ็คสัน เคอร์ติส (จอห์น คูแซค) และลูกอีกสองคนอยู่ระหว่างการเดินทางไปเยลโล่สโตน เมื่อความลับของอโพคาลิพส์ที่แสนอันตรายถูกเปิดเผย แจ็คสัน ต้องปกป้องครอบครัวของเขาจากแผ่นดินไหว ลาวาระเบิด สึนามิ และภัยธรรมชาติอื่นๆ เหมือนที่เผ่ามายันโบราณเคยวาดถึงวันแห่งอโพคาลิพส์ไว้',
      'image':
          'https://www.24-hd.com/wp-content/uploads/2022/12/2012-2009-%E0%B8%A7%E0%B8%B1%E0%B8%99%E0%B8%AA%E0%B8%B4%E0%B9%89%E0%B8%99%E0%B9%82%E0%B8%A5%E0%B8%81.jpg',
    },
    {
      'title': 'Moonfall (2022) วันวิบัติ จันทร์ถล่มโลก',
      'description':
          'โรแลนด์ เอ็มเมอริค เจ้าพ่อหนังหายนะภัยพิบัติผู้สร้าง Independence Day , The Day After Tomorrow, 2012 กับการกลับมาใน Moonfall เป็นหนังภัยพิบัติที่เกิดจากดวงจันทร์ที่วงโครของมันกำลังจะพุ่งเข้าหาโลก โดยมีนักบินอวกาศและนักทฤษฎีวิทยาศาสตร์ช่วยกันหาวิธีหยุดยั้งการพุ่งชนในครั้งนี้ ซึ่งพวกเขามีเวลาไม่กี่สัปดาห์เท่านั้นเพื่อไม่ให้มันทำลายล้างโลก',
      'image':
          'https://www.24-hd.com/wp-content/uploads/2022/12/Moonfall-2022-%E0%B8%A7%E0%B8%B1%E0%B8%99%E0%B8%A7%E0%B8%B4%E0%B8%9A%E0%B8%B1%E0%B8%95%E0%B8%B4-%E0%B8%88%E0%B8%B1%E0%B8%99%E0%B8%97%E0%B8%A3%E0%B9%8C%E0%B8%96%E0%B8%A5%E0%B9%88%E0%B8%A1%E0%B9%82%E0%B8%A5%E0%B8%81.jpg',
    },
    {
      'title':
          'The Day After Tomorrow (2004) เดอะ เดย์ อ๊าฟเตอร์ ทูมอร์โรว์ วิกฤติวันสิ้นโลก',
      'description': 'เมื่อโลกประสบปัญหาเรือนกระจกและภาวะโลกร้อน...',
      'image':
          'https://www.24-hd.com/wp-content/uploads/2022/12/The-Day-After-Tomorrow-2004.jpg',
    },
    {
      'title': 'Deep Impact (1998) วันสิ้นโลก ฟ้าถล่มแผ่นดินทลาย',
      'description':
          'คุณจะทำอย่างไร ถ้ารู้ว่าเหลือเวลาอีกไม่กี่วัน โลกจะถึงคราดับสิ้น และมนุษย์จะถูกล้างเผ่าพันธุ์ด้วยการพุ่งชนของอุกกาบาตขนาดยักษ์ นับถอยหลังสู่วันสิ้นโลก จากการกำกับของ มิมิ ลีเดอร์ (The Peacemaker) นำแสดงโดย โรเบิร์ท ดูวัลล์, เท เลโอนี, อีไลจาห์ วู้ด และมอร์แกน ฟรีแมน ในภาพยนตร์เรื่องยิ่งใหญ่ที่รวมความมหึมาของมหันตภัยกับความรักที่ใหญ่กว่าของมนุษย์เข้าไว้ด้วยกัน',
      'image':
          'https://www.24-hd.com/wp-content/uploads/2022/12/Deep-Impact-1998.jpg',
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
      'title': '2012 (2009) วันสิ้นโลก',
      'description':
          'ตามปฏิทินโบราณของชาวมายา ทำนายไว้ว่าโลกจะพบกับจุดจบซึ่งจะเกิดเหตุในช่วง 21 ธันวาคม 2012 แจ็คสัน เคอร์ติส (จอห์น คูแซค) และลูกอีกสองคนอยู่ระหว่างการเดินทางไปเยลโล่สโตน เมื่อความลับของอโพคาลิพส์ที่แสนอันตรายถูกเปิดเผย แจ็คสัน ต้องปกป้องครอบครัวของเขาจากแผ่นดินไหว ลาวาระเบิด สึนามิ และภัยธรรมชาติอื่นๆ เหมือนที่เผ่ามายันโบราณเคยวาดถึงวันแห่งอโพคาลิพส์ไว้',
      'image':
          'https://www.24-hd.com/wp-content/uploads/2022/12/2012-2009-%E0%B8%A7%E0%B8%B1%E0%B8%99%E0%B8%AA%E0%B8%B4%E0%B9%89%E0%B8%99%E0%B9%82%E0%B8%A5%E0%B8%81.jpg',
    },
    {
      'title': 'Moonfall (2022) วันวิบัติ จันทร์ถล่มโลก',
      'description':
          'โรแลนด์ เอ็มเมอริค เจ้าพ่อหนังหายนะภัยพิบัติผู้สร้าง Independence Day , The Day After Tomorrow, 2012 กับการกลับมาใน Moonfall เป็นหนังภัยพิบัติที่เกิดจากดวงจันทร์ที่วงโครของมันกำลังจะพุ่งเข้าหาโลก โดยมีนักบินอวกาศและนักทฤษฎีวิทยาศาสตร์ช่วยกันหาวิธีหยุดยั้งการพุ่งชนในครั้งนี้ ซึ่งพวกเขามีเวลาไม่กี่สัปดาห์เท่านั้นเพื่อไม่ให้มันทำลายล้างโลก',
      'image':
          'https://www.24-hd.com/wp-content/uploads/2022/12/Moonfall-2022-%E0%B8%A7%E0%B8%B1%E0%B8%99%E0%B8%A7%E0%B8%B4%E0%B8%9A%E0%B8%B1%E0%B8%95%E0%B8%B4-%E0%B8%88%E0%B8%B1%E0%B8%99%E0%B8%97%E0%B8%A3%E0%B9%8C%E0%B8%96%E0%B8%A5%E0%B9%88%E0%B8%A1%E0%B9%82%E0%B8%A5%E0%B8%81.jpg',
    },
    {
      'title':
          'The Day After Tomorrow (2004) เดอะ เดย์ อ๊าฟเตอร์ ทูมอร์โรว์ วิกฤติวันสิ้นโลก',
      'description':
          'เมื่อโลกประสบปัญหาเรือนกระจกและภาวะโลกร้อน อันนำมาซึ่งมหาภัยพิบัติต่างๆ ซึ่งส่งผลให้โลกเข้าสู่ยุคน้ำแข็งอีกครั้ง นักวิทยาศาตร์ผู้หนึ่งซึ่งเป็นศูนย์กลางของเรื่องราว เร่งหาทางป้องกันหายนะ และเวลาเดียวกันก็พยายามช่วยเหลือลูกชายของเขาที่ติดอยู่ในนิวยอร์ค เมืองที่อยู่ใจกลางการเปลี่ยนแปลงสู่ยุคน้ำแข็งของโลก จากผู้กำกับ ID-4 กับงานสเปเชี่ยลเอฟเฟ็กต์ระดับสุดยอด เจ้าของฉากพายุทอร์นาโดถล่มแอล.เอ., ฉากคลื่นยักษ์ถล่มนิวยอร์ค ที่ตื่นตะลึง',
      'image':
          'https://www.24-hd.com/wp-content/uploads/2022/12/The-Day-After-Tomorrow-2004.jpg',
    },
    {
      'title': 'Deep Impact (1998) วันสิ้นโลก ฟ้าถล่มแผ่นดินทลาย',
      'description': 'คุณจะทำอย่างไร ถ้ารู้ว่าเหลือเวลาอีกไม่กี่วัน...',
      'image':
          'https://www.24-hd.com/wp-content/uploads/2022/12/Deep-Impact-1998.jpg',
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
