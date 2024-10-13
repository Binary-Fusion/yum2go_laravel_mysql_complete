extension StrX on String? {
  String get formattedTimeRange {
    final values = validate.split('-');
    return '${values[0].trim()}-${values[1].trim()} ${values[2].isEquals('minute') ? 'min' : values[2]}';
  }

  String get validate {
    return this ?? '';
  }

  bool isEquals(String value) {
    return validate.trim().toLowerCase() == value.trim().toLowerCase();
  }

  String get justCharacters {
    return validate
        .split('')
        .where((e) => RegExp(r'[a-zA-Z]').hasMatch(e))
        .join('')
        .toLowerCase();
  }
}
