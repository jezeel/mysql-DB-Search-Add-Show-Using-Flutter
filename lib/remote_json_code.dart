
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:nprm_asgmnt1_test1/Datas/data_class.dart';


class RemoteJson extends StatefulWidget {
  const RemoteJson({Key? key}) : super(key: key);

  @override
  _RemoteJsonState createState() => _RemoteJsonState();
}

class _RemoteJsonState extends State<RemoteJson> {
  Future<List<Employee>> _getEmployee() async{
    var empData=await http.get(Uri.parse('http://10.0.2.2:3000/list'));

    var jsonData=json.decode(empData.body);
    List<Employee> employees=[];
    for(var emp in jsonData[0])
    {
      Employee employee=Employee(name: emp['name'], address: emp['address']);
      employees.add(employee);
    }
    return employees;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("Full DataBase"),
      ),
      body: Container(
        child: FutureBuilder(
            future: _getEmployee(),
            builder: (BuildContext context, AsyncSnapshot snapshot){
              if(snapshot.data==null){
                return Container(
                  child: Center(child: Text("Loading..."),),
                );
              }else{
                return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index){
                    return ListTile(

                      title:Text(snapshot.data[index].name),
                      subtitle:Text(snapshot.data[index].address),
                    );
                  },
                );
              }
            }
        ),

      ),

    );
  }
}



