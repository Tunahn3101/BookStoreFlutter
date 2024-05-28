import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class MyBookMark extends StatefulWidget {
  const MyBookMark({super.key});

  @override
  State<MyBookMark> createState() => _MyBookMarkState();
}

class _MyBookMarkState extends State<MyBookMark> {
  static int page = 0;
  final ScrollController _sc = ScrollController();
  bool isLoading = false;
  List user = [];
  final dio = Dio();

  @override
  void initState() {
    _getMoreData(page);
    super.initState();
    _sc.addListener(() {
      if (_sc.position.pixels == _sc.position.maxScrollExtent) {
        _getMoreData(page);
      }
    });
  }

  @override
  void dispose() {
    _sc.dispose();
    super.dispose();
  }

  void _getMoreData(int index) async {
    if (!isLoading) {
      setState(() {
        isLoading = true;
      });
      var url = "https://randomuser.me/api/?page=$index&results=20&seed=abc";
      print(url);
      final response = await dio.get(url);
      List tList = [];

      for (int i = 0; i < response.data['result'].length; i++) {
        tList.add(response.data['result'][i]);
      }
      setState(() {
        isLoading = false;
        user.add(tList);
        page++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MyBookMark'),
        centerTitle: true,
      ),
      body: ListView.builder(
        controller: _sc,
        itemCount: user.length + 1,
        padding: const EdgeInsets.symmetric(vertical: 8),
        itemBuilder: (context, index) {
          if (index == user.length) {
            return Padding(
              padding: const EdgeInsets.all(8),
              child: Center(
                child: Opacity(
                  opacity: isLoading ? 1.0 : 00,
                ),
              ),
            );
          } else {
            return ListTile(
              leading: CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(user[index]['picture']['large']),
              ),
              title: Text((user[index]['name']['first'])),
              subtitle: Text((user[index]['email'])),
            );
          }
        },
      ),
    );
  }
}
