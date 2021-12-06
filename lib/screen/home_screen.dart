import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController t1 = TextEditingController();
  List myToDo = [];

  addItem() {
    myToDo.add(t1.text);
    setState(() {});
  }

  removeItem() {
    myToDo.remove(t1.text);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            ListView.builder(
              itemCount: myToDo.length,
              itemBuilder: (context, index) => const ListTile(
                title: Text('data'),
              ),
            ),
            TextField(
              controller: t1,
              decoration: const InputDecoration(
                hintText: 'What are you add to do list?',
              ),
            ),
            Row(
              children: [
                ElevatedButton(
                  onPressed: addItem,
                  child: const Text('Add Item'),
                ),
                const SizedBox(
                  width: double.infinity,
                ),
                ElevatedButton(
                  onPressed: removeItem,
                  child: const Text('Remove Item'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
