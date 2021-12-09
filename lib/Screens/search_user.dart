// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart';
//
// class SerchUser extends StatefulWidget {
//
//   @override
//   _SerchUserState createState() => _SerchUserState();
// }
//
// class _SerchUserState extends State<SerchUser> {
//   String serverResponse = 'Server response';
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.all(32.0),
//         child: Align(
//           alignment: Alignment.topCenter,
//           child: SizedBox(
//             width: 200,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: <Widget>[
//                 ElevatedButton(
//                   child: Text('Send request to server'),
//                   onPressed: () {
//                     _makeGetRequest();
//                   },
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Text(serverResponse),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//
//
//
//   }
//   _makeGetRequest() async {
//     final url = Uri.parse(_localhost());
//     Response response = await get(url);
//     setState(() {
//       serverResponse = response.body;
//     });
//   }
//
//   String _localhost() {
//     if (Platform.isAndroid) {
//       return 'http://10.0.2.2:3000/list';
//     } else {
//       return 'http://localhost:3000/list';
//     }
//   }
// }





import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:nprm_asgmnt1_test1/Datas/data_class.dart';
import 'dart:convert';

import '../search_page.dart';

class SerchUser extends StatefulWidget {
  @override
  _SerchUserState createState() => _SerchUserState();
}

class _SerchUserState extends State<SerchUser> {

  List<Employee> _posts = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pmj DB'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (ctx)=> SearchPage(posts: _posts,)
              ));
            },
          )
        ],
      ),

      body: FutureBuilder(
        future: _getData(),
        builder: (ctx,snapshot){
          if(snapshot.connectionState ==  ConnectionState.waiting)
            return CircularProgressIndicator();
//
          return ListView.builder(
            itemBuilder: (ctx,i){
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                    title: Text(_posts[i].name.toString()),
                    subtitle: Text(_posts[i].address.toString()),
                  ),
                  Divider(height: 0,)
                ],
              );
            },
            itemCount: _posts.length,
          );
        },
      ),
    );
  }

  Future<void> _getData() async{
    var url = 'http://10.0.2.2:3000/list';
    http.get(Uri.parse(url)).then((data){
      return json.decode(data.body);
    }).then((data){
      for(var json in data[0]){
        _posts.add(Employee.fromJson(json));
      }
    }).catchError((e){
      print(e);
    });
  }
}


