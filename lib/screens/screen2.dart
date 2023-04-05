import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:test/style/color.dart';
import 'package:test/widgets/constant.dart';

class Screen2 extends StatefulWidget {
  const Screen2({super.key});

  @override
  State<Screen2> createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
   int pageIdx = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
bottomNavigationBar: BottomNavigationBar(
        onTap: (idx){
          setState(() {
            pageIdx = idx;
          });
        },
        
        type:BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey.shade500,
        currentIndex: pageIdx,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.library_books, size: 30,),
            label: 'Notes'
            ),
            BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month, size: 30,),
            label: 'Calender'
            ),
            
            BottomNavigationBarItem(
            icon: Icon(Icons.image, size: 30,),
            label: 'Image'),
            BottomNavigationBarItem(
            icon: Icon(Icons.style, size: 30,),
            label: 'Add'),
        ]),
       body: pages[pageIdx],
    );
  }
}