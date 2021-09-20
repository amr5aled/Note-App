import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../models/user.dart';

class RepositoryAuth {
  final _firebaseAuth = FirebaseAuth.instance;
//signInWithGoogle//

   Future<User?> signInGoogle() async {
    GoogleSignIn googleSignIn = GoogleSignIn(); // object of
    GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn(); // google account//
    if (googleSignInAccount != null) {
      GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;
      if (googleSignInAuthentication.idToken != null) {
        final authRes = await _firebaseAuth.signInWithCredential(
            GoogleAuthProvider.credential(
                idToken: googleSignInAuthentication.idToken, // id connect user
                accessToken: googleSignInAuthentication
                    .accessToken)); // to access google service
        return authRes.user;
      } else {
        FirebaseAuthException(code: 'sign is abort by id token');
      }
    } else {
      throw FirebaseAuthException(
          code: 'aborted by user', message: 'sign is abort by user');
    }
  }

  Future<SocialUserModel> signInWithFacebook() async {
    // Trigger the sign-in flow
    final LoginResult loginResult = await FacebookAuth.instance.login();

    // Create a credential from the access token
    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.token);

    // Once signed in, return the UserCredential
 UserCredential userCredential =await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
 
    return SocialUserModel(
        email: userCredential.user!.email,
        name: userCredential.user!.displayName,
        uId: userCredential.user!.uid);
  }
  

  Future<User?> signWithEmail(String email, String password) async {
    final authResult = await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
    return authResult.user;
  }

  Future<User?> createWithEmail(String email, String password) async {
    final authResult = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
    return authResult.user;
  }

// Future<UserCredential> signInWithTwitter() async {
//   // Create a TwitterLogin instance
//   final TwitterLogin twitterLogin = new TwitterLogin(
//     consumerKey: '<your consumer key>',
//     consumerSecret:' <your consumer secret>',
//   );
//   // Trigger the sign-in flow
//   final TwitterLoginResult loginResult = await twitterLogin.authorize();

//   // Get the Logged In session
//   final TwitterSession twitterSession = loginResult.session;

//   // Create a credential from the access token
//   final twitterAuthCredential = TwitterAuthProvider.credential(
//     accessToken: twitterSession.token,
//     secret: twitterSession.secret,
//   );

//   // Once signed in, return the UserCredential
//   return await FirebaseAuth.instance.signInWithCredential(twitterAuthCredential);
// }
}
