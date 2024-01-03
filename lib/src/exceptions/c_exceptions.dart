class CExceptions implements Exception {
  /// this associated error message
  final String message;

  const CExceptions([this.message = 'An unknown exception has occurred']);

  //create an authentication message
  //from a firebase authenticatiion exception code.
  factory CExceptions.fromCode(String code) {
    switch (code) {
      case 'email-already-in-use':
        return const CExceptions('Email already in use');
      case 'invalid-email':
        return const CExceptions('Invalid Email');
      case 'weak-password':
        return const CExceptions('Weak password');
      case 'user-disabled':
        return const CExceptions(
            'This user has been disabled,Please contact support');
      case 'user-not-found':
        return const CExceptions('User not found');
      case 'wrong-password':
        return const CExceptions('Wrong Password');
      case 'too-many-requests':
        return const CExceptions(
            'Too many requests, service temporarily blocked');
      case 'invalid-argument':
        return const CExceptions(
            'An invalid argument was provided to an Authentication method');
      case 'invalid-password':
        return const CExceptions('Incorrect password, try again');
      case 'invalid-phone-number':
        return const CExceptions('Phone number is invalid');
      case 'operation-not-allowed':
        return const CExceptions(
            'The providede sign in provider is disabled for your firebase project');
      case 'session-cookie-expired':
        return const CExceptions('Session expired');
      case 'uid-already-exists':
        return const CExceptions('Provided uid already i exists');

      default:
        return const CExceptions();
    }
  }
}
