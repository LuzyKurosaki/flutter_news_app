

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/news_articles/Resources/repositories/news_entry_repository.dart';
import 'package:news_app/news_articles/view/news_articles_page.dart';
import 'package:news_app/theme/theme.dart';

class App extends StatelessWidget{
  const App ({super.key, required this.newsEntryRepository});

  final NewsEntryRepository newsEntryRepository;

  @override
  Widget build(BuildContext context){
    //Provide Repository to Application Context
    return RepositoryProvider.value(
      value: newsEntryRepository,
      child: const AppView(),
    );
  }

}

class AppView extends StatelessWidget{
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: MainTheme.light,
      darkTheme: MainTheme.dark,
      home: const NewsArticlesPage(),
    );
  }

}