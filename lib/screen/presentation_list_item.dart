import 'package:flutter/material.dart';
import 'package:tech_assembly/models/presentation.dart';
import 'package:tech_assembly/repository/presentation_repository.dart';

class PresentationListItem extends StatelessWidget {
  final Presentation presentation;

  const PresentationListItem({Key key, this.presentation}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: new BoxDecoration(
          border: new Border(
              bottom: BorderSide(width: 1.0, color: Colors.black12))),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Row(
              children: [
                SizedBox(
                  width: 60,
                  child: Icon(
                    Icons.account_circle,
                    size: 50,
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${presentation.title}",
                      textAlign: TextAlign.start,
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      '発表者：${presentation.presenter}',
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      "所属：${presentation.department}",
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
              ],
            ),
            Align(
            alignment: Alignment.centerRight,

                child:InkWell(
                child:
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.audiotrack,
                    ),
                    Text(
                      "${presentation.like}",
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
                onTap: () {
                  presentation.like = presentation.like + 1;
                  PresentationRepository().update(presentation);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
