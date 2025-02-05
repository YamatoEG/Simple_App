import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:simple_app/firebase/model/user_model.dart';

class FormFireBaseService {
  var db = FirebaseFirestore.instance;

  Future<List<UserFromFireBaseModel>> getUserfromFirebase() async {
    List<UserFromFireBaseModel> users = [];
    await db.collection("users").get().then((event) {
      for (var doc in event.docs) {
        // Use the correct method name from your model: fromFirestore
        users.add(UserFromFireBaseModel.fromFirestore(doc, null));
      }
    });
    return users;
  }
}
