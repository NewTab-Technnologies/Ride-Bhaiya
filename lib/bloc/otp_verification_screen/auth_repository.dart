class AuthRepository {
  Future<void> requestOTP(String phoneNumber) async {
    // Implement your OTP request logic here
    // For example, this could be an HTTP request to your server
    await Future.delayed(const Duration(seconds: 1)); // Simulating network call
  }
}
