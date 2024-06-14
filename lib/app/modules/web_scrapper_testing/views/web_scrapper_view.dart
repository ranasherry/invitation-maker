import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:invitation_maker/app/modules/web_scrapper_testing/controller/web_scapper_ctl.dart';

class WebScraper extends GetView<ScraperController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Web Scraper'),
      ),
      body: Center(
        child: Obx(() {
          if (controller.errorMessage.isNotEmpty) {
            return Text(controller.errorMessage.value);
          } else if (controller.headings.isEmpty &&
              controller.paragraphs.isEmpty) {
            return Text('No data found.');
          } else {
            return ListView(
              padding: EdgeInsets.all(16),
              children: [
                if (controller.headings.isNotEmpty) ...[
                  Text(
                    'Headings:',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  SizedBox(height: 8),
                  ...controller.headings.map((heading) => Text(heading)),
                  SizedBox(height: 16),
                ],
                if (controller.paragraphs.isNotEmpty) ...[
                  Text(
                    'Paragraphs:',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  SizedBox(height: 8),
                  ...controller.paragraphs.map((paragraph) => Text(paragraph)),
                ],
              ],
            );
          }
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => controller.fetchData(
            'https://medium.com/@antonio.tioypedro1234/flutter-web-scraping-in-practice-c4c4a861a223'),
        child: Icon(Icons.download),
      ),
    );
  }
}
