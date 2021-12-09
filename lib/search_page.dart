import 'package:flutter/material.dart';

import 'Datas/data_class.dart';

class SearchPage extends StatefulWidget {
  final List<Employee> posts;

  SearchPage({Key? key, required this.posts}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<Employee> _searchedPost = [];


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: TextField(
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
              hintText: 'Search Company Data',
              hintStyle: TextStyle(color: Colors.white),
              border: InputBorder.none
          ),
          onChanged: (val){
            setState(() {
              _searchedPost = widget.posts.where(
                      (el)=>el.name!.contains(val)
              ).toList();
            });
          },
        ),
      ),

      body: _searchedPost.isEmpty ?
      Center(
        child: Text('No match',style: Theme.of(context).textTheme.headline3,),
      ):
      ListView.builder(
        itemCount: _searchedPost.length,
        itemBuilder: (ctx,i){
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                title: Text(_searchedPost[i].name.toString()),
                subtitle: Text(_searchedPost[i].address.toString()),
              ),
              Divider(height: 0,)
            ],
          );
        },
      ),
    );
  }
}
