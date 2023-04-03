import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
//------------------------------------------------------------------------------------------------------------------------------

class Favorites extends StatelessWidget {
  final store = FirebaseFirestore.instance;
  final user = FirebaseAuth.instance.currentUser!;
  Favorites({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: store.collection(user.email!).snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Favorites"),
          ),
          body: snapshot.hasData
              ? buildFavoritesList(snapshot.data!)
              : const Center(
                  child: CircularProgressIndicator(),
                ),
        );
      },
    );
  }

  ListView buildFavoritesList(QuerySnapshot data) {
    return ListView.builder(
      itemCount: data.size,
      itemBuilder: (BuildContext context, int index) {
        var model = data.docs.elementAt(index);
        return ListTile(
          leading: Image.network(model['image']!),
          title: Text(model['title']),
          subtitle: Text(model['detail']),
          onTap: () {
            print(model['title']);
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => FavoritesDetail(model['title'])));
          },
        );
      },
    );
  }
}

class FavoritesDetail extends StatefulWidget {
  final String _idi; //if you have multiple values add here

  const FavoritesDetail(this._idi, {Key? key})
      : super(key: key); //add also..example this.abc,this...
  @override
  State createState() => _FavoritesDetailState();
}

class _FavoritesDetailState extends State<FavoritesDetail> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final user = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    String id = widget._idi;
    return StreamBuilder(
        stream: getFavorites(id),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          return Scaffold(
            appBar: AppBar(
              title: const Text("Favorites Details"),
            ),
            body: snapshot.hasData
                ? buildFavoritesList(snapshot.data!)
                : const Center(
                    child: CircularProgressIndicator(),
                  ),
          );
        });
  }

  ListView buildFavoritesList(QuerySnapshot data) {
    return ListView.builder(
      itemCount: data.docs.length,
      itemBuilder: (BuildContext context, int index) {
        var model = data.docs.elementAt(index);
        return ListTile(
          leading: Image.network(model['image']!),
          title: Text(model['title']),
          subtitle: Text(model['detail']),
          trailing: ElevatedButton(
              child: const Text('Delete'),
              onPressed: () {
                print(model.id);
                deleteValue(model.id);
                Navigator.pop(context);
              }),
        );
      },
    );
  }

  Future<void> deleteValue(String titleName) async {
    await _firestore
        .collection(user.email!)
        .doc(titleName)
        .delete()
        .catchError((e) {
      print(e);
    });
  }

  Stream<QuerySnapshot> getFavorites(String titleName) {
    // Firestore _firestore = Firestore.instance;
    return _firestore
        .collection(user.email!)
        .where('title', isEqualTo: titleName)
        .snapshots();
  }
}
