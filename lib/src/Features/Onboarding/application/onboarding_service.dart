// // //import 'package:firebase_auth/firebase_auth.dart' as auth;
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:fresherfoods/src/Features/onboarding/data/onboarding_respository.dart';
// import 'package:fresherfoods/src/Features/onboarding/domain/user_model.dart';

// class OnboardingService {
//   OnboardingRepository onboardingRepository = OnboardingRepository();
//   Future<void> createUser(
//       {required String email,
//       required String password,
//       String avatarImagePath = "",
//       required bool agbAccepted}) async {
//     User newUser = User(
//         id: "1",
//         email: "email",
//         password: "password",
//         avatarImagePath: "avatarImagePath",
//         agbAccepted: true);
        
//     return await onboardingRepository.createUserInDB(newUser);
//   }
// }
