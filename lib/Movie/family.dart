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

class Familypage extends StatefulWidget {
  const Familypage({Key? key}) : super(key: key);
  @override
  _FamilypageState createState() => _FamilypageState();
}

class _FamilypageState extends State<Familypage> {
  final List<Map<String, String>> movies = [
    {
      'title': 'Double Dad (2021) ดับเบิลแด้ด',
      'description':
          'เรื่องราวของVicenza วัย 18 ปีที่เธออยู่กับแม่สองคนโดยที่เธอไม่รู้เลยว่าพ่อของเธอเป็นใคร ระหว่างแม่ไม่อยู่บ้านเธอจึงใช้โอกาสนี้ออกตามหาพ่อที่แท้จริงของเธอ และนี่ก็เป็นจุดเริ่มต้นของเรื่องราววุ่นๆมากมาย',
      'image':
          'https://mv-hd.com/wp-content/uploads/2023/03/f97844348d33c56ed3892da5f45033d2.jpg',
    },
    {
      'title': 'June & Kopi (2021) จูนกับโกปี้',
      'description':
          'สามีภรรยาวัยหนุ่มสาวเก็บสุนัขข้างถนนมาเลี้ยง มันเข้าขากันดีกับพิตบูลที่ทั้งคู่เลี้ยงไว้อยู่แล้ว กลายเป็นคู่หูสี่ขาในบ้านที่เต็มไปด้วยความรักและความอบอุ่น',
      'image':
          'https://mv-hd.com/wp-content/uploads/2023/03/1853c1e83ad533add8a4af19ef3a4837.jpg',
    },
    {
      'title': 'Sardar Ka Grandson (2021) อธิษฐานรักข้ามแดน',
      'description':
          'ภารกิจของหลานชายผู้ทุ่มเทในการนำบ้านบรรพบุรุษกลับมาให้ย่าที่กำลังล้มป่วยกลายเป็นเรื่องราวข้ามพรมแดนที่แสนวุ่นวายและชวนขบขัน',
      'image':
          'https://mv-hd.com/wp-content/uploads/2023/03/a51e8a6c3166987ab6d1138db145666a.jpg',
    },
    {
      'title': 'Crashing Through the Snow (2021)',
      'description':
          'ในเมืองออสติน แม็กกี้ คอลลินส์และเจฟฟ์ แรนดอลล์ ยังคงเป็นเพื่อนสนิทกัน ซึ่งเป็นประโยชน์ในการเลี้ยงลูกสองคน ได้แก่ มีอา แรนดัลล์ วัย 12 ขวบ และโซฟี แรนดอลล์วัยรุ่น โดยเฉพาะอย่างยิ่งในช่วงคริสต์มาสที่พวกเขาใช้เวลาอยู่ด้วยกันแม้หลังจากแยกทางกัน คริสต์มาสนี้สิ่งต่างๆ ได้เปลี่ยนแปลงไปด้วย',
      'image':
          'https://mv-hd.com/wp-content/uploads/2023/03/be6bcea21b144e48cc9b23144c534b57.jpg',
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
                title: const Text("ครอบครัว Family",
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
                    Text('VSM 8.8', style: TextStyle(color: Colors.black)),
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
                    Navigator.pushNamed(context, '/Double_Dad');
                  },
                ),
                ListTile(
                  leading: Image.network(movies[1]['image']!),
                  title: Text(
                    movies[1]['title']!,
                    style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                  ),
                  subtitle: Row(children: const <Widget>[
                    Text('VSM 6.1', style: TextStyle(color: Colors.black)),
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
                    Navigator.pushNamed(context, '/June_Kopi');
                  },
                ),
                ListTile(
                  leading: Image.network(movies[2]['image']!),
                  title: Text(
                    movies[2]['title']!,
                    style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                  ),
                  subtitle: Row(children: const <Widget>[
                    Text('VSM 5.1', style: TextStyle(color: Colors.black)),
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
                    Navigator.pushNamed(context, '/Sardar_Ka_Grandson');
                  },
                ),
                ListTile(
                  leading: Image.network(movies[3]['image']!),
                  title: Text(
                    movies[3]['title']!,
                    style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                  ),
                  subtitle: Row(children: const <Widget>[
                    Text('VSM 6.5', style: TextStyle(color: Colors.black)),
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
                    Navigator.pushNamed(context, '/Crashing_Through_the_Snow');
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
      'title': 'Double Dad (2021) ดับเบิลแด้ด',
      'description':
          'เรื่องราวของVicenza วัย 18 ปีที่เธออยู่กับแม่สองคนโดยที่เธอไม่รู้เลยว่าพ่อ...',
      'image':
          'https://mv-hd.com/wp-content/uploads/2023/03/f97844348d33c56ed3892da5f45033d2.jpg',
    },
    {
      'title': 'June & Kopi (2021) จูนกับโกปี้',
      'description':
          'สามีภรรยาวัยหนุ่มสาวเก็บสุนัขข้างถนนมาเลี้ยง มันเข้าขากันดีกับพิตบูลที่ทั้งคู่เลี้ยงไว้อยู่แล้ว กลายเป็นคู่หูสี่ขาในบ้านที่เต็มไปด้วยความรักและความอบอุ่น',
      'image':
          'https://mv-hd.com/wp-content/uploads/2023/03/1853c1e83ad533add8a4af19ef3a4837.jpg',
    },
    {
      'title': 'Sardar Ka Grandson (2021) อธิษฐานรักข้ามแดน',
      'description':
          'ภารกิจของหลานชายผู้ทุ่มเทในการนำบ้านบรรพบุรุษกลับมาให้ย่าที่กำลังล้มป่วยกลายเป็นเรื่องราวข้ามพรมแดนที่แสนวุ่นวายและชวนขบขัน',
      'image':
          'https://mv-hd.com/wp-content/uploads/2023/03/a51e8a6c3166987ab6d1138db145666a.jpg',
    },
    {
      'title': 'Crashing Through the Snow (2021)',
      'description':
          'ในเมืองออสติน แม็กกี้ คอลลินส์และเจฟฟ์ แรนดอลล์ ยังคงเป็นเพื่อนสนิทกัน ซึ่งเป็นประโยชน์ในการเลี้ยงลูกสองคน ได้แก่ มีอา แรนดัลล์ วัย 12 ขวบ และโซฟี แรนดอลล์วัยรุ่น โดยเฉพาะอย่างยิ่งในช่วงคริสต์มาสที่พวกเขาใช้เวลาอยู่ด้วยกันแม้หลังจากแยกทางกัน คริสต์มาสนี้สิ่งต่างๆ ได้เปลี่ยนแปลงไปด้วย',
      'image':
          'https://mv-hd.com/wp-content/uploads/2023/03/be6bcea21b144e48cc9b23144c534b57.jpg',
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
      'title': 'Double Dad (2021) ดับเบิลแด้ด',
      'description':
          'เรื่องราวของVicenza วัย 18 ปีที่เธออยู่กับแม่สองคนโดยที่เธอไม่รู้เลยว่าพ่อของเธอเป็นใคร ระหว่างแม่ไม่อยู่บ้านเธอจึงใช้โอกาสนี้ออกตามหาพ่อที่แท้จริงของเธอ และนี่ก็เป็นจุดเริ่มต้นของเรื่องราววุ่นๆมากมาย',
      'image':
          'https://mv-hd.com/wp-content/uploads/2023/03/f97844348d33c56ed3892da5f45033d2.jpg',
    },
    {
      'title': 'June & Kopi (2021) จูนกับโกปี้',
      'description':
          'สามีภรรยาวัยหนุ่มสาวเก็บสุนัขข้างถนนมาเลี้ยง มันเข้าขากันดีกับพิตบูลที่ทั้งคู่เลี้ยง...',
      'image':
          'https://mv-hd.com/wp-content/uploads/2023/03/1853c1e83ad533add8a4af19ef3a4837.jpg',
    },
    {
      'title': 'Sardar Ka Grandson (2021) อธิษฐานรักข้ามแดน',
      'description':
          'ภารกิจของหลานชายผู้ทุ่มเทในการนำบ้านบรรพบุรุษกลับมาให้ย่าที่กำลังล้มป่วยกลายเป็นเรื่องราวข้ามพรมแดนที่แสนวุ่นวายและชวนขบขัน',
      'image':
          'https://mv-hd.com/wp-content/uploads/2023/03/a51e8a6c3166987ab6d1138db145666a.jpg',
    },
    {
      'title': 'Crashing Through the Snow (2021)',
      'description':
          'ในเมืองออสติน แม็กกี้ คอลลินส์และเจฟฟ์ แรนดอลล์ ยังคงเป็นเพื่อนสนิทกัน ซึ่งเป็นประโยชน์ในการเลี้ยงลูกสองคน ได้แก่ มีอา แรนดัลล์ วัย 12 ขวบ และโซฟี แรนดอลล์วัยรุ่น โดยเฉพาะอย่างยิ่งในช่วงคริสต์มาสที่พวกเขาใช้เวลาอยู่ด้วยกันแม้หลังจากแยกทางกัน คริสต์มาสนี้สิ่งต่างๆ ได้เปลี่ยนแปลงไปด้วย',
      'image':
          'https://mv-hd.com/wp-content/uploads/2023/03/be6bcea21b144e48cc9b23144c534b57.jpg',
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
      'title': 'Double Dad (2021) ดับเบิลแด้ด',
      'description':
          'เรื่องราวของVicenza วัย 18 ปีที่เธออยู่กับแม่สองคนโดยที่เธอไม่รู้เลยว่าพ่อของเธอเป็นใคร ระหว่างแม่ไม่อยู่บ้านเธอจึงใช้โอกาสนี้ออกตามหาพ่อที่แท้จริงของเธอ และนี่ก็เป็นจุดเริ่มต้นของเรื่องราววุ่นๆมากมาย',
      'image':
          'https://mv-hd.com/wp-content/uploads/2023/03/f97844348d33c56ed3892da5f45033d2.jpg',
    },
    {
      'title': 'June & Kopi (2021) จูนกับโกปี้',
      'description':
          'สามีภรรยาวัยหนุ่มสาวเก็บสุนัขข้างถนนมาเลี้ยง มันเข้าขากันดีกับพิตบูลที่ทั้งคู่เลี้ยงไว้อยู่แล้ว กลายเป็นคู่หูสี่ขาในบ้านที่เต็มไปด้วยความรักและความอบอุ่น',
      'image':
          'https://mv-hd.com/wp-content/uploads/2023/03/1853c1e83ad533add8a4af19ef3a4837.jpg',
    },
    {
      'title': 'Sardar Ka Grandson (2021) อธิษฐานรักข้ามแดน',
      'description': 'ภารกิจของหลานชายผู้ทุ่มเทในการนำ...',
      'image':
          'https://mv-hd.com/wp-content/uploads/2023/03/a51e8a6c3166987ab6d1138db145666a.jpg',
    },
    {
      'title': 'Crashing Through the Snow (2021)',
      'description':
          'ในเมืองออสติน แม็กกี้ คอลลินส์และเจฟฟ์ แรนดอลล์ ยังคงเป็นเพื่อนสนิทกัน ซึ่งเป็นประโยชน์ในการเลี้ยงลูกสองคน ได้แก่ มีอา แรนดัลล์ วัย 12 ขวบ และโซฟี แรนดอลล์วัยรุ่น โดยเฉพาะอย่างยิ่งในช่วงคริสต์มาสที่พวกเขาใช้เวลาอยู่ด้วยกันแม้หลังจากแยกทางกัน คริสต์มาสนี้สิ่งต่างๆ ได้เปลี่ยนแปลงไปด้วย',
      'image':
          'https://mv-hd.com/wp-content/uploads/2023/03/be6bcea21b144e48cc9b23144c534b57.jpg',
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
      'title': 'Double Dad (2021) ดับเบิลแด้ด',
      'description':
          'เรื่องราวของVicenza วัย 18 ปีที่เธออยู่กับแม่สองคนโดยที่เธอไม่รู้เลยว่าพ่อของเธอเป็นใคร ระหว่างแม่ไม่อยู่บ้านเธอจึงใช้โอกาสนี้ออกตามหาพ่อที่แท้จริงของเธอ และนี่ก็เป็นจุดเริ่มต้นของเรื่องราววุ่นๆมากมาย',
      'image':
          'https://mv-hd.com/wp-content/uploads/2023/03/f97844348d33c56ed3892da5f45033d2.jpg',
    },
    {
      'title': 'June & Kopi (2021) จูนกับโกปี้',
      'description':
          'สามีภรรยาวัยหนุ่มสาวเก็บสุนัขข้างถนนมาเลี้ยง มันเข้าขากันดีกับพิตบูลที่ทั้งคู่เลี้ยงไว้อยู่แล้ว กลายเป็นคู่หูสี่ขาในบ้านที่เต็มไปด้วยความรักและความอบอุ่น',
      'image':
          'https://mv-hd.com/wp-content/uploads/2023/03/1853c1e83ad533add8a4af19ef3a4837.jpg',
    },
    {
      'title': 'Sardar Ka Grandson (2021) อธิษฐานรักข้ามแดน',
      'description':
          'ภารกิจของหลานชายผู้ทุ่มเทในการนำบ้านบรรพบุรุษกลับมาให้ย่าที่กำลังล้มป่วยกลายเป็นเรื่องราวข้ามพรมแดนที่แสนวุ่นวายและชวนขบขัน',
      'image':
          'https://mv-hd.com/wp-content/uploads/2023/03/a51e8a6c3166987ab6d1138db145666a.jpg',
    },
    {
      'title': 'Crashing Through the Snow (2021)',
      'description':
          'ในเมืองออสติน แม็กกี้ คอลลินส์และเจฟฟ์ แรนดอลล์ ยังคงเป็นเพื่อนสนิทกัน...',
      'image':
          'https://mv-hd.com/wp-content/uploads/2023/03/be6bcea21b144e48cc9b23144c534b57.jpg',
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
