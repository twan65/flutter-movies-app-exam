import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_exam/src/components/view_count.dart';
import 'package:provider_exam/src/provider/count_provider.dart';

class CountHomeWidget extends StatelessWidget {
  CountHomeWidget({Key? key}) : super(key: key);

  CountProvider? _countProvider;

  @override
  Widget build(BuildContext context) {
    _countProvider = Provider.of<CountProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(title: const Text("Count Provider")),
      body: ViewCountWidget(),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          IconButton(
              onPressed: () {
                _countProvider!.add();
              },
              icon: const Icon(Icons.add)),
          IconButton(
              onPressed: () {
                _countProvider!.remove();
              },
              icon: const Icon(Icons.remove))
        ],
      ),
    );
  }
}
