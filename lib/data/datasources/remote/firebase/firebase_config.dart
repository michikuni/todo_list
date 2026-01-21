import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

void firebaseSetup() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
}