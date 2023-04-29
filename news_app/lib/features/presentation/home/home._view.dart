import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kartal/kartal.dart';

import '../../domain/model/news.dart';

class HomeView extends ConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: FutureBuilder(
        future: _getNews(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot<News?>> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return const CircleAvatar();
            case ConnectionState.waiting:
              return const CircularProgressIndicator();
            case ConnectionState.active:
              return const CircularProgressIndicator();
            case ConnectionState.done:
              if (snapshot.hasData) {
                final value = snapshot.data!.docs.map((e) => e.data()).toList();
                return ListView.builder(
                  itemCount: value.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      child: Column(
                        children: [
                          Image.network(
                            value[index]?.image ?? '',
                            loadingBuilder: (context, child, loadingProgress) {
                              return child;
                            },
                          ),
                          Text(
                            value[index]?.desprition ?? '',
                            style: context.textTheme.headlineLarge?.apply(color: Colors.black),
                          ),
                        ],
                      ),
                    );
                  },
                );
              } else {
                return const SizedBox.shrink();
              }
          }
        },
      ),
    );
  }

  Future<QuerySnapshot<News?>> _getNews() {
    final CollectionReference news = FirebaseFirestore.instance.collection('news');

    return news
        .withConverter(
          fromFirestore: (snapshot, options) {
            final data = snapshot.data();

            if (data != null) {
              return News.fromJson(snapshot.data()!)..copyWith(id: snapshot.id);
            }
          },
          toFirestore: (value, options) => {},
        )
        .get();
  }
}
