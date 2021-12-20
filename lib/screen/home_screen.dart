import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController t1 = TextEditingController();
  List myToDo = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

  addItem() {
    myToDo.add(t1.text);
    setState(() {});
  }

  removeItem(int index) {
    myToDo.removeAt(index);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My To Do List'),
        centerTitle: true,
        elevation: 20,
      ),
      body: Container(
        margin: const EdgeInsets.all(10),
        child: ListView.builder(
            itemCount: myToDo.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                leading: const Icon(Icons.list),
                title: Text("${myToDo[index]}"),
                subtitle: Text('Index: $index'),
                trailing: InkWell(
                  child: const Icon(Icons.remove),
                  onTap: () {},
                ),
              );
            }),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: _showMyDialog,
      ),
    );
  }

  _showMyDialog() {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add to do list'),
          content: const TextField(),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Add'),
              onPressed: () {
                addItem();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
