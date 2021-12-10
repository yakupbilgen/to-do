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
    Size deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('My To Do List'),
        centerTitle: true,
        elevation: 20,
      ),
      body: Container(
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            Flexible(
              flex: 5,
              child: ListView.builder(
                  itemCount: myToDo.length,
                  itemBuilder: (BuildContext context, int index) {
                    return SingleChildScrollView(
                      child: ListTile(
                        leading: const Icon(Icons.list),
                        title: Text("$myToDo[index]".toString()),
                        subtitle: Text('Index: $index'),
                        trailing: InkWell(
                          child: const Icon(Icons.remove),
                          onTap: removeItem(index),
                        ),
                      ),
                    );
                  }),
            ),
            Flexible(
              flex: 1,
              child: TextField(
                controller: t1,
                decoration: const InputDecoration(
                  hintText: 'What are you add to do list?',
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: addItem,
      ),
    );
  }
}
