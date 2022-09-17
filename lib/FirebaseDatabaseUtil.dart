import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

class FirebaseDatabaseUtil {

  static final FirebaseDatabaseUtil instance = FirebaseDatabaseUtil.internal();

  FirebaseDatabaseUtil.internal();

  factory FirebaseDatabaseUtil() {
    return instance;
  }

  Future<void> initState()
  async {
    await Firebase.initializeApp();
    FirebaseDatabase.instance.setPersistenceEnabled(true);
  }

  Future<dynamic> readData(String child)
  async {
    DataSnapshot dataSnapshot = await FirebaseDatabase.instance.ref(child).get();
    return dataSnapshot.value;
  }

  void dispose() {
    FirebaseDatabase.instance.ref().onDisconnect();
  }
}