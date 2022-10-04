import 'dart:math';

import 'package:flutter/services.dart';
import 'package:provider_in_depth_wax_app/models/report.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  FirebaseFirestore _firestoreDB = FirebaseFirestore.instance;

  Stream<List<Report>> getReports() {
    print("CALLED GET REPORTS");
    return _firestoreDB
        .collection('reports')
        .orderBy('timeStamp', descending: true)
        .snapshots()
        .map<List<Report>>((QuerySnapshot value) {
      print("YES");
      List<Report> reports = [];
      for (QueryDocumentSnapshot doc in value.docs) {
        if (doc.data() != null) {
          reports.add(Report.fromJson(doc.data() as Map<String, dynamic>));
        }
      }
      return reports;
    });
  }

  //To add a random report.
  Future addReport() {
    int temp = getRandomInt(min: -15, max: 6);
    return _firestoreDB.collection('reports').add(Report(
          temp: temp,
          wax: temp < -5 ? 'Swix' : 'Toko',
          line: temp.isEven ? 'Red' : 'Blue',
          timeStamp: DateTime.now().toIso8601String(),
        ).toJson());
  }

  int getRandomInt({int min = 0, required int max}) {
    return min + Random().nextInt(max - min);
  }
}
