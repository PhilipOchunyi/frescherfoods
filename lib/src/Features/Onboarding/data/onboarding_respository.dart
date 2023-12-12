import 'package:firebase_auth/firebase_auth.dart';
import 'package:fresherfoods/core/Data/local_data_source.dart';

class OnboardingRepository {
  LocalDataSource localDataSource = LocalDataSource();
  Future<void> createUserInDB(User user) async {
    return await localDataSource.postData<User>("userBox", user.uid, user);
  }
}
