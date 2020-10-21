import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tech_assembly/models/presentation.dart';
import 'package:tech_assembly/repository/presentation_repository.dart';
import 'package:tech_assembly/screen/presentation_list_item.dart';

class PresentationListPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PresentationListPageState();
}

class _PresentationListPageState extends State<PresentationListPage> {
  final repository = PresentationRepository();

  List<Presentation> presentationList = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var stream = FirebaseFirestore.instance
        .collection(PresentationRepository.collectionName)
        .snapshots();

    return Scaffold(
      body: Stack(
        children: [
          StreamBuilder<QuerySnapshot>(
            stream: stream,
            builder: (context, stream) {
              if (stream.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }

              if (stream.hasError) {
                return Center(child: Text(stream.error.toString()));
              }

              QuerySnapshot querySnapshot = stream.data;

              return ListView.builder(
                itemCount: querySnapshot.size,
                itemBuilder: (context, index) => PresentationListItem(
                    presentation:
                        Presentation.fromDocument(querySnapshot.docs[index])),
              );
            },
          ),
        ],
      ),
    );
  }
}
