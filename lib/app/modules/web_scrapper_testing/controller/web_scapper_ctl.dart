import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as parser;

class ScraperController extends GetxController {
  var headings = <String>[].obs;
  var paragraphs = <String>[].obs;
  var keyPoints = <String>[].obs;
  var errorMessage = ''.obs;

  void fetchData(String url) async {
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        var document = parser.parse(response.body);

        // Scraping headings
        var h1Headings = document.getElementsByTagName('h1');
        var h2Headings = document.getElementsByTagName('h2');
        var h3Headings = document.getElementsByTagName('h3');
        var allHeadings = [...h1Headings, ...h2Headings, ...h3Headings];
        headings.value = allHeadings.map((heading) => heading.text).toList();

        // Scraping paragraphs
        var pParagraphs = document.getElementsByTagName('p');
        paragraphs.value =
            pParagraphs.map((paragraph) => paragraph.text).toList();

        // Extract key points
        extractKeyPoints();

        errorMessage.value = '';
      } else {
        errorMessage.value = 'Error: ${response.statusCode}';
      }
    } catch (e) {
      errorMessage.value = 'Error: $e';
    }
  }

  void extractKeyPoints() {
    // You can customize this function based on your criteria for key points extraction
    var keywords = [
      'important',
      'key',
      'critical'
    ]; // Example keywords for identifying key points

    var allTexts = [...headings.value, ...paragraphs.value];

    keyPoints.value =
        allTexts.where((text) => containsKeyword(text, keywords)).toList();
  }

  bool containsKeyword(String text, List<String> keywords) {
    // Check if the text contains any of the specified keywords
    for (var keyword in keywords) {
      if (text.toLowerCase().contains(keyword)) {
        return true;
      }
    }
    return false;
  }
  // var headings = <String>[].obs;
  // var paragraphs = <String>[].obs;
  // var errorMessage = ''.obs;

  // void fetchData(String url) async {
  //   try {
  //     final response = await http.get(Uri.parse(url));
  //     if (response.statusCode == 200) {
  //       var document = parser.parse(response.body);

  //       // Scraping headings
  //       var h1Headings = document.getElementsByTagName('h1');
  //       var h2Headings = document.getElementsByTagName('h2');
  //       var h3Headings = document.getElementsByTagName('h3');
  //       var allHeadings = [...h1Headings, ...h2Headings, ...h3Headings];
  //       headings.value = allHeadings.map((heading) => heading.text).toList();

  //       // Scraping paragraphs
  //       var pParagraphs = document.getElementsByTagName('p');
  //       paragraphs.value =
  //           pParagraphs.map((paragraph) => paragraph.text).toList();

  //       errorMessage.value = '';
  //     } else {
  //       errorMessage.value = 'Error: ${response.statusCode}';
  //     }
  //   } catch (e) {
  //     errorMessage.value = 'Error: $e';
  //   }
  // }

  // // // // // // // / / // / / / //  //
  // var data = <String>[].obs;
  // var errorMessage = ''.obs;

  // void fetchData(String url) async {
  //   int retryCount = 0;
  //   const int maxRetries = 3;
  //   const int retryDelay = 2; // in seconds

  //   while (retryCount < maxRetries) {
  //     try {
  //       final response = await http.get(Uri.parse(url));
  //       if (response.statusCode == 200) {
  //         var document = parser.parse(response.body);
  //         var links = document.querySelectorAll('a');
  //         var linkTexts = links.map((link) => link.text).toList();
  //         data.value = linkTexts;
  //         errorMessage.value = '';
  //         return;
  //       } else if (response.statusCode == 503) {
  //         retryCount++;
  //         await Future.delayed(Duration(seconds: retryDelay));
  //       } else {
  //         errorMessage.value = 'Error: ${response.statusCode}';
  //         return;
  //       }
  //     } catch (e) {
  //       errorMessage.value = 'Error: $e';
  //       return;
  //     }
  //   }

  //   errorMessage.value =
  //       'Error 503: Service Unavailable. Please try again later.';
  // }
}
