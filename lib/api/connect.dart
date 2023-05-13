import 'package:http/http.dart' as http;
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:google_sign_in/google_sign_in.dart';


Future<void> sendAccessTokenToBackend(String accessToken) async {
  final url = 'https://localhost:7264/swagger/index.html';
  final response = await http.post(
    Uri.parse(url),
    body: {'accessToken': accessToken},
  );

  // Handle the response from the backend here
}

void initiateFacebookSignIn() async {
  final fb = FacebookAuth.instance;
  
  // Request the required permissions from the user
  final result = await fb.login();

  // Handle the OAuth response
  if (result.status == LoginStatus.success) {
    // The user has successfully logged in with Facebook
    final accessToken = result.accessToken!.token;
    
    // Send the access token to your backend API
    sendAccessTokenToBackend(accessToken);
  } else {
    // Handle error cases
    print('Facebook login failed: ${result.status}');
  }
}

final GoogleSignIn googleSignIn = GoogleSignIn();

void initiateGoogleSignIn() async {
  try {
    final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

    if (googleUser != null) {
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      final accessToken = googleAuth.accessToken;
      sendAccessTokenToBackend(accessToken!);
    } else {
      print('Google login failed: User is null');
    }
  } catch (error) {
    print('Google login failed: $error');
  }
}


void initiateAppleSignIn() async {
  try {
    final credential = await SignInWithApple.getAppleIDCredential(
      scopes: [
        AppleIDAuthorizationScopes.email,
        AppleIDAuthorizationScopes.fullName,
      ],
    );

    final String? userIdentifier = credential.userIdentifier;

    if (userIdentifier != null) {
      // You can use the userIdentifier to uniquely identify the user on your backend.
      // Send the userIdentifier to your backend API for further processing.

      sendUserIdentifierToBackend(userIdentifier);
    } else {
      print('Apple Sign-In failed: User identifier is null');
    }
  } catch (error) {
    print('Apple Sign-In failed: $error');
  }
}

Future<void> sendUserIdentifierToBackend(String userIdentifier) async {
  // Implement your logic here to send the user identifier to your backend API
  // You can use a package like 'http' to make HTTP requests to your API
  // Example using the 'http' package:
  final url = 'https://10.0.2.2:7264/api';
  final response = await http.post(
    Uri.parse(url),
    body: {'userIdentifier': userIdentifier},
  );

  if (response.statusCode == 200) {
    print('User identifier sent to backend successfully');
  } else {
    print('Failed to send user identifier to backend');
  }
}
