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

class Animationpage extends StatefulWidget {
  const Animationpage({Key? key}) : super(key: key);
  @override
  _AnimationpageState createState() => _AnimationpageState();
}

class _AnimationpageState extends State<Animationpage> {
  final List<Map<String, String>> movies = [
    {
      'title': 'Hotel Transylvania (2012) โรงแรมผี หนีไปพักร้อน',
      'description':
          'ยินดีต้อนรับสู่โรงแรม Hotel Transylvania รีสอร์ทสุดหรูที่เหล่าผีๆ และครอบครัวของพวกเขาสามารถมีชีวิตอยู่มันได้อิสระ ไม่มีมนุษย์ไปรบกวนพวกเขา ในวันพิเศษหนึ่ง แดรกคูล่า ได้เชิญมอนสเตอร์ที่มีชื่อเสียงมากที่สุดในโลก ทั้งแฟรงเกนสไตน์ มัมมี่ มนุษย์ล่องหน มนุษย์หมาป่าและอื่น ๆ เพื่อเฉลิมฉลองวันเกิดครบ 118 ปีของลูกสาว Mavis ของเขา',
      'image':
          'https://www.24-hd.com/wp-content/uploads/2023/02/Hotel-Transylvania-2012-%E0%B9%82%E0%B8%A3%E0%B8%87%E0%B9%81%E0%B8%A3%E0%B8%A1%E0%B8%9C%E0%B8%B5-%E0%B8%AB%E0%B8%99%E0%B8%B5%E0%B9%84%E0%B8%9B%E0%B8%9E%E0%B8%B1%E0%B8%81%E0%B8%A3%E0%B9%89%E0%B8%AD%E0%B8%99.jpg',
    },
    {
      'title':
          'Detective Conan The Culprit Hanzawa (2023) ยอดนักสืบจิ๋วโคนัน ฮันซาวะ ตัวร้ายสุดโหด',
      'description':
          'ฮันซาวะ ตัวร้ายสุดโหด ในซีรีส์ภาคแยกของ “ยอดนักสืบจิ๋วโคนัน” ผู้ต้องสงสัยในเงามืดย้ายไปเบกะ เมืองที่เต็มไปด้วยอาชญากรรมพร้อมกับแผนฆาตกรรม',
      'image':
          'https://www.24-hd.com/wp-content/uploads/2023/02/Detective-Conan-The-Culprit-Hanzawa-2023-%E0%B8%A2%E0%B8%AD%E0%B8%94%E0%B8%99%E0%B8%B1%E0%B8%81%E0%B8%AA%E0%B8%B7%E0%B8%9A%E0%B8%88%E0%B8%B4%E0%B9%8B%E0%B8%A7%E0%B9%82%E0%B8%84%E0%B8%99%E0%B8%B1%E0%B8%99-%E0%B8%AE%E0%B8%B1%E0%B8%99%E0%B8%8B%E0%B8%B2%E0%B8%A7%E0%B8%B0-%E0%B8%95%E0%B8%B1%E0%B8%A7%E0%B8%A3%E0%B9%89%E0%B8%B2%E0%B8%A2%E0%B8%AA%E0%B8%B8%E0%B8%94%E0%B9%82%E0%B8%AB%E0%B8%94.jpg',
    },
    {
      'title': 'Puss in Boots (2011) พุซ อิน บู๊ทส์',
      'description':
          'เมื่อนานมาแล้ว ก่อนที่พุซ อิน บู๊ทส์ จะได้พบกับเชร็ค เขาได้กระทำการออกผจญภัยกับคิตตี้ ซอฟท์พอว์ ซึ่งเป็นแมวสาวที่ปราดเปรียว รวมถึง ฮัมป์ตี้ ดัมป์ตี้ ซึ่งเป็นผู้ทรงปัญญาประจำกลุ่ม แต่ก็มีสิ่งที่ก่อให้เกิดความโกลาหล เมื่อแจ๊คและจิลซึ่งเป็นพวกนอกกฎหมาย',
      'image':
          'https://www.24-hd.com/wp-content/uploads/2023/01/Puss-in-Boots-2011-%E0%B8%9E%E0%B8%B8%E0%B8%8B-%E0%B8%AD%E0%B8%B4%E0%B8%99-%E0%B8%9A%E0%B8%B9%E0%B9%8A%E0%B8%97%E0%B8%AA%E0%B9%8C.jpg',
    },
    {
      'title': 'One Piece Film Red (2022) วันพีซ ฟิล์ม เรด',
      'description':
          'เรื่องราวของหนุ่มหมวกฟางที่ตามหาวันพีช ได้เจอเพื่อนเก่าที่ชื่ออูตะ และได้เกิดเรื่องมากมาย',
      'image':
          'https://www.24-hd.com/wp-content/uploads/2022/09/One-Piece-Film-Red-2022-%E0%B8%A7%E0%B8%B1%E0%B8%99%E0%B8%9E%E0%B8%B5%E0%B8%8B-%E0%B8%9F%E0%B8%B4%E0%B8%A5%E0%B9%8C%E0%B8%A1-%E0%B9%80%E0%B8%A3%E0%B8%94.jpg',
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
                title: const Text("แอนนิเมชั่น Animation",
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
                    Text('VSM 6.1', style: TextStyle(color: Colors.black)),
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
                    Navigator.pushNamed(context, '/Hotel_Transylvania');
                  },
                ),
                ListTile(
                  leading: Image.network(movies[1]['image']!),
                  title: Text(
                    movies[1]['title']!,
                    style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                  ),
                  subtitle: Row(children: const <Widget>[
                    Text('VSM 8.1', style: TextStyle(color: Colors.black)),
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
                    Navigator.pushNamed(
                        context, '/Detective_Conan_The_Culprit_Hanzawa');
                  },
                ),
                ListTile(
                  leading: Image.network(movies[2]['image']!),
                  title: Text(
                    movies[2]['title']!,
                    style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                  ),
                  subtitle: Row(children: const <Widget>[
                    Text('VSM 8.0', style: TextStyle(color: Colors.black)),
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
                    Navigator.pushNamed(context, '/Puss_in_Boots');
                  },
                ),
                ListTile(
                  leading: Image.network(movies[3]['image']!),
                  title: Text(
                    movies[3]['title']!,
                    style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                  ),
                  subtitle: Row(children: const <Widget>[
                    Text('VSM 8.9', style: TextStyle(color: Colors.black)),
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
                    Navigator.pushNamed(context, '/One_Piece_Film_Red');
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
      'title': 'Hotel Transylvania (2012) โรงแรมผี หนีไปพักร้อน',
      'description': 'ยินดีต้อนรับสู่โรงแรม Hotel Transylvania รีสอร์ท...',
      'image':
          'https://www.24-hd.com/wp-content/uploads/2023/02/Hotel-Transylvania-2012-%E0%B9%82%E0%B8%A3%E0%B8%87%E0%B9%81%E0%B8%A3%E0%B8%A1%E0%B8%9C%E0%B8%B5-%E0%B8%AB%E0%B8%99%E0%B8%B5%E0%B9%84%E0%B8%9B%E0%B8%9E%E0%B8%B1%E0%B8%81%E0%B8%A3%E0%B9%89%E0%B8%AD%E0%B8%99.jpg',
    },
    {
      'title':
          'Detective Conan The Culprit Hanzawa (2023) ยอดนักสืบจิ๋วโคนัน ฮันซาวะ ตัวร้ายสุดโหด',
      'description':
          'ฮันซาวะ ตัวร้ายสุดโหด ในซีรีส์ภาคแยกของ “ยอดนักสืบจิ๋วโคนัน” ผู้ต้องสงสัยในเงามืดย้ายไปเบกะ เมืองที่เต็มไปด้วยอาชญากรรมพร้อมกับแผนฆาตกรรม',
      'image':
          'https://www.24-hd.com/wp-content/uploads/2023/02/Detective-Conan-The-Culprit-Hanzawa-2023-%E0%B8%A2%E0%B8%AD%E0%B8%94%E0%B8%99%E0%B8%B1%E0%B8%81%E0%B8%AA%E0%B8%B7%E0%B8%9A%E0%B8%88%E0%B8%B4%E0%B9%8B%E0%B8%A7%E0%B9%82%E0%B8%84%E0%B8%99%E0%B8%B1%E0%B8%99-%E0%B8%AE%E0%B8%B1%E0%B8%99%E0%B8%8B%E0%B8%B2%E0%B8%A7%E0%B8%B0-%E0%B8%95%E0%B8%B1%E0%B8%A7%E0%B8%A3%E0%B9%89%E0%B8%B2%E0%B8%A2%E0%B8%AA%E0%B8%B8%E0%B8%94%E0%B9%82%E0%B8%AB%E0%B8%94.jpg',
    },
    {
      'title': 'Puss in Boots (2011) พุซ อิน บู๊ทส์',
      'description':
          'เมื่อนานมาแล้ว ก่อนที่พุซ อิน บู๊ทส์ จะได้พบกับเชร็ค เขาได้กระทำการออกผจญภัยกับคิตตี้ ซอฟท์พอว์ ซึ่งเป็นแมวสาวที่ปราดเปรียว รวมถึง ฮัมป์ตี้ ดัมป์ตี้ ซึ่งเป็นผู้ทรงปัญญาประจำกลุ่ม แต่ก็มีสิ่งที่ก่อให้เกิดความโกลาหล เมื่อแจ๊คและจิลซึ่งเป็นพวกนอกกฎหมาย',
      'image':
          'https://www.24-hd.com/wp-content/uploads/2023/01/Puss-in-Boots-2011-%E0%B8%9E%E0%B8%B8%E0%B8%8B-%E0%B8%AD%E0%B8%B4%E0%B8%99-%E0%B8%9A%E0%B8%B9%E0%B9%8A%E0%B8%97%E0%B8%AA%E0%B9%8C.jpg',
    },
    {
      'title': 'One Piece Film Red (2022) วันพีซ ฟิล์ม เรด',
      'description':
          'เรื่องราวของหนุ่มหมวกฟางที่ตามหาวันพีช ได้เจอเพื่อนเก่าที่ชื่ออูตะ และได้เกิดเรื่องมากมาย',
      'image':
          'https://www.24-hd.com/wp-content/uploads/2022/09/One-Piece-Film-Red-2022-%E0%B8%A7%E0%B8%B1%E0%B8%99%E0%B8%9E%E0%B8%B5%E0%B8%8B-%E0%B8%9F%E0%B8%B4%E0%B8%A5%E0%B9%8C%E0%B8%A1-%E0%B9%80%E0%B8%A3%E0%B8%94.jpg',
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
      'title': 'Hotel Transylvania (2012) โรงแรมผี หนีไปพักร้อน',
      'description':
          'ยินดีต้อนรับสู่โรงแรม Hotel Transylvania รีสอร์ทสุดหรูที่เหล่าผีๆ และครอบครัวของพวกเขาสามารถมีชีวิตอยู่มันได้อิสระ ไม่มีมนุษย์ไปรบกวนพวกเขา ในวันพิเศษหนึ่ง แดรกคูล่า ได้เชิญมอนสเตอร์ที่มีชื่อเสียงมากที่สุดในโลก ทั้งแฟรงเกนสไตน์ มัมมี่ มนุษย์ล่องหน มนุษย์หมาป่าและอื่น ๆ เพื่อเฉลิมฉลองวันเกิดครบ 118 ปีของลูกสาว Mavis ของเขา',
      'image':
          'https://www.24-hd.com/wp-content/uploads/2023/02/Hotel-Transylvania-2012-%E0%B9%82%E0%B8%A3%E0%B8%87%E0%B9%81%E0%B8%A3%E0%B8%A1%E0%B8%9C%E0%B8%B5-%E0%B8%AB%E0%B8%99%E0%B8%B5%E0%B9%84%E0%B8%9B%E0%B8%9E%E0%B8%B1%E0%B8%81%E0%B8%A3%E0%B9%89%E0%B8%AD%E0%B8%99.jpg',
    },
    {
      'title': 'Detective Conan The Culprit Hanzawa',
      'description':
          'ฮันซาวะ ตัวร้ายสุดโหด ในซีรีส์ภาคแยกของ “ยอดนักสืบจิ๋วโคนัน”...',
      'image':
          'https://www.24-hd.com/wp-content/uploads/2023/02/Detective-Conan-The-Culprit-Hanzawa-2023-%E0%B8%A2%E0%B8%AD%E0%B8%94%E0%B8%99%E0%B8%B1%E0%B8%81%E0%B8%AA%E0%B8%B7%E0%B8%9A%E0%B8%88%E0%B8%B4%E0%B9%8B%E0%B8%A7%E0%B9%82%E0%B8%84%E0%B8%99%E0%B8%B1%E0%B8%99-%E0%B8%AE%E0%B8%B1%E0%B8%99%E0%B8%8B%E0%B8%B2%E0%B8%A7%E0%B8%B0-%E0%B8%95%E0%B8%B1%E0%B8%A7%E0%B8%A3%E0%B9%89%E0%B8%B2%E0%B8%A2%E0%B8%AA%E0%B8%B8%E0%B8%94%E0%B9%82%E0%B8%AB%E0%B8%94.jpg',
    },
    {
      'title': 'Puss in Boots (2011) พุซ อิน บู๊ทส์',
      'description':
          'เมื่อนานมาแล้ว ก่อนที่พุซ อิน บู๊ทส์ จะได้พบกับเชร็ค เขาได้กระทำการออกผจญภัยกับคิตตี้ ซอฟท์พอว์ ซึ่งเป็นแมวสาวที่ปราดเปรียว รวมถึง ฮัมป์ตี้ ดัมป์ตี้ ซึ่งเป็นผู้ทรงปัญญาประจำกลุ่ม แต่ก็มีสิ่งที่ก่อให้เกิดความโกลาหล เมื่อแจ๊คและจิลซึ่งเป็นพวกนอกกฎหมาย',
      'image':
          'https://www.24-hd.com/wp-content/uploads/2023/01/Puss-in-Boots-2011-%E0%B8%9E%E0%B8%B8%E0%B8%8B-%E0%B8%AD%E0%B8%B4%E0%B8%99-%E0%B8%9A%E0%B8%B9%E0%B9%8A%E0%B8%97%E0%B8%AA%E0%B9%8C.jpg',
    },
    {
      'title': 'One Piece Film Red (2022) วันพีซ ฟิล์ม เรด',
      'description':
          'เรื่องราวของหนุ่มหมวกฟางที่ตามหาวันพีช ได้เจอเพื่อนเก่าที่ชื่ออูตะ และได้เกิดเรื่องมากมาย',
      'image':
          'https://www.24-hd.com/wp-content/uploads/2022/09/One-Piece-Film-Red-2022-%E0%B8%A7%E0%B8%B1%E0%B8%99%E0%B8%9E%E0%B8%B5%E0%B8%8B-%E0%B8%9F%E0%B8%B4%E0%B8%A5%E0%B9%8C%E0%B8%A1-%E0%B9%80%E0%B8%A3%E0%B8%94.jpg',
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
      'title': 'Hotel Transylvania (2012) โรงแรมผี หนีไปพักร้อน',
      'description':
          'ยินดีต้อนรับสู่โรงแรม Hotel Transylvania รีสอร์ทสุดหรูที่เหล่าผีๆ และครอบครัวของพวกเขาสามารถมีชีวิตอยู่มันได้อิสระ ไม่มีมนุษย์ไปรบกวนพวกเขา ในวันพิเศษหนึ่ง แดรกคูล่า ได้เชิญมอนสเตอร์ที่มีชื่อเสียงมากที่สุดในโลก ทั้งแฟรงเกนสไตน์ มัมมี่ มนุษย์ล่องหน มนุษย์หมาป่าและอื่น ๆ เพื่อเฉลิมฉลองวันเกิดครบ 118 ปีของลูกสาว Mavis ของเขา',
      'image':
          'https://www.24-hd.com/wp-content/uploads/2023/02/Hotel-Transylvania-2012-%E0%B9%82%E0%B8%A3%E0%B8%87%E0%B9%81%E0%B8%A3%E0%B8%A1%E0%B8%9C%E0%B8%B5-%E0%B8%AB%E0%B8%99%E0%B8%B5%E0%B9%84%E0%B8%9B%E0%B8%9E%E0%B8%B1%E0%B8%81%E0%B8%A3%E0%B9%89%E0%B8%AD%E0%B8%99.jpg',
    },
    {
      'title':
          'Detective Conan The Culprit Hanzawa (2023) ยอดนักสืบจิ๋วโคนัน ฮันซาวะ ตัวร้ายสุดโหด',
      'description':
          'ฮันซาวะ ตัวร้ายสุดโหด ในซีรีส์ภาคแยกของ “ยอดนักสืบจิ๋วโคนัน” ผู้ต้องสงสัยในเงามืดย้ายไปเบกะ เมืองที่เต็มไปด้วยอาชญากรรมพร้อมกับแผนฆาตกรรม',
      'image':
          'https://www.24-hd.com/wp-content/uploads/2023/02/Detective-Conan-The-Culprit-Hanzawa-2023-%E0%B8%A2%E0%B8%AD%E0%B8%94%E0%B8%99%E0%B8%B1%E0%B8%81%E0%B8%AA%E0%B8%B7%E0%B8%9A%E0%B8%88%E0%B8%B4%E0%B9%8B%E0%B8%A7%E0%B9%82%E0%B8%84%E0%B8%99%E0%B8%B1%E0%B8%99-%E0%B8%AE%E0%B8%B1%E0%B8%99%E0%B8%8B%E0%B8%B2%E0%B8%A7%E0%B8%B0-%E0%B8%95%E0%B8%B1%E0%B8%A7%E0%B8%A3%E0%B9%89%E0%B8%B2%E0%B8%A2%E0%B8%AA%E0%B8%B8%E0%B8%94%E0%B9%82%E0%B8%AB%E0%B8%94.jpg',
    },
    {
      'title': 'Puss in Boots (2011) พุซ อิน บู๊ทส์',
      'description':
          'เมื่อนานมาแล้ว ก่อนที่พุซ อิน บู๊ทส์ จะได้พบกับเชร็ค เขาได้กระทำการออกผจญภัยกับคิตตี้...',
      'image':
          'https://www.24-hd.com/wp-content/uploads/2023/01/Puss-in-Boots-2011-%E0%B8%9E%E0%B8%B8%E0%B8%8B-%E0%B8%AD%E0%B8%B4%E0%B8%99-%E0%B8%9A%E0%B8%B9%E0%B9%8A%E0%B8%97%E0%B8%AA%E0%B9%8C.jpg',
    },
    {
      'title': 'One Piece Film Red (2022) วันพีซ ฟิล์ม เรด',
      'description':
          'เรื่องราวของหนุ่มหมวกฟางที่ตามหาวันพีช ได้เจอเพื่อนเก่าที่ชื่ออูตะ และได้เกิดเรื่องมากมาย',
      'image':
          'https://www.24-hd.com/wp-content/uploads/2022/09/One-Piece-Film-Red-2022-%E0%B8%A7%E0%B8%B1%E0%B8%99%E0%B8%9E%E0%B8%B5%E0%B8%8B-%E0%B8%9F%E0%B8%B4%E0%B8%A5%E0%B9%8C%E0%B8%A1-%E0%B9%80%E0%B8%A3%E0%B8%94.jpg',
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
      'title': 'Hotel Transylvania (2012) โรงแรมผี หนีไปพักร้อน',
      'description':
          'ยินดีต้อนรับสู่โรงแรม Hotel Transylvania รีสอร์ทสุดหรูที่เหล่าผีๆ และครอบครัวของพวกเขาสามารถมีชีวิตอยู่มันได้อิสระ ไม่มีมนุษย์ไปรบกวนพวกเขา ในวันพิเศษหนึ่ง แดรกคูล่า ได้เชิญมอนสเตอร์ที่มีชื่อเสียงมากที่สุดในโลก ทั้งแฟรงเกนสไตน์ มัมมี่ มนุษย์ล่องหน มนุษย์หมาป่าและอื่น ๆ เพื่อเฉลิมฉลองวันเกิดครบ 118 ปีของลูกสาว Mavis ของเขา',
      'image':
          'https://www.24-hd.com/wp-content/uploads/2023/02/Hotel-Transylvania-2012-%E0%B9%82%E0%B8%A3%E0%B8%87%E0%B9%81%E0%B8%A3%E0%B8%A1%E0%B8%9C%E0%B8%B5-%E0%B8%AB%E0%B8%99%E0%B8%B5%E0%B9%84%E0%B8%9B%E0%B8%9E%E0%B8%B1%E0%B8%81%E0%B8%A3%E0%B9%89%E0%B8%AD%E0%B8%99.jpg',
    },
    {
      'title':
          'Detective Conan The Culprit Hanzawa (2023) ยอดนักสืบจิ๋วโคนัน ฮันซาวะ ตัวร้ายสุดโหด',
      'description':
          'ฮันซาวะ ตัวร้ายสุดโหด ในซีรีส์ภาคแยกของ “ยอดนักสืบจิ๋วโคนัน” ผู้ต้องสงสัยในเงามืดย้ายไปเบกะ เมืองที่เต็มไปด้วยอาชญากรรมพร้อมกับแผนฆาตกรรม',
      'image':
          'https://www.24-hd.com/wp-content/uploads/2023/02/Detective-Conan-The-Culprit-Hanzawa-2023-%E0%B8%A2%E0%B8%AD%E0%B8%94%E0%B8%99%E0%B8%B1%E0%B8%81%E0%B8%AA%E0%B8%B7%E0%B8%9A%E0%B8%88%E0%B8%B4%E0%B9%8B%E0%B8%A7%E0%B9%82%E0%B8%84%E0%B8%99%E0%B8%B1%E0%B8%99-%E0%B8%AE%E0%B8%B1%E0%B8%99%E0%B8%8B%E0%B8%B2%E0%B8%A7%E0%B8%B0-%E0%B8%95%E0%B8%B1%E0%B8%A7%E0%B8%A3%E0%B9%89%E0%B8%B2%E0%B8%A2%E0%B8%AA%E0%B8%B8%E0%B8%94%E0%B9%82%E0%B8%AB%E0%B8%94.jpg',
    },
    {
      'title': 'Puss in Boots (2011) พุซ อิน บู๊ทส์',
      'description':
          'เมื่อนานมาแล้ว ก่อนที่พุซ อิน บู๊ทส์ จะได้พบกับเชร็ค เขาได้กระทำการออกผจญภัยกับคิตตี้ ซอฟท์พอว์ ซึ่งเป็นแมวสาวที่ปราดเปรียว รวมถึง ฮัมป์ตี้ ดัมป์ตี้ ซึ่งเป็นผู้ทรงปัญญาประจำกลุ่ม แต่ก็มีสิ่งที่ก่อให้เกิดความโกลาหล เมื่อแจ๊คและจิลซึ่งเป็นพวกนอกกฎหมาย',
      'image':
          'https://www.24-hd.com/wp-content/uploads/2023/01/Puss-in-Boots-2011-%E0%B8%9E%E0%B8%B8%E0%B8%8B-%E0%B8%AD%E0%B8%B4%E0%B8%99-%E0%B8%9A%E0%B8%B9%E0%B9%8A%E0%B8%97%E0%B8%AA%E0%B9%8C.jpg',
    },
    {
      'title': 'One Piece Film Red (2022) วันพีซ ฟิล์ม เรด',
      'description':
          'เรื่องราวของหนุ่มหมวกฟางที่ตามหาวันพีช ได้เจอเพื่อนเก่าที่ชื่ออูตะ และได้เกิดเรื่องมากมาย...',
      'image':
          'https://www.24-hd.com/wp-content/uploads/2022/09/One-Piece-Film-Red-2022-%E0%B8%A7%E0%B8%B1%E0%B8%99%E0%B8%9E%E0%B8%B5%E0%B8%8B-%E0%B8%9F%E0%B8%B4%E0%B8%A5%E0%B9%8C%E0%B8%A1-%E0%B9%80%E0%B8%A3%E0%B8%94.jpg',
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
