import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Professor Arivan',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(
          title: 'Exercício add valor para lista de string usando setState'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var listInput = <String>[];
  final inputController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  String? inputIsNull(String? inputText) {
    if (inputText == null || inputText.isEmpty) {
      return "O campo precisa ser preenchido";
    }
    return null;
  }

  String? validateText(String? text) {
    return text!.isEmpty ? "O campo precisa ser preenchido" : null;
  }

  void validateAndSave() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
    }
  }

  void addInputList(String? input) {
    setState(() {
      listInput.add(inputController.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              onSaved: addInputList,
              validator: validateText,
              controller: inputController,
              decoration: const InputDecoration(
                hintText: 'Insira um novo valor',
              ),
            ),
            SizedBox(
              height: 200,
              child: ListView.builder(
                itemCount: listInput.length,
                itemBuilder: (_, index) {
                  return ListTile(
                    title: Text(listInput[index]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: validateAndSave,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
