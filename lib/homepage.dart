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
import 'package:miniproject/Movie/romance.dart';
import 'package:miniproject/Movie/sci_fipage.dart';
import 'package:miniproject/Movie/sport.dart';
import 'package:miniproject/Movie/thriller.dart';
import 'package:miniproject/Movie/war.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  // Example movie data
  final List<Map<String, String>> movies = [
    {
      'title': 'Kill the Drug Lords (2023) ตำรวจผู้พิทักษ์',
      'description':
          'เรื่องราวของ เหลิ่งเจี๋ย ผู้อำนวยการสถานีตำรวจ และ จางเจิ้งหยาง ตำรวจนอกเครื่องแบบ และตำรวจคนอื่น ๆ ของสถานีตำรวจที่ต่อสู้ด้วยไหวพริบและความกล้าหาญ กล้าเสียสละต่อหน้ากลุ่มอาชญากรใต้ดิน ในขณะเดียวกันก็เสริมด้วยการบรรยายอารมณ์ เช่น มิตรภาพ ความรักใคร่ในครอบครัว',
      'image':
          'https://www.24-hd.com/wp-content/uploads/2023/03/Kill-the-Drug-Lords-2023-%E0%B8%95%E0%B8%B3%E0%B8%A3%E0%B8%A7%E0%B8%88%E0%B8%9C%E0%B8%B9%E0%B9%89%E0%B8%9E%E0%B8%B4%E0%B8%97%E0%B8%B1%E0%B8%81%E0%B8%A9%E0%B9%8C.jpg',
    },
    {
      'title': 'Narvik (2023) นาร์วิค',
      'description':
          'เมษายน พ.ศ. 2483 สายตาของโลกจับจ้องไปที่นาร์วิค เมืองเล็กๆ ทางตอนเหนือของนอร์เวย์ ซึ่งเป็นแหล่งแร่เหล็กที่จำเป็นสำหรับเครื่องจักรสงครามของฮิตเตอร์ ตลอดสองเดือนแห่งสงครามฤดูหนาวอันดุเดือด ฮิตเลอร์พ่ายแพ้ครั้งแรก',
      'image':
          'https://www.24-hd.com/wp-content/uploads/2023/01/Narvik-2023-%E0%B8%99%E0%B8%B2%E0%B8%A3%E0%B9%8C%E0%B8%A7%E0%B8%B4%E0%B8%84.jpg',
    },
    {
      'title':
          'The Treasure of the Sierra Madre (1948) ล่าขุมทรัพย์เซียร่า มาเดร',
      'description':
          'หนังปี 1948 กำกับโดยจอห์น ฮุสตัน ดัดแปลงมาจากนิยายชื่อเดียวกันของ บี. ทราเวน พล็อตคร่าวๆ จับความเหตุการณ์ช่วงทศวรรษ 1920 เล่าถึงหนุ่มอเมริกันชื่อเฟร็ด ซี. ด็อบส์',
      'image':
          'https://www.24-hd.com/wp-content/uploads/2023/03/The-Treasure-of-the-Sierra-Madre-1948.jpg',
    },
    {
      'title': 'The Secret Romantic Guesthouse (2023)',
      'description':
          'ชีวิตสุดแสนราบรื่นของ “ยุนดันโอ” (ชินเยอึน) เริ่มเปลี่ยนไป หลังเธอต้องมาดูแลหอพักชื่ออินฮวาวอน ซึ่งแขกส่วนใหญ่จะเป็นบัณฑิตที่เดินทางมาที่ฮันยางเพื่อเข้าสอบ ที่หอพักนี้เองที่ทำให้เธอได้พบกับ 3 หนุ่มบัณฑิตสุดหล่ออย่าง “คังซัน” (รยออุน), “คิมชียอล” (คังฮุน) และ “จองยูฮา” (จองกอนจู)',
      'image':
          'https://www.24-hd.com/wp-content/uploads/2023/03/The-Secret-Romantic-Guesthouse-2023.jpg',
    },
    {
      'title': 'Rampage (2018) ใหญ่ชนยักษ์',
      'description':
          'เรื่องราวของนักวานรวิทยา ดาวิส โอโคเย (จอห์นสัน) ชายผู้หลบเลี่ยงห่างไกลจากผู้คน เขามีสายสัมพันธ์อันแน่นหนาที่ไม่มีวันสั่นคลอนกับจอร์จ กอริล่าหลังเงินที่เฉลียวฉลาดยิ่งกว่ากอริลล่าทั่วไปที่เขาเป็นผู้เลี้ยงดูมาตั้งแต่มันเกิด แต่แล้วยีนส์แห่งความโหดร้ายในร่างมันได้เกิดการกลายพันธุ์',
      'image':
          'https://www.24-hd.com/wp-content/uploads/2023/02/Rampage-2018-%E0%B9%83%E0%B8%AB%E0%B8%8D%E0%B9%88%E0%B8%8A%E0%B8%99%E0%B8%A2%E0%B8%B1%E0%B8%81%E0%B8%A9%E0%B9%8C.jpg',
    },
    {
      'title': 'Son (2021) เด็กผวา',
      'description':
          'เมื่อเด็กชายคนหนึ่งป่วยด้วยโรคลึกลับ แม่ของเขาต้องตัดสินใจว่าจะปกป้องเขาจากความน่ากลัวในอดีตได้ไกลแค่ไหน',
      'image':
          'https://mv-hd.com/wp-content/uploads/2023/03/fbf37dd183836a93cedf72080c214af8.jpg',
    },
    {
      'title': 'But Always (2014) รักนิรันดร์',
      'description':
          'เรื่องราวความรักของหนุ่มสาวในช่วงปี 1970 เมื่อ 2 เพื่อนสมัยเรียนที่เติมโตมากับครอบครัวและภูมิหลังที่แตกต่างกัน จนวันหนึ่งความสัมพันธ์ของทั้งสองก็พัฒนาขึ้นตามวันเวลา แต่สุดท้ายเขาและเธอก็ต้องห่างกันที่นครนิวยอร์กและต้องเผชิญความจริงที่ว่าเขาทั้งคู่ต่างสร้างเนื้อสร้างตัวและความรักครั้งใหม่ไปเรียบร้อยแล้ว ทำให้พวกเขาต้องเลือกระหว่างความรักในปัจจุบันกับความรักในอนาคต',
      'image':
          'https://www.24-hd.com/wp-content/uploads/2023/03/But-Always-2014-%E0%B8%A3%E0%B8%B1%E0%B8%81%E0%B8%99%E0%B8%B4%E0%B8%A3%E0%B8%B1%E0%B8%99%E0%B8%94%E0%B8%A3%E0%B9%8C.jpg',
    },
    {
      'title': 'Tar (2022)',
      'description':
          'ตั้งอยู่ในโลกสากลของดนตรีคลาสสิกตะวันตก ภาพยนตร์เรื่องนี้มีศูนย์กลางอยู่ที่ ซึ่งถือว่าเป็นหนึ่งในนักประพันธ์และนักแต่งเพลงที่มีชีวิตที่ยิ่งใหญ่ที่สุด และเป็นผู้กำกับดนตรีหญิงคนแรกของวงออร์เคสตราเยอรมันรายใหญ่',
      'image': 'https://www.24-hd.com/wp-content/uploads/2022/11/Tar-2022.jpg',
    },

    // ... add more movies here
  ];
  final user = FirebaseAuth.instance.currentUser!;

  //----------------------------แก้ใหม่----------------------------
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
//----------------------------แก้ใหม่----------------------------

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
//----------------------------แก้ใหม่----------------------------
          return Scaffold(
              appBar: AppBar(
                title: const Text("NEW MOVIE",
                    style: TextStyle(color: Colors.white)),
                actions: <Widget>[
                  IconButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/favorites');
                      },
                      icon: const Icon(Icons.favorite),
                      color: Colors.pink),
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
                      icon: const Icon(Icons.logout))
                ],
              ),
              drawer: Drawer(
                  child: Drawer(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: <Widget>[
                    //----------------------------แก้ใหม่----------------------------
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
                    //----------------------------แก้ใหม่----------------------------

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
                      onTap: () {},
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
                    Text('VSM 3.9', style: TextStyle(color: Colors.black)),
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
                    Navigator.pushNamed(context, '/Kill_the_Drug_Lords');
                  },
                ),
                ListTile(
                  leading: Image.network(movies[1]['image']!),
                  title: Text(
                    'NEW ' + movies[1]['title']!,
                    style: TextStyle(color: Colors.red),
                  ),
                  subtitle: Row(children: const <Widget>[
                    Text('VSM 5.0', style: TextStyle(color: Colors.black)),
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
                    Navigator.pushNamed(context, '/Narvik');
                  },
                ),
                ListTile(
                  leading: Image.network(movies[2]['image']!),
                  title: Text(
                    'NEW ' + movies[2]['title']!,
                    style: TextStyle(color: Colors.red),
                  ),
                  subtitle: Row(children: const <Widget>[
                    Text('VSM 4.9', style: TextStyle(color: Colors.black)),
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
                    Navigator.pushNamed(
                        context, '/The_Treasure_of_the_Sierra_Madre');
                  },
                ),
                ListTile(
                  leading: Image.network(movies[3]['image']!),
                  title: Text(
                    'NEW ' + movies[3]['title']!,
                    style: TextStyle(color: Colors.red),
                  ),
                  subtitle: Row(children: const <Widget>[
                    Text('VSM 4.0', style: TextStyle(color: Colors.black)),
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
                    Navigator.pushNamed(
                        context, '/The_Secret_Romantic_Guesthouse');
                  },
                ),
                ListTile(
                  leading: Image.network(movies[4]['image']!),
                  title: Text(
                    'NEW ' + movies[4]['title']!,
                    style: TextStyle(color: Colors.red),
                  ),
                  subtitle: Row(children: const <Widget>[
                    Text('VSM 4.7', style: TextStyle(color: Colors.black)),
                    const Icon(Icons.star, color: Colors.yellow),
                  ]),
                  trailing: IconButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => AddPage5()));
                    },
                    icon: const Icon(Icons.favorite, color: Colors.pink),
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, '/Rampage');
                  },
                ),
                ListTile(
                  leading: Image.network(movies[5]['image']!),
                  title: Text(
                    'NEW ' + movies[5]['title']!,
                    style: TextStyle(color: Colors.red),
                  ),
                  subtitle: Row(children: const <Widget>[
                    Text('VSM 8.2', style: TextStyle(color: Colors.black)),
                    const Icon(Icons.star, color: Colors.yellow),
                  ]),
                  trailing: IconButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => AddPage6()));
                    },
                    icon: const Icon(Icons.favorite, color: Colors.pink),
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, '/Son');
                  },
                ),
                ListTile(
                  leading: Image.network(movies[6]['image']!),
                  title: Text(
                    'NEW ' + movies[6]['title']!,
                    style: TextStyle(color: Colors.red),
                  ),
                  subtitle: Row(children: const <Widget>[
                    Text('VSM 6.1', style: TextStyle(color: Colors.black)),
                    const Icon(Icons.star, color: Colors.yellow),
                  ]),
                  trailing: IconButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => AddPage7()));
                    },
                    icon: const Icon(Icons.favorite, color: Colors.pink),
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, '/But_Always');
                  },
                ),
                ListTile(
                  leading: Image.network(movies[7]['image']!),
                  title: Text(
                    'NEW ' + movies[7]['title']!,
                    style: TextStyle(color: Colors.red),
                  ),
                  subtitle: Row(children: const <Widget>[
                    Text('VSM 4.3', style: TextStyle(color: Colors.black)),
                    const Icon(Icons.star, color: Colors.yellow),
                  ]),
                  trailing: IconButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => AddPage8()));
                    },
                    icon: const Icon(Icons.favorite, color: Colors.pink),
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, '/Tar');
                  },
