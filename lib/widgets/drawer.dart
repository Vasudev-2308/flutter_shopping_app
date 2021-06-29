import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class MyDrawer extends StatelessWidget {
  const MyDrawer({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 1,
      
      child: Container(
        color: Colors.deepPurple,
        child: ListView(
          padding: EdgeInsets.zero,
          
          children: [
            DrawerHeader(
              
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                
                margin: EdgeInsets.zero,
                
                accountName: Text("Vdx", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),),
                accountEmail: Text("hello@gmail", style: TextStyle(color: Colors.white, fontSize: 18)),
                currentAccountPicture: CircleAvatar(
                  
                  child: Container(
                    height: 50,
                    width: 50,
                    child: FlutterLogo()),
                ),
              )),
              ListTile(
                leading: Icon(CupertinoIcons.home, color: Colors.white,),
                title: Text("Home", style: TextStyle(color:Colors.white),),
              ),
              ListTile(
                leading: Icon(CupertinoIcons.tv_music_note_fill, color: Colors.white,),
                title: Text("Songs", style: TextStyle(color:Colors.white),),
              ),
              ListTile(
                leading: Icon(CupertinoIcons.paperplane, color: Colors.white,),
                title: Text("Telegram", style: TextStyle(color:Colors.white),),
              )
          ],
        ),
      ),
    );
  }
}