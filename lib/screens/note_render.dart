import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:test/style/color.dart';

class NoteRenderScreen extends StatefulWidget {
    NoteRenderScreen(this.doc, {super.key});
    QueryDocumentSnapshot doc;

  @override
  State<NoteRenderScreen> createState() => _NoteRenderScreenState();
}

class _NoteRenderScreenState extends State<NoteRenderScreen> {
  @override
  Widget build(BuildContext context) {
    int color_id = widget.doc['color_id'];
    return  Scaffold(
      backgroundColor: MainColor.cardsColor[color_id],
      appBar: AppBar(
        backgroundColor: MainColor.cardsColor[color_id],
        elevation: 0.0,
      ),
      body:   SafeArea(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.doc["note_title"],
              style: MainColor.mainTitle,
              ),
              SizedBox(height: 4.0,),
              Text(
                 widget.doc["create_date"],
                style: MainColor.dateTitle,
              ),
                  SizedBox(height: 8.0,),
              Text(
                 widget.doc["note_content"],
                style: MainColor.mainContent,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
      ),
    );
  }
}