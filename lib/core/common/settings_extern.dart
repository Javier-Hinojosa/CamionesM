import 'package:latlong2/latlong.dart';
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
/// property [percentage], only use 1 to 0 have 100% intermediary
 static LatLng getIntermediatePosition(LatLng startLocation,LatLng endLocation , {double percentage=0.5}) {
   double lat = startLocation.latitude + (percentage * (endLocation.latitude - startLocation.latitude));
   double lng = startLocation.longitude + (percentage * (endLocation.longitude - startLocation.longitude));
   return LatLng(lat, lng);
 }

}