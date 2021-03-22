import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class Design extends StatefulWidget {
  @override
  _DesignState createState() => _DesignState();
}

class _DesignState extends State<Design> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xfff7892b),
        title: Text("Design"),
      ),
      body: ListView(
        children: [
          Image.asset('assets/users.png'),
          Container(
            alignment: Alignment.center,
            child: Text(
              "Registered Users",
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            margin: EdgeInsets.all(10.0),
            child: StreamBuilder(
              stream:
                  FirebaseFirestore.instance.collection('Users').snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                      child: CircularProgressIndicator(
                    backgroundColor: Color(0xfff7892b),
                  ));
                } else {
                  final List<DocumentSnapshot> documents = snapshot.data.docs;

                  return ListView(
                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                      children: documents.map((doc) {
                        return CardTile(
                          name: doc['name'],
                          email: doc['email'],
                          phone: doc['phone'],
                        );
                      }).toList());
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

class CardTile extends StatelessWidget {
  final String name;
  final String email;
  final String phone;

  CardTile({this.name, this.email, this.phone});
  @override
  Widget build(BuildContext context) {
    TextStyle _style = TextStyle(fontSize: 16.0, fontWeight: FontWeight.w400);
    return Card(
      margin: EdgeInsets.all(8.0),
      elevation: 10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Container(
        padding: EdgeInsets.all(15.0),
        child: Column(
          children: [
            Container(
              child: CircleAvatar(
                radius: 35,
                backgroundImage: AssetImage('assets/user.png'),
              ),
            ),
            Row(
              children: [
                Icon(
                  Icons.person_outline,
                  color: Color(0xfff7892b),
                  size: 30.0,
                ),
                SizedBox(
                  width: 10.0,
                ),
                Text(
                  name,
                  style: _style,
                ),
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            Row(
              children: [
                Icon(
                  Icons.email_outlined,
                  color: Color(0xfff7892b),
                  size: 30.0,
                ),
                SizedBox(
                  width: 10.0,
                ),
                Text(
                  email,
                  style: _style,
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Icon(
                  Icons.phone_outlined,
                  color: Color(0xfff7892b),
                  size: 30.0,
                ),
                SizedBox(
                  width: 10.0,
                ),
                Text(
                  phone,
                  style: _style,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class CardTileShimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[100],
      highlightColor: Colors.grey[200],
      child: Card(
        margin: EdgeInsets.all(8.0),
        elevation: 10,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Container(
          height: 350,
          padding: EdgeInsets.all(15.0),
          child: Column(
            children: [],
          ),
        ),
      ),
    );
  }
}
