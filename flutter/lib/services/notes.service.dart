import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:trainingstagebuch/models/day.model.dart';
import 'package:trainingstagebuch/services/auth.service.dart';

class NotesService {
  final AuthService _auth = AuthService();
  Future saveNotes(Day day) async {
    try {
      final token = await _auth.getToken();
      final res = await http.post(
          "https://europe-west3-trainingstagebuch-f8308.cloudfunctions.net/calories",
          headers: {"authorization": "Bearer " + token},
          body: json.encode(day.toJson()));
      if (res.statusCode == 200) {
        return true;
      } else {
        print(res.body);
        return false;
      }
    } catch (err) {
      print(err);
      return false;
    }
  }
}
