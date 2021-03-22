import 'package:flutter/material.dart';

class Dictionary extends StatefulWidget {
  @override
  _DictionaryState createState() => _DictionaryState();
}

class _DictionaryState extends State<Dictionary> {
  @override
  void initState() {
    super.initState();
    sortMap();
  }

  var _sortedKeys;
  Map<dynamic, String> dict = {
    '34': 'thirty-four',
    '90': 'ninety',
    '91': 'ninety-one',
    '21': 'twenty-one',
    '61': 'sixty-one',
    '9': 'nine',
    '2': 'two',
    '6': 'six',
    '3': 'three',
    '8': 'eight',
    '80': 'eighty',
    '81': 'eighty-one',
    'Ninety-Nine': '99',
    'nine-hundred': '900'
  };

  sortMap() {
    setState(() {
      _sortedKeys = dict.keys.toList()..sort();
      print(_sortedKeys);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xfff7892b),
        title: Text("Dictionary"),
      ),
      body: ListView(
        children: [
          Image.asset('assets/data.png'),
          Container(
            alignment: Alignment.center,
            child: Text(
              "Sorted Dictionary Data",
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            margin: EdgeInsets.all(10.0),
            child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: MediaQuery.of(context).size.height /
                        MediaQuery.of(context).size.height *
                        1.5),
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                itemCount: _sortedKeys.length,
                itemBuilder: (context, index) {
                  return DataCard(
                    index: index.toString(),
                    datKey: _sortedKeys[index],
                    value: dict[_sortedKeys[index]],
                  );
                }),
          ),
        ],
      ),
    );
  }
}

class DataCard extends StatelessWidget {
  final String index;
  final String datKey;
  final String value;

  DataCard({this.datKey, this.index, this.value});
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  "Sorted Index : ",
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  index,
                  style: TextStyle(fontSize: 14.0),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              alignment: Alignment.topLeft,
              child: Text(
                datKey + " : " + value,
                style: TextStyle(fontSize: 14.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
