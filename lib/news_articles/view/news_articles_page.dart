

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/news_articles/Resources/repositories/news_entry_repository.dart';
import 'package:news_app/news_articles/bloc/news_entry_bloc.dart';
import 'package:news_app/news_articles/view/news_entry_list.dart';

class NewsArticlesPage extends StatelessWidget {
  const NewsArticlesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('News')),
      body: BlocProvider(
        create: (_) => NewsBloc(
            newsEntryRepository: context.read<NewsEntryRepository>()
        )..add(NewsEntriesFetched()),
        child: const NewsEntryList(),
      ),
    );
  }
}