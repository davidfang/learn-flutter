import 'dart:convert';

import 'package:flutter/material.dart';

class TemplateDemo extends StatefulWidget {
  static String routeName = '/template/demo';

  const TemplateDemo({super.key});
  @override
  State<TemplateDemo> createState() => _TemplateDemoState();
}

class _TemplateDemoState extends State<TemplateDemo> {
  final TextEditingController _dataController = TextEditingController();
  final TextEditingController _templateController = TextEditingController();
  String _generatedCode = '';

  void _generateCode() {
    String data = _dataController.text;
    String template = _templateController.text;

    try {
      Map<String, dynamic> jsonData = jsonDecode(data);
      String generatedCode = _parseTemplate(template, jsonData);
      setState(() {
        _generatedCode = generatedCode;
      });
    } catch (e) {
      setState(() {
        _generatedCode = 'Invalid JSON data';
      });
    }
  }

  String _parseTemplate(String template, Map<String, dynamic> jsonData) {
    // 在这里根据模板和JSON数据解析生成代码
    // 您可以使用字符串替换或模板引擎来实现解析逻辑
    // 这里只是一个简单的示例
    String code = template.replaceAll('{{data}}', jsonData['data']);
    return code;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Code Generator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _dataController,
              decoration: const InputDecoration(
                labelText: 'JSON Data',
              ),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _templateController,
              decoration: const InputDecoration(
                labelText: 'Code Template',
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _generateCode,
              child: const Text('Generate Code'),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Generated Code:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            Expanded(
              child: SingleChildScrollView(
                child: Text(_generatedCode),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
