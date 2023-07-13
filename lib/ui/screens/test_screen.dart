import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/ui/providers/localdb_provider.dart';

class TestScree extends ConsumerStatefulWidget {
  const TestScree({super.key});

  @override
  TestScreeState createState() => TestScreeState();
}

class TestScreeState extends ConsumerState<TestScree> {
  @override
  void initState() {
    super.initState();
    ref.read(loadDataProvider.notifier).loadData();
    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mi AppBar'),
      ),
      body: const Center(
        child: Text('Mi cuerpo de página'),
      ),
    );
  }
}
