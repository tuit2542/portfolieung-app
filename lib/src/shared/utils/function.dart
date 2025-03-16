List<Map<String, dynamic>> castToMapStringDynamic(dynamic data) {
  return (data as List<dynamic>?)?.cast<Map<String, dynamic>>() ?? [];
}
