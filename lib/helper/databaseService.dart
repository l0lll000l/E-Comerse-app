import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  String email = 'athulmp86@gmail.com';
  String password = '123456789';
  final String? uid;
  DatabaseService({this.uid});
  //-----------------------------
  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('users');
  final CollectionReference GroupCollection =
      FirebaseFirestore.instance.collection('Groups');
  //--------------------------------------------
  Future saveUserData() async {
    return await userCollection.doc(uid).set({
      'fullname': 'athul',
      'email': email,
    });
  }

//----------------------------------------
  Future gettingUserData() async {
    QuerySnapshot snapshot =
        await userCollection.where('email', isEqualTo: email).get();
    return snapshot;
  }

  Future createGroup({id}) async {
    DocumentReference documentReference = await GroupCollection.add({
      'groupName': 'myGroup',
      'groupIcon': '',
      'admin': '${id}_athul',
      'members': [],
      'groupId': '',
      'recentMessage': '',
      'recentMessageSender': '',
    });
    await documentReference.update({
      'members': FieldValue.arrayUnion(['${uid}_amal']),
      'groupId': documentReference.id,
    });
    DocumentReference userDocumentReference = userCollection.doc(uid);
    return await userDocumentReference.update({
      "groups": FieldValue.arrayUnion(['${documentReference.id}_amal'])
    });
  }
}
