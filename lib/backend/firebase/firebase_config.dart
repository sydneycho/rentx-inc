import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyDrB683lg2NnAo2thlr-pMLfrFxpA_jcdw",
            authDomain: "rentx-inc.firebaseapp.com",
            projectId: "rentx-inc",
            storageBucket: "rentx-inc.appspot.com",
            messagingSenderId: "1077038338459",
            appId: "1:1077038338459:web:955988e989f4e42a3d913e",
            measurementId: "G-M4H17N6V6W"));
  } else {
    await Firebase.initializeApp();
  }
}
