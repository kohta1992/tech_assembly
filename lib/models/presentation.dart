import 'package:cloud_firestore/cloud_firestore.dart';

class Presentation {
  String id;

  int orderNum;

  String title;

  String presenter;

  String department;

  int like;

  Presentation({this.id, this.orderNum, this.title, this.presenter,
      this.department, this.like});

  ///
  ///FireStoreへセットする用の形式で取得
  ///
  Map<String, dynamic> get firestoreData => {
    'order_num': orderNum,
    'title': title,
    'presenter': presenter,
    'department': department,
    'like': like,
  };

  ///
  /// ドキュメントのスナップショットからインスタンスを生成
  ///
  factory Presentation.fromDocument(DocumentSnapshot document) => Presentation(
    id: document.id,
    orderNum: document.data()['order_num'],
    title: document.data()['title'],
    presenter: document.data()['presenter'],
    department: document.data()['department'],
    like: document.data()['like'],
  );
}
