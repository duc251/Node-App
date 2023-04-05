import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:test/style/color.dart';

Widget noteCard(Function()? ontap, QueryDocumentSnapshot doc){
  return InkWell(
    onTap: ontap,
    child: Container(
      padding: EdgeInsets.all(8.0),
      margin: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: MainColor.cardsColor[doc['color_id']],
        borderRadius:BorderRadius.circular(8.0),  ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(doc["note_title"],
            style: MainColor.mainTitle,
            ),
            SizedBox(height: 4.0,),
            Text(
              doc["create_date"],
              style: MainColor.dateTitle,
            ),
                SizedBox(height: 8.0,),
            Text(
              doc["note_content"],
              style: MainColor.mainContent,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
    ),
    
  );
}