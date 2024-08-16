import 'package:url_launcher/url_launcher.dart';

class SettingsExtern {


 static void openWhatsApp() async {
    final Uri whatsappUri = Uri(
        scheme: 'https',
        host: 'wa.me',
        path: "5531779992",
        queryParameters: {
          'text': "Hola tuve un problema con su app 😕"
        });

    if (await canLaunchUrl(whatsappUri)) {
      await launchUrl(whatsappUri);
    } else {
      print('Could not open WhatsApp');
    }
  }

}