//----------------------------แก้ใหม่----------------------------
                ),
              ]));
        });
  }
}
//----------------------------แก้ใหม่----------------------------

//---------------------------------------------------------------------

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
      'title': 'Kill the Drug Lords (2023) ตำรวจผู้พิทักษ์',
      'description':
          'เรื่องราวของ เหลิ่งเจี๋ย ผู้อำนวยการสถานีตำรวจ และ จางเจิ้งหยาง ตำรวจนอกเครื่องแบบ...',
      'image':
          'https://www.24-hd.com/wp-content/uploads/2023/03/Kill-the-Drug-Lords-2023-%E0%B8%95%E0%B8%B3%E0%B8%A3%E0%B8%A7%E0%B8%88%E0%B8%9C%E0%B8%B9%E0%B9%89%E0%B8%9E%E0%B8%B4%E0%B8%97%E0%B8%B1%E0%B8%81%E0%B8%A9%E0%B9%8C.jpg',
    },
    {
      'title': 'Narvik (2023) นาร์วิค',
      'description':
          'เมษายน พ.ศ. 2483 สายตาของโลกจับจ้องไปที่นาร์วิค เมืองเล็กๆ ทางตอนเหนือของนอร์เวย์ ซึ่งเป็นแหล่งแร่เหล็กที่จำเป็นสำหรับเครื่องจักรสงครามของฮิตเตอร์ ตลอดสองเดือนแห่งสงครามฤดูหนาวอันดุเดือด ฮิตเลอร์พ่ายแพ้ครั้งแรก',
      'image':
          'https://www.24-hd.com/wp-content/uploads/2023/01/Narvik-2023-%E0%B8%99%E0%B8%B2%E0%B8%A3%E0%B9%8C%E0%B8%A7%E0%B8%B4%E0%B8%84.jpg',
    },
    {
      'title':
          'The Treasure of the Sierra Madre (1948) ล่าขุมทรัพย์เซียร่า มาเดร',
      'description':
          'หนังปี 1948 กำกับโดยจอห์น ฮุสตัน ดัดแปลงมาจากนิยายชื่อเดียวกันของ บี. ทราเวน พล็อตคร่าวๆ จับความเหตุการณ์ช่วงทศวรรษ 1920 เล่าถึงหนุ่มอเมริกันชื่อเฟร็ด ซี. ด็อบส์',
      'image':
          'https://www.24-hd.com/wp-content/uploads/2023/03/The-Treasure-of-the-Sierra-Madre-1948.jpg',
    },
    {
      'title': 'The Secret Romantic Guesthouse (2023)',
      'description':
          'ชีวิตสุดแสนราบรื่นของ “ยุนดันโอ” (ชินเยอึน) เริ่มเปลี่ยนไป หลังเธอต้องมาดูแลหอพักชื่ออินฮวาวอน ซึ่งแขกส่วนใหญ่จะเป็นบัณฑิตที่เดินทางมาที่ฮันยางเพื่อเข้าสอบ ที่หอพักนี้เองที่ทำให้เธอได้พบกับ 3 หนุ่มบัณฑิตสุดหล่ออย่าง “คังซัน” (รยออุน), “คิมชียอล” (คังฮุน) และ “จองยูฮา” (จองกอนจู)',
      'image':
          'https://www.24-hd.com/wp-content/uploads/2023/03/The-Secret-Romantic-Guesthouse-2023.jpg',
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
      'title': 'Kill the Drug Lords (2023) ตำรวจผู้พิทักษ์',
      'description':
          'เรื่องราวของ เหลิ่งเจี๋ย ผู้อำนวยการสถานีตำรวจ และ จางเจิ้งหยาง ตำรวจนอกเครื่องแบบ และตำรวจคนอื่น ๆ ของสถานีตำรวจที่ต่อสู้ด้วยไหวพริบและความกล้าหาญ กล้าเสียสละต่อหน้ากลุ่มอาชญากรใต้ดิน ในขณะเดียวกันก็เสริมด้วยการบรรยายอารมณ์ เช่น มิตรภาพ ความรักใคร่ในครอบครัว',
      'image':
          'https://www.24-hd.com/wp-content/uploads/2023/03/Kill-the-Drug-Lords-2023-%E0%B8%95%E0%B8%B3%E0%B8%A3%E0%B8%A7%E0%B8%88%E0%B8%9C%E0%B8%B9%E0%B9%89%E0%B8%9E%E0%B8%B4%E0%B8%97%E0%B8%B1%E0%B8%81%E0%B8%A9%E0%B9%8C.jpg',
    },
    {
      'title': 'Narvik (2023) นาร์วิค',
      'description':
          'เมษายน พ.ศ. 2483 สายตาของโลกจับจ้องไปที่นาร์วิค เมืองเล็กๆ...',
      'image':
          'https://www.24-hd.com/wp-content/uploads/2023/01/Narvik-2023-%E0%B8%99%E0%B8%B2%E0%B8%A3%E0%B9%8C%E0%B8%A7%E0%B8%B4%E0%B8%84.jpg',
    },
    {
      'title':
          'The Treasure of the Sierra Madre (1948) ล่าขุมทรัพย์เซียร่า มาเดร',
      'description':
          'หนังปี 1948 กำกับโดยจอห์น ฮุสตัน ดัดแปลงมาจากนิยายชื่อเดียวกันของ บี. ทราเวน พล็อตคร่าวๆ จับความเหตุการณ์ช่วงทศวรรษ 1920 เล่าถึงหนุ่มอเมริกันชื่อเฟร็ด ซี. ด็อบส์',
      'image':
          'https://www.24-hd.com/wp-content/uploads/2023/03/The-Treasure-of-the-Sierra-Madre-1948.jpg',
    },
    {
      'title': 'The Secret Romantic Guesthouse (2023)',
      'description':
          'ชีวิตสุดแสนราบรื่นของ “ยุนดันโอ” (ชินเยอึน) เริ่มเปลี่ยนไป หลังเธอต้องมาดูแลหอพักชื่ออินฮวาวอน ซึ่งแขกส่วนใหญ่จะเป็นบัณฑิตที่เดินทางมาที่ฮันยางเพื่อเข้าสอบ ที่หอพักนี้เองที่ทำให้เธอได้พบกับ 3 หนุ่มบัณฑิตสุดหล่ออย่าง “คังซัน” (รยออุน), “คิมชียอล” (คังฮุน) และ “จองยูฮา” (จองกอนจู)',
      'image':
          'https://www.24-hd.com/wp-content/uploads/2023/03/The-Secret-Romantic-Guesthouse-2023.jpg',
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
      'title': 'Kill the Drug Lords (2023) ตำรวจผู้พิทักษ์',
      'description':
          'เรื่องราวของ เหลิ่งเจี๋ย ผู้อำนวยการสถานีตำรวจ และ จางเจิ้งหยาง ตำรวจนอกเครื่องแบบ และตำรวจคนอื่น ๆ ของสถานีตำรวจที่ต่อสู้ด้วยไหวพริบและความกล้าหาญ กล้าเสียสละต่อหน้ากลุ่มอาชญากรใต้ดิน ในขณะเดียวกันก็เสริมด้วยการบรรยายอารมณ์ เช่น มิตรภาพ ความรักใคร่ในครอบครัว',
      'image':
          'https://www.24-hd.com/wp-content/uploads/2023/03/Kill-the-Drug-Lords-2023-%E0%B8%95%E0%B8%B3%E0%B8%A3%E0%B8%A7%E0%B8%88%E0%B8%9C%E0%B8%B9%E0%B9%89%E0%B8%9E%E0%B8%B4%E0%B8%97%E0%B8%B1%E0%B8%81%E0%B8%A9%E0%B9%8C.jpg',
    },
    {
      'title': 'Narvik (2023) นาร์วิค',
      'description':
          'เมษายน พ.ศ. 2483 สายตาของโลกจับจ้องไปที่นาร์วิค เมืองเล็กๆ ทางตอนเหนือของนอร์เวย์ ซึ่งเป็นแหล่งแร่เหล็กที่จำเป็นสำหรับเครื่องจักรสงครามของฮิตเตอร์ ตลอดสองเดือนแห่งสงครามฤดูหนาวอันดุเดือด ฮิตเลอร์พ่ายแพ้ครั้งแรก',
      'image':
          'https://www.24-hd.com/wp-content/uploads/2023/01/Narvik-2023-%E0%B8%99%E0%B8%B2%E0%B8%A3%E0%B9%8C%E0%B8%A7%E0%B8%B4%E0%B8%84.jpg',
    },
    {
      'title':
          'The Treasure of the Sierra Madre (1948) ล่าขุมทรัพย์เซียร่า มาเดร',
      'description':
          'หนังปี 1948 กำกับโดยจอห์น ฮุสตัน ดัดแปลงมาจากนิยายชื่อเดียวกันของ บี...',
      'image':
          'https://www.24-hd.com/wp-content/uploads/2023/03/The-Treasure-of-the-Sierra-Madre-1948.jpg',
    },
    {
      'title': 'The Secret Romantic Guesthouse (2023)',
      'description':
          'ชีวิตสุดแสนราบรื่นของ “ยุนดันโอ” (ชินเยอึน) เริ่มเปลี่ยนไป หลังเธอต้องมาดูแลหอพักชื่ออินฮวาวอน ซึ่งแขกส่วนใหญ่จะเป็นบัณฑิตที่เดินทางมาที่ฮันยางเพื่อเข้าสอบ ที่หอพักนี้เองที่ทำให้เธอได้พบกับ 3 หนุ่มบัณฑิตสุดหล่ออย่าง “คังซัน” (รยออุน), “คิมชียอล” (คังฮุน) และ “จองยูฮา” (จองกอนจู)',
      'image':
          'https://www.24-hd.com/wp-content/uploads/2023/03/The-Secret-Romantic-Guesthouse-2023.jpg',
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
      'title': 'Kill the Drug Lords (2023) ตำรวจผู้พิทักษ์',
      'description':
          'เรื่องราวของ เหลิ่งเจี๋ย ผู้อำนวยการสถานีตำรวจ และ จางเจิ้งหยาง ตำรวจนอกเครื่องแบบ และตำรวจคนอื่น ๆ ของสถานีตำรวจที่ต่อสู้ด้วยไหวพริบและความกล้าหาญ กล้าเสียสละต่อหน้ากลุ่มอาชญากรใต้ดิน ในขณะเดียวกันก็เสริมด้วยการบรรยายอารมณ์ เช่น มิตรภาพ ความรักใคร่ในครอบครัว',
      'image':
          'https://www.24-hd.com/wp-content/uploads/2023/03/Kill-the-Drug-Lords-2023-%E0%B8%95%E0%B8%B3%E0%B8%A3%E0%B8%A7%E0%B8%88%E0%B8%9C%E0%B8%B9%E0%B9%89%E0%B8%9E%E0%B8%B4%E0%B8%97%E0%B8%B1%E0%B8%81%E0%B8%A9%E0%B9%8C.jpg',
    },
    {
      'title': 'Narvik (2023) นาร์วิค',
      'description':
          'เมษายน พ.ศ. 2483 สายตาของโลกจับจ้องไปที่นาร์วิค เมืองเล็กๆ ทางตอนเหนือของนอร์เวย์ ซึ่งเป็นแหล่งแร่เหล็กที่จำเป็นสำหรับเครื่องจักรสงครามของฮิตเตอร์ ตลอดสองเดือนแห่งสงครามฤดูหนาวอันดุเดือด ฮิตเลอร์พ่ายแพ้ครั้งแรก',
      'image':
          'https://www.24-hd.com/wp-content/uploads/2023/01/Narvik-2023-%E0%B8%99%E0%B8%B2%E0%B8%A3%E0%B9%8C%E0%B8%A7%E0%B8%B4%E0%B8%84.jpg',
    },
    {
      'title':
          'The Treasure of the Sierra Madre (1948) ล่าขุมทรัพย์เซียร่า มาเดร',
      'description':
          'หนังปี 1948 กำกับโดยจอห์น ฮุสตัน ดัดแปลงมาจากนิยายชื่อเดียวกันของ บี. ทราเวน พล็อตคร่าวๆ จับความเหตุการณ์ช่วงทศวรรษ 1920 เล่าถึงหนุ่มอเมริกันชื่อเฟร็ด ซี. ด็อบส์',
      'image':
          'https://www.24-hd.com/wp-content/uploads/2023/03/The-Treasure-of-the-Sierra-Madre-1948.jpg',
    },
    {
      'title': 'The Secret Romantic Guesthouse (2023)',
      'description':
          'ชีวิตสุดแสนราบรื่นของ “ยุนดันโอ” (ชินเยอึน) เริ่มเปลี่ยนไป หลังเธอต้องมาดูแลหอพักชื่ออินฮวาวอน...',
      'image':
          'https://www.24-hd.com/wp-content/uploads/2023/03/The-Secret-Romantic-Guesthouse-2023.jpg',
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

class AddPage5 extends StatefulWidget {
  const AddPage5({Key? key}) : super(key: key);
  @override
  State createState() => _AddPage5State();
}

class _AddPage5State extends State<AddPage5> {
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

class AddPage6 extends StatefulWidget {
  const AddPage6({Key? key}) : super(key: key);
  @override
  State createState() => _AddPage6State();
}

class _AddPage6State extends State<AddPage6> {
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
          'เมื่อเด็กชายคนหนึ่งป่วยด้วยโรคลึกลับ แม่ของเขาต้องตัดสินใจว่าจะปกป้องเขาจากความน่ากลัว',
      'image':
          'https://mv-hd.com/wp-content/uploads/2023/03/fbf37dd183836a93cedf72080c214af8.jpg',
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

class AddPage7 extends StatefulWidget {
  const AddPage7({Key? key}) : super(key: key);
  @override
  State createState() => _AddPage7State();
}

class _AddPage7State extends State<AddPage7> {
  final _form = GlobalKey<FormState>();
  final _title = TextEditingController();
  final _detail = TextEditingController();
  final _imageURL = TextEditingController();
  final store = FirebaseFirestore.instance;
  @override
  final List<Map<String, String>> movies = [
    {
      'title': 'But Always (2014) รักนิรันดร์',
      'description':
          'เรื่องราวความรักของหนุ่มสาวในช่วงปี 1970 เมื่อ 2 เพื่อนสมัยเรียนที่เติมโตมากับครอบครัว',
      'image':
          'https://www.24-hd.com/wp-content/uploads/2023/03/But-Always-2014-%E0%B8%A3%E0%B8%B1%E0%B8%81%E0%B8%99%E0%B8%B4%E0%B8%A3%E0%B8%B1%E0%B8%99%E0%B8%94%E0%B8%A3%E0%B9%8C.jpg',
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

class AddPage8 extends StatefulWidget {
  const AddPage8({Key? key}) : super(key: key);
  @override
  State createState() => _AddPage8State();
}

class _AddPage8State extends State<AddPage8> {
  final _form = GlobalKey<FormState>();
  final _title = TextEditingController();
  final _detail = TextEditingController();
  final _imageURL = TextEditingController();
  final store = FirebaseFirestore.instance;
  @override
  final List<Map<String, String>> movies = [
    {
      'title': 'Tar (2022)',
      'description':
          'ตั้งอยู่ในโลกสากลของดนตรีคลาสสิกตะวันตก ภาพยนตร์เรื่องนี้มีศูนย์กลางอยู่ที่...',
      'image': 'https://www.24-hd.com/wp-content/uploads/2022/11/Tar-2022.jpg',
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
