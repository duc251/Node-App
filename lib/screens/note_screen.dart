import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:test/style/color.dart';
class NoteEditorScreen extends StatefulWidget {
  const NoteEditorScreen({super.key});

  @override
  State<NoteEditorScreen> createState() => _NoteEditorScreenState();
}

class _NoteEditorScreenState extends State<NoteEditorScreen> {
  int color_id = Random().nextInt(MainColor.cardsColor.length);
  String date =DateTime.now().toString();
  TextEditingController _titleController = TextEditingController();
   TextEditingController _mainController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: MainColor.cardsColor[color_id],
      appBar: AppBar(
        backgroundColor: MainColor.cardsColor[color_id],
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text("Add Note",
        style: TextStyle(color:Colors.black),),
        
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Write',
              ),
              style: MainColor.mainTitle,
            ),
            SizedBox(height: 8.0,),
            Text(date,style: MainColor.dateTitle,),
            SizedBox(height: 28.0,
            ),
            TextField(
              controller: _mainController,
              keyboardType: TextInputType.multiline,
              maxLines: null ,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Note',
              ),
              style: MainColor.mainContent,
            ),
          ],
        ),
    ),
    floatingActionButton: FloatingActionButton(
      backgroundColor: MainColor.accentColor,
      onPressed: () async{
        FirebaseFirestore.instance.collection("Notes").add({
          "note_title": _titleController.text,
          "create_date": date,
          "note_content": _mainController.text,
          "color_id": color_id
        }).then((value){
          print(value.id);
          Navigator.pop(context);

        }).catchError((error)=>print("Failed to add new $error"));
      },
      child:  Icon(Icons.save),
      ),
    );
  }
}