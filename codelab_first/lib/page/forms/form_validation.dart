import 'package:flutter/material.dart';

///文档说明
///带验证表单

class FormValidation extends StatefulWidget {
  const FormValidation({super.key});
  static String routeName = '/form/FormValidation';

  @override
  State<FormValidation> createState() => _FormValidationState();
}

class _FormValidationState extends State<FormValidation> {
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  void didUpdateWidget(FormValidation oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('带验证表单'),
      ),
      body: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "请输入内容";
                  }
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 18.0),
                child: ElevatedButton(
                    onPressed: () => {
                          if (_formKey.currentState!.validate())
                            {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text("正在提交内容"))),
                            }
                        },
                    child: const Text("提交")),
              )
            ],
          )),
    );
  }
}
