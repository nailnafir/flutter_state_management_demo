import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_future_stream_provider_demo/presentation/providers.dart';

class MainPageFutureProvider extends StatelessWidget {
  const MainPageFutureProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Future Provider'),
      ),
      body: Center(
        child: Consumer(
          builder: (context, ref, child) =>
              ref.watch(weatherFutureProvider).when(
                    data: (data) => SizedBox(
                      width: 100,
                      height: 100,
                      child: Image.asset(data.path),
                    ),
                    error: (error, stackTrace) => Text(error.toString()),
                    loading: () => const Text("Loading"),
                  ),
        ),
      ),
    );
  }
}
