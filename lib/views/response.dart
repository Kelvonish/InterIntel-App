import 'package:flutter/material.dart';
import 'package:interintel/models%20and%20data/getTodoData.dart';
import 'package:shimmer/shimmer.dart';

class Response extends StatefulWidget {
  @override
  _ResponseState createState() => _ResponseState();
}

class _ResponseState extends State<Response> {
  var _todo;
  bool _loading = true;
  @override
  void initState() {
    super.initState();
    getdata();
  }

  getdata() async {
    TodoData newClass = TodoData();
    await newClass.getTodoData();
    setState(() {
      _todo = newClass.data;
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xfff7892b),
        title: Text("Response"),
      ),
      body: ListView(
        children: [
          Image.asset('assets/todo.png'),
          Container(
            alignment: Alignment.center,
            child: Text(
              "Todo List",
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
          ),
          ListView.builder(
              itemCount: _loading ? 5 : _todo.length,
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return _loading
                    ? TodoCardShimmer()
                    : TodoCard(
                        title: _todo[index].title,
                        completed: _todo[index].completed
                            ? Icon(
                                Icons.done,
                                color: Colors.green,
                              )
                            : Icon(
                                Icons.clear,
                                color: Colors.red,
                              ),
                      );
              })
        ],
      ),
    );
  }
}

class TodoCard extends StatelessWidget {
  final String title;
  final Icon completed;
  TodoCard({this.title, this.completed});
  @override
  Widget build(BuildContext context) {
    TextStyle _title = TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.bold,
    );
    TextStyle _content =
        TextStyle(fontSize: 14.0, fontWeight: FontWeight.normal);
    return Card(
      margin: EdgeInsets.all(5.0),
      elevation: 10.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Container(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  "Title : ",
                  style: _title,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Text(
                    title,
                    style: _content,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            Row(
              children: [
                Text(
                  "Completed : ",
                  style: _title,
                ),
                completed
              ],
            )
          ],
        ),
      ),
    );
  }
}

class TodoCardShimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.white,
      highlightColor: Colors.grey[300],
      child: Card(
        margin: EdgeInsets.all(5.0),
        elevation: 10.0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Container(
          height: 70,
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: [],
          ),
        ),
      ),
    );
  }
}
