import 'dart:math';

void main() {
  // String password = generateRandomPassword(5,
  //     includeLowercase: true,
  //     includeUppercase: true,
  //     includeNumbers: true,
  //     includeSpecialCharacters: true);
  // print('Contraseña generada: $password');
}

String generateRandomPassword(int length,
    {bool includeLowercase = true,
    bool includeUppercase = true,
    bool includeNumbers = true,
    bool includeSpecialCharacters = true}) {
  String charset = '';
  if (includeLowercase) {
    charset += 'abcdefghijklmnopqrstuvwxyz';
  }
  if (includeUppercase) {
    charset += 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
  }
  if (includeNumbers) {
    charset += '0123456789';
  }
  if (includeSpecialCharacters) {
    charset += '!@#\$%^&*()-_+=[]{}|;:,.<>?';
  }
  if (charset.isEmpty) {
    return "";
  }
  Random random = Random.secure();
  return List.generate(
      length, (index) => charset[random.nextInt(charset.length)]).join();
}
