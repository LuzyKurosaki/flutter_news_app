import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/app/app.dart';
import 'package:news_app/bootstrap.dart';
import 'package:news_app/news_articles/news_article_observer.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  bootstrap();
}

