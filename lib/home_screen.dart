import 'package:flutter/material.dart';
import 'package:pigeon_demo/pigeon.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Book> books = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pigeon demo'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => fetchBook(),
        child: const Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            ListView.builder(
              itemCount: books.length,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                final Book book = books[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('${book.title} by "${book.author}"'),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<void> fetchBook() async {
    final int number = this.books.length + 1;
    final List<Book?> books = await BookApi().search('Book $number');
    final newBooks = List<Book>.from(books);

    setState(() => this.books..addAll(newBooks));
  }
}
