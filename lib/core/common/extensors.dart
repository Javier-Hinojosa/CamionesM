import 'package:intl/intl.dart';

extension Formats on String {

  String formatPhoneNumber() {
    String number = this;
    // Verificar si la cadena contiene un signo '+'
    String prefix = '';
    if (number.startsWith('+')) {
      prefix = '+';
      number = number.substring(1); // Remover el signo '+' para formatear el número
    }
    // Eliminar cualquier carácter no numérico
    String cleanNumber = number.replaceAll(RegExp(r'\D'), '');
    if(cleanNumber.isNotEmpty){
    // Aplicar formato con espacios
    if (cleanNumber.length > 3 && cleanNumber.length <= 6) {
      cleanNumber = '${cleanNumber.substring(0, 3)} ${cleanNumber.substring(3)}';
    } else if (cleanNumber.length > 6 && cleanNumber.length <= 10) {
      cleanNumber = '${cleanNumber.substring(0, 3)} ${cleanNumber.substring(3, 6)} ${cleanNumber.substring(6)}';
    } else if (cleanNumber.length > 10) {
      cleanNumber = '${cleanNumber.substring(0, 3)} ${cleanNumber.substring(3, 6)} ${cleanNumber.substring(6, 10)}';
    }
    return prefix + cleanNumber;
    }else{
      throw "formato incorrecto";
    }
  }
  int toInt() {
    return int.parse(this);
  }
}

extension DateFormating on DateTime {
  String formatDate() {
    return DateFormat("yyyy/MM/dd").format(this);
  }

  String formatHour() {
    return DateFormat("hh:mm aa").format(this);
  }

  String formatDateHour() {
    return DateFormat("yyyy-MM-dd hh:mm aa").format(this);
  }

  String formatDateHourNotFormat() {
    return DateFormat("yyyyMMddHHmmss").format(this);
  }

  String formatInSpanish() {
    return DateFormat('dd MMMM yyyy', 'es_ES').format(this);
  }

}