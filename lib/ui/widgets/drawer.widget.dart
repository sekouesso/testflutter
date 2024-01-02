import 'package:flutter/material.dart';
import 'package:testflutter/config/global.params.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
           DrawerHeader(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      colors: [
                        Colors.white,
                        Colors.deepOrange
                      ]
                  )
              ),
              child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      CircleAvatar(
                        backgroundImage: AssetImage("images/logo.jpg") ,
                        radius: 40,
                      ),
                      CircleAvatar(
                        backgroundImage: AssetImage("images/profile1.jpg") ,
                        radius: 40,
                      ),
                    ],
                  ),
              ),
          ),
          ...(GlobalParams.menus as List).map((item)  {
             return Column(
               children: [
                 ListTile(
                 title: Text('${item['title']}',style: TextStyle(fontSize: 22),),
                  leading: item['icon'],
                  trailing: const Icon(Icons.arrow_right,color: Colors.orange,),
                  onTap: (){
                  Navigator.of(context).pop();
                  Navigator.pushNamed(context, "${item['route']}");
                  },
                  ),
                 Divider(color: Colors.orange, height: 10,)
               ],
             );
           })
        ],
      ),
    );
  }
}