part of prueba_tecnica_bia.extensions;

extension StringExtension on String {
  String toFormatDate() =>
      DateFormat('yyyy-MM-dd').format(DateTime.parse(this));
  String toCapitalize() => '${this[0].toUpperCase()}${substring(1)}';
}
