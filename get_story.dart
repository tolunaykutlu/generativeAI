import 'package:http/http.dart' as http;

getStory(String requestText) async {
  // API anahtarınızı girin
  const apiKey = 'AIzaSyD5inZcuOToajZvkYLAjv1nuQWS_v_ec1c';

  // İstek oluşturma
  final request =
      Uri.parse('https://generative-ai.googleapis.com/v1/models/generate');

  // İstek parametreleri
  final parameters = {
    'model': 'gemini-pro',
    'temperature': '0.9',
    'topK': '1',
    'topP': '1',
    'maxOutputTokens': '2048',
    'prompt':
        "Merhaba, bugün $requestText hakkında bir hikaye yazabilir misin?",
  };

  // Başlıklar
  final headers = {
    'Authorization': 'Bearer $apiKey',
  };

  // Yanıt alma
  final response = await http.post(request, headers: headers, body: parameters);

  // Yanıt kodunu kontrol etme
  if (response.statusCode == 200) {
    // Yanıtı yazdırma
    print(response.body);
  } else {
    // Hata mesajı yazdırma
    print('Hata: ${response.statusCode}');
  }
  return response.body;
}
