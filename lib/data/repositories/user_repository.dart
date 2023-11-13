import 'package:calaton_project_2/domain/models/user.dart';

class UserRepository {
  Future<User?> getUser() async {
    // Implement logic to fetch user data from a remote server or other sources
    // For simplicity, let's return a hardcoded user for now
    return User('admin', 'admin');
  }

  Future<bool> authenticateUser(String username, String password) async {
    // Fetch user data from the repository
    final user = await getUser();

    // Check if the provided username and password match the stored credentials
    return user != null &&
        user.username == username &&
        user.password == password;
  }

  Future<void> updateUser(String newUsername, String newPassword) async {
    // Implement logic to update user data (for simplicity, we'll print the values)
    print(
        'User updated - New Username: $newUsername, New Password: $newPassword');
  }
}
