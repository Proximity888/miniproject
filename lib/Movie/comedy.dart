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

class Comedypage extends StatefulWidget {
  const Comedypage({Key? key}) : super(key: key);
  @override
  _ComedypageState createState() => _ComedypageState();
}

class _ComedypageState extends State<Comedypage> {
  final List<Map<String, String>> movies = [
    {
      'title': 'Alpha House (2014) หอแซ่บแสบยกก๊วน',
      'description':
          'เมื่อ ‘อัลฟ่า เฮาส์’ หอพักนักศึกษาชายที่ขึ้นชื่อในเรื่องปาร์ตี้ที่มันส์ที่สุดของมหาลัย ถูกรองคณบดีบีบบังคับให้แชร์หอพักร่วมกับเหล่านักศึกษาจากหอพักหญิง หากไม่เช่นนั้นก็ต้องถูกไล่ให้ไปอยู่นอกมหาลัย เหล่านิสิตหนุ่มสุดห้าวเหล่านี้จึงประกาศสงครามระหว่างเพศ เพื่อทวงสิทธิ์อันชอบธรรมที่จะจัดปาร์ตี้แบบเดิมกลับคืนมา',
      'image':
          'https://www.24-hd.com/wp-content/uploads/2023/03/Alpha-House-2014-%E0%B8%AB%E0%B8%AD%E0%B9%81%E0%B8%8B%E0%B9%88%E0%B8%9A%E0%B9%81%E0%B8%AA%E0%B8%9A%E0%B8%A2%E0%B8%81%E0%B8%81%E0%B9%8A%E0%B8%A7%E0%B8%99.jpg',
    },
    {
      'title': '22 Jump Street (2014) สายลับรั่วป่วนมหาลัย',
      'description':
          'สายลับรั่วป่วนมหาลัย สองหนุ่มคู่หูคู่ฮา สายลับเจนโก้ (แชนนิ่ง เททัม) และ สายลับชมิดท์ (โจนาห์ ฮิลล์) ต้องปลอมตัวแอ๊บแบ๊วเป็นนักศึกษา แฝงตัวเข้าไปสืบคดีในรั้วมหาวิทยาลัย สองหนุ่มจะกลายเป็นสายลับใจแตกหรือไม่',
      'image':
          'https://www.24-hd.com/wp-content/uploads/2023/03/22-Jump-Street-2014-%E0%B8%AA%E0%B8%B2%E0%B8%A2%E0%B8%A5%E0%B8%B1%E0%B8%9A%E0%B8%A3%E0%B8%B1%E0%B9%88%E0%B8%A7%E0%B8%9B%E0%B9%88%E0%B8%A7%E0%B8%99%E0%B8%A1%E0%B8%AB%E0%B8%B2%E0%B8%A5%E0%B8%B1%E0%B8%A2.jpg',
    },
    {
      'title': 'Hello Stranger (2010) กวน มึน โฮ',
      'description':
          'ผู้ชายที่จะไปประเทศเกาหลี ด้วยรองเท้าแตะคีบ และเสื้อยืดย้วยๆบวกกางเกงขาสั้น เขาเป็นคนเดียวในกรุ๊ปทัวร์ที่ไม่มีครอบครัวหรือคนรักมาด้วย บางทีที่นั่งว่างเปล่าข้างๆ อาจเป็นสาเหตุให้เขาเมามายขนาดนี้ในวันเดินทางหลังล้อเครื่องแตะพื้นผิวท่าอากาศยานกรุงโซลโปรแกรมเที่ยวตามรหัส 6-7-8 คือ ตื่นนอน 6 โมงเช้า – กินข้าว 7 โมงเช้า – ล้อหมุน 8 โมงเช้า คืนนั้นชายหนุ่มเลยต้องพึ่งเหล้าโซจู ซึ่งเขามาเมาสลบอยู่หน้าเกสท์เฮาส์แห่งหนึ่งในชุดคลุมอาบน้ำโรงแรม เช้าวันรุ่งขึ้น ชายหนุ่มลุกพรวดขึ้นมาหมิ่นเหม่เวลาล้อหมุน หญิงสาว (หนึ่งธิดา โสภณ) ที่ยืนอยู่ตรงนั้นร้องโวยวาย',
      'image':
          'https://www.24-hd.com/wp-content/uploads/2023/02/Hello-Stranger-2010-%E0%B8%81%E0%B8%A7%E0%B8%99-%E0%B8%A1%E0%B8%B6%E0%B8%99-%E0%B9%82%E0%B8%AE.jpg',
    },
    {
      'title': 'Panya Renu (2011) ปัญญาเรณู',
      'description':
          'เด็กชายชาวอีสานที่มีความสามารถในการร้องเพลง ฝึกซ้อมโปงลางกับเพื่อนๆ เพื่อการแข่งขันครั้งนี้ แต่ด้วยความยากแค้น และขาดทุนทรัพย์ของทางโรงเรียน ที่ไม่สามารถซื้อเครื่องดนตรีใหม่เพื่อการแข่งขันได้ จึงถูกเป่ว ซึ่งเป็นคู่แข่งที่มีฐานะดีกว่าต่อรองให้ยกตำแหน่งนักร้องนำให้ แลกกับการซื้อเครื่องดนตรีให้วง แต่ด้วยความเป็นเด็กดี และเป็นที่รักของทุกคน ทำให้หลวงพ่อที่ได้รับเงินทำบุญมา ช่วยเหลือซื้อเครื่องดนตรีให้ ปัญญาจึงได้เป็นนักร้องนำของวง และสานสัมพันธ์กับเป่ว',
      'image':
          'https://www.24-hd.com/wp-content/uploads/2023/02/Panya-Renu-2011-%E0%B8%9B%E0%B8%B1%E0%B8%8D%E0%B8%8D%E0%B8%B2%E0%B9%80%E0%B8%A3%E0%B8%93%E0%B8%B9.jpg',
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
                title: const Text("อาชญากรรม Crime",
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
                    Text('VSM 5.4', style: TextStyle(color: Colors.black)),
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
                    Navigator.pushNamed(context, '/Alpha_House');
                  },
                ),
                ListTile(
                  leading: Image.network(movies[1]['image']!),
                  title: Text(
                    movies[1]['title']!,
                    style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                  ),
                  subtitle: Row(children: const <Widget>[
                    Text('VSM 6.4', style: TextStyle(color: Colors.black)),
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
                    Navigator.pushNamed(context, '/Jump_Street');
                  },
                ),
                ListTile(
                  leading: Image.network(movies[2]['image']!),
                  title: Text(
                    movies[2]['title']!,
                    style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
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
                    Navigator.pushNamed(context, '/Hello_Stranger');
                  },
                ),
                ListTile(
                  leading: Image.network(movies[3]['image']!),
                  title: Text(
                    movies[3]['title']!,
                    style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                  ),
                  subtitle: Row(children: const <Widget>[
                    Text('VSM 6.6', style: TextStyle(color: Colors.black)),
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
                    Navigator.pushNamed(context, '/Panya_Renu');
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
      'title': 'Alpha House (2014) หอแซ่บแสบยกก๊วน',
      'description':
          'เมื่อ ‘อัลฟ่า เฮาส์’ หอพักนักศึกษาชายที่ขึ้นชื่อในเรื่องปาร์ตี้ที่มันส์ที่สุดของมหาลัย...',
      'image':
          'https://www.24-hd.com/wp-content/uploads/2023/03/Alpha-House-2014-%E0%B8%AB%E0%B8%AD%E0%B9%81%E0%B8%8B%E0%B9%88%E0%B8%9A%E0%B9%81%E0%B8%AA%E0%B8%9A%E0%B8%A2%E0%B8%81%E0%B8%81%E0%B9%8A%E0%B8%A7%E0%B8%99.jpg',
    },
    {
      'title': '22 Jump Street (2014) สายลับรั่วป่วนมหาลัย',
      'description':
          'สายลับรั่วป่วนมหาลัย สองหนุ่มคู่หูคู่ฮา สายลับเจนโก้ (แชนนิ่ง เททัม) และ สายลับชมิดท์ (โจนาห์ ฮิลล์) ต้องปลอมตัวแอ๊บแบ๊วเป็นนักศึกษา แฝงตัวเข้าไปสืบคดีในรั้วมหาวิทยาลัย สองหนุ่มจะกลายเป็นสายลับใจแตกหรือไม่',
      'image':
          'https://www.24-hd.com/wp-content/uploads/2023/03/22-Jump-Street-2014-%E0%B8%AA%E0%B8%B2%E0%B8%A2%E0%B8%A5%E0%B8%B1%E0%B8%9A%E0%B8%A3%E0%B8%B1%E0%B9%88%E0%B8%A7%E0%B8%9B%E0%B9%88%E0%B8%A7%E0%B8%99%E0%B8%A1%E0%B8%AB%E0%B8%B2%E0%B8%A5%E0%B8%B1%E0%B8%A2.jpg',
    },
    {
      'title': 'Hello Stranger (2010) กวน มึน โฮ',
      'description':
          'ผู้ชายที่จะไปประเทศเกาหลี ด้วยรองเท้าแตะคีบ และเสื้อยืดย้วยๆบวกกางเกงขาสั้น เขาเป็นคนเดียวในกรุ๊ปทัวร์ที่ไม่มีครอบครัวหรือคนรักมาด้วย บางทีที่นั่งว่างเปล่าข้างๆ อาจเป็นสาเหตุให้เขาเมามายขนาดนี้ในวันเดินทางหลังล้อเครื่องแตะพื้นผิวท่าอากาศยานกรุงโซลโปรแกรมเที่ยวตามรหัส 6-7-8 คือ ตื่นนอน 6 โมงเช้า – กินข้าว 7 โมงเช้า – ล้อหมุน 8 โมงเช้า คืนนั้นชายหนุ่มเลยต้องพึ่งเหล้าโซจู ซึ่งเขามาเมาสลบอยู่หน้าเกสท์เฮาส์แห่งหนึ่งในชุดคลุมอาบน้ำโรงแรม เช้าวันรุ่งขึ้น ชายหนุ่มลุกพรวดขึ้นมาหมิ่นเหม่เวลาล้อหมุน หญิงสาว (หนึ่งธิดา โสภณ) ที่ยืนอยู่ตรงนั้นร้องโวยวาย',
      'image':
          'https://www.24-hd.com/wp-content/uploads/2023/02/Hello-Stranger-2010-%E0%B8%81%E0%B8%A7%E0%B8%99-%E0%B8%A1%E0%B8%B6%E0%B8%99-%E0%B9%82%E0%B8%AE.jpg',
    },
    {
      'title': 'Panya Renu (2011) ปัญญาเรณู',
      'description':
          'เด็กชายชาวอีสานที่มีความสามารถในการร้องเพลง ฝึกซ้อมโปงลางกับเพื่อนๆ เพื่อการแข่งขันครั้งนี้ แต่ด้วยความยากแค้น และขาดทุนทรัพย์ของทางโรงเรียน ที่ไม่สามารถซื้อเครื่องดนตรีใหม่เพื่อการแข่งขันได้ จึงถูกเป่ว ซึ่งเป็นคู่แข่งที่มีฐานะดีกว่าต่อรองให้ยกตำแหน่งนักร้องนำให้ แลกกับการซื้อเครื่องดนตรีให้วง แต่ด้วยความเป็นเด็กดี และเป็นที่รักของทุกคน ทำให้หลวงพ่อที่ได้รับเงินทำบุญมา ช่วยเหลือซื้อเครื่องดนตรีให้ ปัญญาจึงได้เป็นนักร้องนำของวง และสานสัมพันธ์กับเป่ว',
      'image':
          'https://www.24-hd.com/wp-content/uploads/2023/02/Panya-Renu-2011-%E0%B8%9B%E0%B8%B1%E0%B8%8D%E0%B8%8D%E0%B8%B2%E0%B9%80%E0%B8%A3%E0%B8%93%E0%B8%B9.jpg',
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
      'title': 'Alpha House (2014) หอแซ่บแสบยกก๊วน',
      'description':
          'เมื่อ ‘อัลฟ่า เฮาส์’ หอพักนักศึกษาชายที่ขึ้นชื่อในเรื่องปาร์ตี้ที่มันส์ที่สุดของมหาลัย ถูกรองคณบดีบีบบังคับให้แชร์หอพักร่วมกับเหล่านักศึกษาจากหอพักหญิง หากไม่เช่นนั้นก็ต้องถูกไล่ให้ไปอยู่นอกมหาลัย เหล่านิสิตหนุ่มสุดห้าวเหล่านี้จึงประกาศสงครามระหว่างเพศ เพื่อทวงสิทธิ์อันชอบธรรมที่จะจัดปาร์ตี้แบบเดิมกลับคืนมา',
      'image':
          'https://www.24-hd.com/wp-content/uploads/2023/03/Alpha-House-2014-%E0%B8%AB%E0%B8%AD%E0%B9%81%E0%B8%8B%E0%B9%88%E0%B8%9A%E0%B9%81%E0%B8%AA%E0%B8%9A%E0%B8%A2%E0%B8%81%E0%B8%81%E0%B9%8A%E0%B8%A7%E0%B8%99.jpg',
    },
    {
      'title': '22 Jump Street (2014) สายลับรั่วป่วนมหาลัย',
      'description':
          'สายลับรั่วป่วนมหาลัย สองหนุ่มคู่หูคู่ฮา สายลับเจนโก้ (แชนนิ่ง เททัม) และ สายลับชมิดท์...',
      'image':
          'https://www.24-hd.com/wp-content/uploads/2023/03/22-Jump-Street-2014-%E0%B8%AA%E0%B8%B2%E0%B8%A2%E0%B8%A5%E0%B8%B1%E0%B8%9A%E0%B8%A3%E0%B8%B1%E0%B9%88%E0%B8%A7%E0%B8%9B%E0%B9%88%E0%B8%A7%E0%B8%99%E0%B8%A1%E0%B8%AB%E0%B8%B2%E0%B8%A5%E0%B8%B1%E0%B8%A2.jpg',
    },
    {
      'title': 'Hello Stranger (2010) กวน มึน โฮ',
      'description':
          'ผู้ชายที่จะไปประเทศเกาหลี ด้วยรองเท้าแตะคีบ และเสื้อยืดย้วยๆบวกกางเกงขาสั้น เขาเป็นคนเดียวในกรุ๊ปทัวร์ที่ไม่มีครอบครัวหรือคนรักมาด้วย บางทีที่นั่งว่างเปล่าข้างๆ อาจเป็นสาเหตุให้เขาเมามายขนาดนี้ในวันเดินทางหลังล้อเครื่องแตะพื้นผิวท่าอากาศยานกรุงโซลโปรแกรมเที่ยวตามรหัส 6-7-8 คือ ตื่นนอน 6 โมงเช้า – กินข้าว 7 โมงเช้า – ล้อหมุน 8 โมงเช้า คืนนั้นชายหนุ่มเลยต้องพึ่งเหล้าโซจู ซึ่งเขามาเมาสลบอยู่หน้าเกสท์เฮาส์แห่งหนึ่งในชุดคลุมอาบน้ำโรงแรม เช้าวันรุ่งขึ้น ชายหนุ่มลุกพรวดขึ้นมาหมิ่นเหม่เวลาล้อหมุน หญิงสาว (หนึ่งธิดา โสภณ) ที่ยืนอยู่ตรงนั้นร้องโวยวาย',
      'image':
          'https://www.24-hd.com/wp-content/uploads/2023/02/Hello-Stranger-2010-%E0%B8%81%E0%B8%A7%E0%B8%99-%E0%B8%A1%E0%B8%B6%E0%B8%99-%E0%B9%82%E0%B8%AE.jpg',
    },
    {
      'title': 'Panya Renu (2011) ปัญญาเรณู',
      'description':
          'เด็กชายชาวอีสานที่มีความสามารถในการร้องเพลง ฝึกซ้อมโปงลางกับเพื่อนๆ เพื่อการแข่งขันครั้งนี้ แต่ด้วยความยากแค้น และขาดทุนทรัพย์ของทางโรงเรียน ที่ไม่สามารถซื้อเครื่องดนตรีใหม่เพื่อการแข่งขันได้ จึงถูกเป่ว ซึ่งเป็นคู่แข่งที่มีฐานะดีกว่าต่อรองให้ยกตำแหน่งนักร้องนำให้ แลกกับการซื้อเครื่องดนตรีให้วง แต่ด้วยความเป็นเด็กดี และเป็นที่รักของทุกคน ทำให้หลวงพ่อที่ได้รับเงินทำบุญมา ช่วยเหลือซื้อเครื่องดนตรีให้ ปัญญาจึงได้เป็นนักร้องนำของวง และสานสัมพันธ์กับเป่ว',
      'image':
          'https://www.24-hd.com/wp-content/uploads/2023/02/Panya-Renu-2011-%E0%B8%9B%E0%B8%B1%E0%B8%8D%E0%B8%8D%E0%B8%B2%E0%B9%80%E0%B8%A3%E0%B8%93%E0%B8%B9.jpg',
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
      'title': 'Alpha House (2014) หอแซ่บแสบยกก๊วน',
      'description':
          'เมื่อ ‘อัลฟ่า เฮาส์’ หอพักนักศึกษาชายที่ขึ้นชื่อในเรื่องปาร์ตี้ที่มันส์ที่สุดของมหาลัย ถูกรองคณบดีบีบบังคับให้แชร์หอพักร่วมกับเหล่านักศึกษาจากหอพักหญิง หากไม่เช่นนั้นก็ต้องถูกไล่ให้ไปอยู่นอกมหาลัย เหล่านิสิตหนุ่มสุดห้าวเหล่านี้จึงประกาศสงครามระหว่างเพศ เพื่อทวงสิทธิ์อันชอบธรรมที่จะจัดปาร์ตี้แบบเดิมกลับคืนมา',
      'image':
          'https://www.24-hd.com/wp-content/uploads/2023/03/Alpha-House-2014-%E0%B8%AB%E0%B8%AD%E0%B9%81%E0%B8%8B%E0%B9%88%E0%B8%9A%E0%B9%81%E0%B8%AA%E0%B8%9A%E0%B8%A2%E0%B8%81%E0%B8%81%E0%B9%8A%E0%B8%A7%E0%B8%99.jpg',
    },
    {
      'title': '22 Jump Street (2014) สายลับรั่วป่วนมหาลัย',
      'description':
          'สายลับรั่วป่วนมหาลัย สองหนุ่มคู่หูคู่ฮา สายลับเจนโก้ (แชนนิ่ง เททัม) และ สายลับชมิดท์ (โจนาห์ ฮิลล์) ต้องปลอมตัวแอ๊บแบ๊วเป็นนักศึกษา แฝงตัวเข้าไปสืบคดีในรั้วมหาวิทยาลัย สองหนุ่มจะกลายเป็นสายลับใจแตกหรือไม่',
      'image':
          'https://www.24-hd.com/wp-content/uploads/2023/03/22-Jump-Street-2014-%E0%B8%AA%E0%B8%B2%E0%B8%A2%E0%B8%A5%E0%B8%B1%E0%B8%9A%E0%B8%A3%E0%B8%B1%E0%B9%88%E0%B8%A7%E0%B8%9B%E0%B9%88%E0%B8%A7%E0%B8%99%E0%B8%A1%E0%B8%AB%E0%B8%B2%E0%B8%A5%E0%B8%B1%E0%B8%A2.jpg',
    },
    {
      'title': 'Hello Stranger (2010) กวน มึน โฮ',
      'description':
          'ผู้ชายที่จะไปประเทศเกาหลี ด้วยรองเท้าแตะคีบ และเสื้อยืดย้วยๆบวกกางเกงขาสั้น...',
      'image':
          'https://www.24-hd.com/wp-content/uploads/2023/02/Hello-Stranger-2010-%E0%B8%81%E0%B8%A7%E0%B8%99-%E0%B8%A1%E0%B8%B6%E0%B8%99-%E0%B9%82%E0%B8%AE.jpg',
    },
    {
      'title': 'Panya Renu (2011) ปัญญาเรณู',
      'description':
          'เด็กชายชาวอีสานที่มีความสามารถในการร้องเพลง ฝึกซ้อมโปงลางกับเพื่อนๆ เพื่อการแข่งขันครั้งนี้ แต่ด้วยความยากแค้น และขาดทุนทรัพย์ของทางโรงเรียน ที่ไม่สามารถซื้อเครื่องดนตรีใหม่เพื่อการแข่งขันได้ จึงถูกเป่ว ซึ่งเป็นคู่แข่งที่มีฐานะดีกว่าต่อรองให้ยกตำแหน่งนักร้องนำให้ แลกกับการซื้อเครื่องดนตรีให้วง แต่ด้วยความเป็นเด็กดี และเป็นที่รักของทุกคน ทำให้หลวงพ่อที่ได้รับเงินทำบุญมา ช่วยเหลือซื้อเครื่องดนตรีให้ ปัญญาจึงได้เป็นนักร้องนำของวง และสานสัมพันธ์กับเป่ว',
      'image':
          'https://www.24-hd.com/wp-content/uploads/2023/02/Panya-Renu-2011-%E0%B8%9B%E0%B8%B1%E0%B8%8D%E0%B8%8D%E0%B8%B2%E0%B9%80%E0%B8%A3%E0%B8%93%E0%B8%B9.jpg',
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
      'title': 'Alpha House (2014) หอแซ่บแสบยกก๊วน',
      'description':
          'เมื่อ ‘อัลฟ่า เฮาส์’ หอพักนักศึกษาชายที่ขึ้นชื่อในเรื่องปาร์ตี้ที่มันส์ที่สุดของมหาลัย ถูกรองคณบดีบีบบังคับให้แชร์หอพักร่วมกับเหล่านักศึกษาจากหอพักหญิง หากไม่เช่นนั้นก็ต้องถูกไล่ให้ไปอยู่นอกมหาลัย เหล่านิสิตหนุ่มสุดห้าวเหล่านี้จึงประกาศสงครามระหว่างเพศ เพื่อทวงสิทธิ์อันชอบธรรมที่จะจัดปาร์ตี้แบบเดิมกลับคืนมา',
      'image':
          'https://www.24-hd.com/wp-content/uploads/2023/03/Alpha-House-2014-%E0%B8%AB%E0%B8%AD%E0%B9%81%E0%B8%8B%E0%B9%88%E0%B8%9A%E0%B9%81%E0%B8%AA%E0%B8%9A%E0%B8%A2%E0%B8%81%E0%B8%81%E0%B9%8A%E0%B8%A7%E0%B8%99.jpg',
    },
    {
      'title': '22 Jump Street (2014) สายลับรั่วป่วนมหาลัย',
      'description':
          'สายลับรั่วป่วนมหาลัย สองหนุ่มคู่หูคู่ฮา สายลับเจนโก้ (แชนนิ่ง เททัม) และ สายลับชมิดท์ (โจนาห์ ฮิลล์) ต้องปลอมตัวแอ๊บแบ๊วเป็นนักศึกษา แฝงตัวเข้าไปสืบคดีในรั้วมหาวิทยาลัย สองหนุ่มจะกลายเป็นสายลับใจแตกหรือไม่',
      'image':
          'https://www.24-hd.com/wp-content/uploads/2023/03/22-Jump-Street-2014-%E0%B8%AA%E0%B8%B2%E0%B8%A2%E0%B8%A5%E0%B8%B1%E0%B8%9A%E0%B8%A3%E0%B8%B1%E0%B9%88%E0%B8%A7%E0%B8%9B%E0%B9%88%E0%B8%A7%E0%B8%99%E0%B8%A1%E0%B8%AB%E0%B8%B2%E0%B8%A5%E0%B8%B1%E0%B8%A2.jpg',
    },
    {
      'title': 'Hello Stranger (2010) กวน มึน โฮ',
      'description':
          'ผู้ชายที่จะไปประเทศเกาหลี ด้วยรองเท้าแตะคีบ และเสื้อยืดย้วยๆบวกกางเกงขาสั้น เขาเป็นคนเดียวในกรุ๊ปทัวร์ที่ไม่มีครอบครัวหรือคนรักมาด้วย บางทีที่นั่งว่างเปล่าข้างๆ อาจเป็นสาเหตุให้เขาเมามายขนาดนี้ในวันเดินทางหลังล้อเครื่องแตะพื้นผิวท่าอากาศยานกรุงโซลโปรแกรมเที่ยวตามรหัส 6-7-8 คือ ตื่นนอน 6 โมงเช้า – กินข้าว 7 โมงเช้า – ล้อหมุน 8 โมงเช้า คืนนั้นชายหนุ่มเลยต้องพึ่งเหล้าโซจู ซึ่งเขามาเมาสลบอยู่หน้าเกสท์เฮาส์แห่งหนึ่งในชุดคลุมอาบน้ำโรงแรม เช้าวันรุ่งขึ้น ชายหนุ่มลุกพรวดขึ้นมาหมิ่นเหม่เวลาล้อหมุน หญิงสาว (หนึ่งธิดา โสภณ) ที่ยืนอยู่ตรงนั้นร้องโวยวาย',
      'image':
          'https://www.24-hd.com/wp-content/uploads/2023/02/Hello-Stranger-2010-%E0%B8%81%E0%B8%A7%E0%B8%99-%E0%B8%A1%E0%B8%B6%E0%B8%99-%E0%B9%82%E0%B8%AE.jpg',
    },
    {
      'title': 'Panya Renu (2011) ปัญญาเรณู',
      'description':
          'เด็กชายชาวอีสานที่มีความสามารถในการร้องเพลง ฝึกซ้อมโปงลางกับเพื่อนๆ...',
      'image':
          'https://www.24-hd.com/wp-content/uploads/2023/02/Panya-Renu-2011-%E0%B8%9B%E0%B8%B1%E0%B8%8D%E0%B8%8D%E0%B8%B2%E0%B9%80%E0%B8%A3%E0%B8%93%E0%B8%B9.jpg',
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
