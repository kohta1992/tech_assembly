import 'package:flutter/material.dart';
import 'package:tech_assembly/models/presentation.dart';
import 'package:tech_assembly/screen/presentation_list_item.dart';

class PresentationList extends StatelessWidget {
  final List<Presentation> presentationList;

  const PresentationList({
    Key key,
    this.presentationList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: presentationList.length,
        itemBuilder: (context, index) => PresentationListItem(
          presentation: presentationList[index],
        ),
      ),
    );
  }
}