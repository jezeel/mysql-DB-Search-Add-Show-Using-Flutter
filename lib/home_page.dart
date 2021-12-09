import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Screens/add_user.dart';
import 'Screens/search_user.dart';
import 'remote_json_code.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('DataBase Connecting', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),),
        ),
        backgroundColor: Colors.grey,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        
        children: [
          Center(
            child: SizedBox(
                height: 50,
                width: 200,
                child: FlatButton(onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return SerchUser();
                      },
                    ),
                  );
                },
                  child: const Text('Search User',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),),
                  color: Colors.blueAccent,)),
          ),
          const SizedBox(height: 50,),
          SizedBox(
              height: 50,
              width: 200,
              child: FlatButton(onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return AddUser();
                    },
                  ),
                );
              },
                child: const Text('Add User',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),),
                color: Colors.blueAccent,)),
          const SizedBox(height: 50,),
          SizedBox(
              height: 50,
              width: 200,
              child: FlatButton(onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return RemoteJson();
                    },
                  ),
                );
              },
                child: const Text('Show DataBase',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),),
                color: Colors.blueAccent,)),
        ],
      ),
    );
  }
}
