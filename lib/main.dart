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
  final TextEditingController inputController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  String? inputIsNull(String? inputText) {
    if (inputText == null || inputText.isEmpty) {
      return "O campo precisa ser preenchido";
    }
    return null;
  }

  String? isEmptyValidate(String value) {
    return value.isEmpty ? "O campo precisa ser preenchido" : null;
  }

  void addInputList() {
    if (formKey.currentState!.validate()) {
      setState(() {
        listInput.add(inputController.text);
      });
    }
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
              validator: (value) {
                if (value != null) {
                  isEmptyValidate(value);
                }
              },
              controller: inputController,
              decoration: const InputDecoration(
                hintText: 'Insira um novo valor',
              ),
            ),
            IconButton(
              onPressed: addInputList,
              icon: const Icon(
                Icons.add,
              ),
            ),
            Container(
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
        onPressed: () {},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
