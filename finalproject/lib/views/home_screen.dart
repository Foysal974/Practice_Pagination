
import 'package:finalproject/controllers/home_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {

  static const routeName='/home_screen';

  final HomeScreenController _controller = Get.put(HomeScreenController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Obx(() => Text('${_controller.myValue.value}'))),
      ),
      body: Obx(() => ListView.builder(
              itemCount: _controller.randomuserDataList.length,
              itemBuilder: (c, i,) {
                return ListTile(
                  onTap: (){
                    _controller.removeItem(i); },
                  onLongPress:(){_controller.updateItem(i);},

                  title: Text(_controller.randomuserDataList[i].toString()),
                );
              })),

      bottomSheet: Container(
        height: 60,
        color: Colors.white,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 100,
            itemBuilder: (c,i)=> InkWell(
              onTap: (){
                _controller.getPaginationData(pageNo: i+1);
                print(i+1);
              },
                child: Chip(
                    label: Text('${i+1}')),))
      ),

    );
  }
}
