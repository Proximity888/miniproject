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

class Fantasypage extends StatefulWidget {
  const Fantasypage({Key? key}) : super(key: key);
  @override
  _FantasypageState createState() => _FantasypageState();
}

class _FantasypageState extends State<Fantasypage> {
  final List<Map<String, String>> movies = [
    {
      'title': 'Avatar (2009) อวตาร',
      'description':
          'เจค ซัลลี่ (แซม เวิร์ธธิงตัน) อดีตนายทหารเรือผู้พิการที่ต้องนั่งบนรถเข็น แม้ว่าร่างกายไม่สมประกอบ แต่เจคก็ยังมีหัวใจนักรบ เขาได้รับเลือกให้ร่วมเดินทางหลายปีแสงไปยังดาวแพนโดรา ที่ซึ่งมีเหมืองแร่ล้ำค่าหายากที่เป็นหัวใจสำคัญในการแก้ปัญหาพลังงานขาดแคลนของโลก และเพราะชั้นบรรยากาศของดาวแพนโดราเป็นพิษต่อมนุษย์',
      'image':
          'https://www.24-hd.com/wp-content/uploads/2022/09/Avatar-2009.jpg',
    },
    {
      'title': 'The BFG (2016) ยักษ์ใหญ่หัวใจหล่อ',
      'description':
          'จากพรสวรรค์ของ 3 นักเล่าเรื่องอันยอดเยี่ยม โรอัลด์ ดาห์ล, วอลท์ ดิสนีย์ และสตีเวน สปีลเบิร์ก นำวรรณกรรมอันเป็นที่รัก ”เดอะ บีเอฟจี” ให้กลับมามีชีวิต กำกับโดยสปีลเบิร์ก เรื่องราวเกี่ยวข้องกับจินตนาการของเด็กหญิง และยักษ์ที่แนะนำให้เธอรู้จักกับความมหัศจรรย์ของดินแดนยักษ์ เดอะ บีเอฟจี (มาร์ค ไรแลนซ์) เป็นยักษ์ใหญ่ใจดี สูง 24 ฟุต ผู้มีหูอันใหญ่โต และประสาทการดมกลิ่นเป็นเลิศ เขาค่อนข้างจะทึ่มและขี้อาย ในทางกลับกัน ยักษ์ตนอื่น ๆ อย่าง บลัดบ็อตเลอร์ (บิล เฮดเดอร์) และเฟลชลัมพ์อีตเตอร์ (เจอร์เมน เคลมองต์) ตัวใหญ่ และน่ากลัวกว่าเขามาก และเป็นที่รู้กันว่าพวกเขากินมนุษย์เป็นอาหาร',
      'image':
          'https://www.24-hd.com/wp-content/uploads/2022/12/The-BFG-2016-%E0%B8%A2%E0%B8%B1%E0%B8%81%E0%B8%A9%E0%B9%8C%E0%B9%83%E0%B8%AB%E0%B8%8D%E0%B9%88%E0%B8%AB%E0%B8%B1%E0%B8%A7%E0%B9%83%E0%B8%88%E0%B8%AB%E0%B8%A5%E0%B9%88%E0%B8%AD.jpg',
    },
    {
      'title': 'Dracula Untold (2014) ตำนานลับโลกไม่รู้',
      'description':
          'ตำนานลับโลกไม่รู้ เรื่องนี้เล่าถึงเจ้าชายวลาด (รับบทโดย Luke Evans) ที่มีชีวิตในวัยเด็กอยู่กับชาวเติร์ค มหาอำนาจที่ยิ่งใหญ่ในยุคนั้น กาลเวลาผ่านไป เจ้าชายวลาดได้กลับมายังปราสาทของตัวเองอยู่อย่างสงบสุข จนกระทั่งชาวเติร์คคิดทำศึกสงครามอีกครั้ง และชาวเติร์คมีความต้องการให้เจ้าชายวลาดส่งมอบเด็ก 1,000คน ให้เป็นเครื่องมือบรรณาการทางทหารซึ่งหนึ่งในนั้นมีลูกชายของเจ้าชายวลาดอยู่ด้วย เจ้าชายวลาดผู้ไม่มีกำลังทหารอยู่ในมือจึงทำได้แค่เพียงหันหน้าเข้าหาอำนาจมืดที่เปลี่ยนแปลงเขาไปตลอดกาล',
      'image':
          'https://www.24-hd.com/wp-content/uploads/2023/02/Dracula-Untold-2014.jpg',
    },
    {
      'title':
          'Star Wars 1 Episode I The Phantom Menace (1999) สตาร์ วอร์ส 1 ภัยซ่อนเร้น',
      'description':
          'เรื่องราวของอาจารย์เจไดไควกอน จินน์ และศิษย์โอบีวัน เคโนบี ที่ได้รับมอบหมายภารกิจให้ร่วมเดินทางจากดาวนาบูไปยังคอรัสซานท์กับราชินีอมิดาลาในฐานะองครักษ์ เพื่อหาหนทางยุติความขัดแย้งทางการค้าที่มีโอกาสถูกจุดชนวนเป็นสงคราม',
      'image':
          'https://www.24-hd.com/wp-content/uploads/2023/03/Star-Wars-1-Episode-I-The-Phantom-Menace-1999.jpg',
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
                title: const Text("แฟนตาซี Fantasy",
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
                    Text('VSM 9.8', style: TextStyle(color: Colors.black)),
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
                    Navigator.pushNamed(context, '/Avatar');
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
                    Navigator.pushNamed(context, '/The_BFG');
                  },
                ),
                ListTile(
                  leading: Image.network(movies[2]['image']!),
                  title: Text(
                    movies[2]['title']!,
                    style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                  ),
                  subtitle: Row(children: const <Widget>[
                    Text('VSM 6.8', style: TextStyle(color: Colors.black)),
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
                    Navigator.pushNamed(context, '/Dracula_Untold');
                  },
                ),
                ListTile(
                  leading: Image.network(movies[3]['image']!),
                  title: Text(
                    movies[3]['title']!,
                    style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                  ),
                  subtitle: Row(children: const <Widget>[
                    Text('VSM 7.8', style: TextStyle(color: Colors.black)),
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
                    Navigator.pushNamed(context, '/Star_Wars_1');
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
      'title': 'Avatar (2009) อวตาร',
      'description':
          'เจค ซัลลี่ (แซม เวิร์ธธิงตัน) อดีตนายทหารเรือผู้พิการที่ต้องนั่งบนรถเข็น...',
      'image':
          'https://www.24-hd.com/wp-content/uploads/2022/09/Avatar-2009.jpg',
    },
    {
      'title': 'The BFG (2016) ยักษ์ใหญ่หัวใจหล่อ',
      'description':
          'จากพรสวรรค์ของ 3 นักเล่าเรื่องอันยอดเยี่ยม โรอัลด์ ดาห์ล, วอลท์ ดิสนีย์ และสตีเวน สปีลเบิร์ก นำวรรณกรรมอันเป็นที่รัก ”เดอะ บีเอฟจี” ให้กลับมามีชีวิต กำกับโดยสปีลเบิร์ก เรื่องราวเกี่ยวข้องกับจินตนาการของเด็กหญิง และยักษ์ที่แนะนำให้เธอรู้จักกับความมหัศจรรย์ของดินแดนยักษ์ เดอะ บีเอฟจี (มาร์ค ไรแลนซ์) เป็นยักษ์ใหญ่ใจดี สูง 24 ฟุต ผู้มีหูอันใหญ่โต และประสาทการดมกลิ่นเป็นเลิศ เขาค่อนข้างจะทึ่มและขี้อาย ในทางกลับกัน ยักษ์ตนอื่น ๆ อย่าง บลัดบ็อตเลอร์ (บิล เฮดเดอร์) และเฟลชลัมพ์อีตเตอร์ (เจอร์เมน เคลมองต์) ตัวใหญ่ และน่ากลัวกว่าเขามาก และเป็นที่รู้กันว่าพวกเขากินมนุษย์เป็นอาหาร',
      'image':
          'https://www.24-hd.com/wp-content/uploads/2022/12/The-BFG-2016-%E0%B8%A2%E0%B8%B1%E0%B8%81%E0%B8%A9%E0%B9%8C%E0%B9%83%E0%B8%AB%E0%B8%8D%E0%B9%88%E0%B8%AB%E0%B8%B1%E0%B8%A7%E0%B9%83%E0%B8%88%E0%B8%AB%E0%B8%A5%E0%B9%88%E0%B8%AD.jpg',
    },
    {
      'title': 'Dracula Untold (2014) ตำนานลับโลกไม่รู้',
      'description':
          'ตำนานลับโลกไม่รู้ เรื่องนี้เล่าถึงเจ้าชายวลาด (รับบทโดย Luke Evans) ที่มีชีวิตในวัยเด็กอยู่กับชาวเติร์ค มหาอำนาจที่ยิ่งใหญ่ในยุคนั้น กาลเวลาผ่านไป เจ้าชายวลาดได้กลับมายังปราสาทของตัวเองอยู่อย่างสงบสุข จนกระทั่งชาวเติร์คคิดทำศึกสงครามอีกครั้ง และชาวเติร์คมีความต้องการให้เจ้าชายวลาดส่งมอบเด็ก 1,000คน ให้เป็นเครื่องมือบรรณาการทางทหารซึ่งหนึ่งในนั้นมีลูกชายของเจ้าชายวลาดอยู่ด้วย เจ้าชายวลาดผู้ไม่มีกำลังทหารอยู่ในมือจึงทำได้แค่เพียงหันหน้าเข้าหาอำนาจมืดที่เปลี่ยนแปลงเขาไปตลอดกาล',
      'image':
          'https://www.24-hd.com/wp-content/uploads/2023/02/Dracula-Untold-2014.jpg',
    },
    {
      'title':
          'Star Wars 1 Episode I The Phantom Menace (1999) สตาร์ วอร์ส 1 ภัยซ่อนเร้น',
      'description':
          'เรื่องราวของอาจารย์เจไดไควกอน จินน์ และศิษย์โอบีวัน เคโนบี ที่ได้รับมอบหมายภารกิจให้ร่วมเดินทางจากดาวนาบูไปยังคอรัสซานท์กับราชินีอมิดาลาในฐานะองครักษ์ เพื่อหาหนทางยุติความขัดแย้งทางการค้าที่มีโอกาสถูกจุดชนวนเป็นสงคราม',
      'image':
          'https://www.24-hd.com/wp-content/uploads/2023/03/Star-Wars-1-Episode-I-The-Phantom-Menace-1999.jpg',
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
      'title': 'Avatar (2009) อวตาร',
      'description':
          'เจค ซัลลี่ (แซม เวิร์ธธิงตัน) อดีตนายทหารเรือผู้พิการที่ต้องนั่งบนรถเข็น แม้ว่าร่างกายไม่สมประกอบ แต่เจคก็ยังมีหัวใจนักรบ เขาได้รับเลือกให้ร่วมเดินทางหลายปีแสงไปยังดาวแพนโดรา ที่ซึ่งมีเหมืองแร่ล้ำค่าหายากที่เป็นหัวใจสำคัญในการแก้ปัญหาพลังงานขาดแคลนของโลก และเพราะชั้นบรรยากาศของดาวแพนโดราเป็นพิษต่อมนุษย์',
      'image':
          'https://www.24-hd.com/wp-content/uploads/2022/09/Avatar-2009.jpg',
    },
    {
      'title': 'The BFG (2016) ยักษ์ใหญ่หัวใจหล่อ',
      'description':
          'จากพรสวรรค์ของ 3 นักเล่าเรื่องอันยอดเยี่ยม โรอัลด์ ดาห์ล, วอลท์ ดิสนีย์...',
      'image':
          'https://www.24-hd.com/wp-content/uploads/2022/12/The-BFG-2016-%E0%B8%A2%E0%B8%B1%E0%B8%81%E0%B8%A9%E0%B9%8C%E0%B9%83%E0%B8%AB%E0%B8%8D%E0%B9%88%E0%B8%AB%E0%B8%B1%E0%B8%A7%E0%B9%83%E0%B8%88%E0%B8%AB%E0%B8%A5%E0%B9%88%E0%B8%AD.jpg',
    },
    {
      'title': 'Dracula Untold (2014) ตำนานลับโลกไม่รู้',
      'description':
          'ตำนานลับโลกไม่รู้ เรื่องนี้เล่าถึงเจ้าชายวลาด (รับบทโดย Luke Evans) ที่มีชีวิตในวัยเด็กอยู่กับชาวเติร์ค มหาอำนาจที่ยิ่งใหญ่ในยุคนั้น กาลเวลาผ่านไป เจ้าชายวลาดได้กลับมายังปราสาทของตัวเองอยู่อย่างสงบสุข จนกระทั่งชาวเติร์คคิดทำศึกสงครามอีกครั้ง และชาวเติร์คมีความต้องการให้เจ้าชายวลาดส่งมอบเด็ก 1,000คน ให้เป็นเครื่องมือบรรณาการทางทหารซึ่งหนึ่งในนั้นมีลูกชายของเจ้าชายวลาดอยู่ด้วย เจ้าชายวลาดผู้ไม่มีกำลังทหารอยู่ในมือจึงทำได้แค่เพียงหันหน้าเข้าหาอำนาจมืดที่เปลี่ยนแปลงเขาไปตลอดกาล',
      'image':
          'https://www.24-hd.com/wp-content/uploads/2023/02/Dracula-Untold-2014.jpg',
    },
    {
      'title':
          'Star Wars 1 Episode I The Phantom Menace (1999) สตาร์ วอร์ส 1 ภัยซ่อนเร้น',
      'description':
          'เรื่องราวของอาจารย์เจไดไควกอน จินน์ และศิษย์โอบีวัน เคโนบี ที่ได้รับมอบหมายภารกิจให้ร่วมเดินทางจากดาวนาบูไปยังคอรัสซานท์กับราชินีอมิดาลาในฐานะองครักษ์ เพื่อหาหนทางยุติความขัดแย้งทางการค้าที่มีโอกาสถูกจุดชนวนเป็นสงคราม',
      'image':
          'https://www.24-hd.com/wp-content/uploads/2023/03/Star-Wars-1-Episode-I-The-Phantom-Menace-1999.jpg',
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
      'title': 'Avatar (2009) อวตาร',
      'description':
          'เจค ซัลลี่ (แซม เวิร์ธธิงตัน) อดีตนายทหารเรือผู้พิการที่ต้องนั่งบนรถเข็น แม้ว่าร่างกายไม่สมประกอบ แต่เจคก็ยังมีหัวใจนักรบ เขาได้รับเลือกให้ร่วมเดินทางหลายปีแสงไปยังดาวแพนโดรา ที่ซึ่งมีเหมืองแร่ล้ำค่าหายากที่เป็นหัวใจสำคัญในการแก้ปัญหาพลังงานขาดแคลนของโลก และเพราะชั้นบรรยากาศของดาวแพนโดราเป็นพิษต่อมนุษย์',
      'image':
          'https://www.24-hd.com/wp-content/uploads/2022/09/Avatar-2009.jpg',
    },
    {
      'title': 'The BFG (2016) ยักษ์ใหญ่หัวใจหล่อ',
      'description':
          'จากพรสวรรค์ของ 3 นักเล่าเรื่องอันยอดเยี่ยม โรอัลด์ ดาห์ล, วอลท์ ดิสนีย์ และสตีเวน สปีลเบิร์ก นำวรรณกรรมอันเป็นที่รัก ”เดอะ บีเอฟจี” ให้กลับมามีชีวิต กำกับโดยสปีลเบิร์ก เรื่องราวเกี่ยวข้องกับจินตนาการของเด็กหญิง และยักษ์ที่แนะนำให้เธอรู้จักกับความมหัศจรรย์ของดินแดนยักษ์ เดอะ บีเอฟจี (มาร์ค ไรแลนซ์) เป็นยักษ์ใหญ่ใจดี สูง 24 ฟุต ผู้มีหูอันใหญ่โต และประสาทการดมกลิ่นเป็นเลิศ เขาค่อนข้างจะทึ่มและขี้อาย ในทางกลับกัน ยักษ์ตนอื่น ๆ อย่าง บลัดบ็อตเลอร์ (บิล เฮดเดอร์) และเฟลชลัมพ์อีตเตอร์ (เจอร์เมน เคลมองต์) ตัวใหญ่ และน่ากลัวกว่าเขามาก และเป็นที่รู้กันว่าพวกเขากินมนุษย์เป็นอาหาร',
      'image':
          'https://www.24-hd.com/wp-content/uploads/2022/12/The-BFG-2016-%E0%B8%A2%E0%B8%B1%E0%B8%81%E0%B8%A9%E0%B9%8C%E0%B9%83%E0%B8%AB%E0%B8%8D%E0%B9%88%E0%B8%AB%E0%B8%B1%E0%B8%A7%E0%B9%83%E0%B8%88%E0%B8%AB%E0%B8%A5%E0%B9%88%E0%B8%AD.jpg',
    },
    {
      'title': 'Dracula Untold (2014) ตำนานลับโลกไม่รู้',
      'description':
          'ตำนานลับโลกไม่รู้ เรื่องนี้เล่าถึงเจ้าชายวลาด (รับบทโดย Luke Evans)...',
      'image':
          'https://www.24-hd.com/wp-content/uploads/2023/02/Dracula-Untold-2014.jpg',
    },
    {
      'title':
          'Star Wars 1 Episode I The Phantom Menace (1999) สตาร์ วอร์ส 1 ภัยซ่อนเร้น',
      'description':
          'เรื่องราวของอาจารย์เจไดไควกอน จินน์ และศิษย์โอบีวัน เคโนบี ที่ได้รับมอบหมายภารกิจให้ร่วมเดินทางจากดาวนาบูไปยังคอรัสซานท์กับราชินีอมิดาลาในฐานะองครักษ์ เพื่อหาหนทางยุติความขัดแย้งทางการค้าที่มีโอกาสถูกจุดชนวนเป็นสงคราม',
      'image':
          'https://www.24-hd.com/wp-content/uploads/2023/03/Star-Wars-1-Episode-I-The-Phantom-Menace-1999.jpg',
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
      'title': 'Avatar (2009) อวตาร',
      'description':
          'เจค ซัลลี่ (แซม เวิร์ธธิงตัน) อดีตนายทหารเรือผู้พิการที่ต้องนั่งบนรถเข็น แม้ว่าร่างกายไม่สมประกอบ แต่เจคก็ยังมีหัวใจนักรบ เขาได้รับเลือกให้ร่วมเดินทางหลายปีแสงไปยังดาวแพนโดรา ที่ซึ่งมีเหมืองแร่ล้ำค่าหายากที่เป็นหัวใจสำคัญในการแก้ปัญหาพลังงานขาดแคลนของโลก และเพราะชั้นบรรยากาศของดาวแพนโดราเป็นพิษต่อมนุษย์',
      'image':
          'https://www.24-hd.com/wp-content/uploads/2022/09/Avatar-2009.jpg',
    },
    {
      'title': 'The BFG (2016) ยักษ์ใหญ่หัวใจหล่อ',
      'description':
          'จากพรสวรรค์ของ 3 นักเล่าเรื่องอันยอดเยี่ยม โรอัลด์ ดาห์ล, วอลท์ ดิสนีย์ และสตีเวน สปีลเบิร์ก นำวรรณกรรมอันเป็นที่รัก ”เดอะ บีเอฟจี” ให้กลับมามีชีวิต กำกับโดยสปีลเบิร์ก เรื่องราวเกี่ยวข้องกับจินตนาการของเด็กหญิง และยักษ์ที่แนะนำให้เธอรู้จักกับความมหัศจรรย์ของดินแดนยักษ์ เดอะ บีเอฟจี (มาร์ค ไรแลนซ์) เป็นยักษ์ใหญ่ใจดี สูง 24 ฟุต ผู้มีหูอันใหญ่โต และประสาทการดมกลิ่นเป็นเลิศ เขาค่อนข้างจะทึ่มและขี้อาย ในทางกลับกัน ยักษ์ตนอื่น ๆ อย่าง บลัดบ็อตเลอร์ (บิล เฮดเดอร์) และเฟลชลัมพ์อีตเตอร์ (เจอร์เมน เคลมองต์) ตัวใหญ่ และน่ากลัวกว่าเขามาก และเป็นที่รู้กันว่าพวกเขากินมนุษย์เป็นอาหาร',
      'image':
          'https://www.24-hd.com/wp-content/uploads/2022/12/The-BFG-2016-%E0%B8%A2%E0%B8%B1%E0%B8%81%E0%B8%A9%E0%B9%8C%E0%B9%83%E0%B8%AB%E0%B8%8D%E0%B9%88%E0%B8%AB%E0%B8%B1%E0%B8%A7%E0%B9%83%E0%B8%88%E0%B8%AB%E0%B8%A5%E0%B9%88%E0%B8%AD.jpg',
    },
    {
      'title': 'Dracula Untold (2014) ตำนานลับโลกไม่รู้',
      'description':
          'ตำนานลับโลกไม่รู้ เรื่องนี้เล่าถึงเจ้าชายวลาด (รับบทโดย Luke Evans) ที่มีชีวิตในวัยเด็กอยู่กับชาวเติร์ค มหาอำนาจที่ยิ่งใหญ่ในยุคนั้น กาลเวลาผ่านไป เจ้าชายวลาดได้กลับมายังปราสาทของตัวเองอยู่อย่างสงบสุข จนกระทั่งชาวเติร์คคิดทำศึกสงครามอีกครั้ง และชาวเติร์คมีความต้องการให้เจ้าชายวลาดส่งมอบเด็ก 1,000คน ให้เป็นเครื่องมือบรรณาการทางทหารซึ่งหนึ่งในนั้นมีลูกชายของเจ้าชายวลาดอยู่ด้วย เจ้าชายวลาดผู้ไม่มีกำลังทหารอยู่ในมือจึงทำได้แค่เพียงหันหน้าเข้าหาอำนาจมืดที่เปลี่ยนแปลงเขาไปตลอดกาล',
      'image':
          'https://www.24-hd.com/wp-content/uploads/2023/02/Dracula-Untold-2014.jpg',
    },
    {
      'title':
          'Star Wars 1 Episode I The Phantom Menace (1999) สตาร์ วอร์ส 1 ภัยซ่อนเร้น',
      'description': 'เรื่องราวของอาจารย์เจไดไควกอน จินน์...',
      'image':
          'https://www.24-hd.com/wp-content/uploads/2023/03/Star-Wars-1-Episode-I-The-Phantom-Menace-1999.jpg',
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
