List<Map<String, dynamic>> castToMapStringDynamic(dynamic data) {
  return (data as List<dynamic>?)?.cast<Map<String, dynamic>>() ?? [];
}

bool isValidEmail(String email) {
  final RegExp emailRegex = RegExp(
    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
  );
  return emailRegex.hasMatch(email);
}