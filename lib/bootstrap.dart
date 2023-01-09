

import 'dart:async';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/app/app.dart';
import 'package:news_app/app/app_bloc_observer.dart';
import 'package:news_app/news_articles/Resources/provider/news_entry_rest.dart';
import 'package:news_app/news_articles/Resources/repositories/news_entry_repository.dart';

void bootstrap(){
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  Bloc.observer = AppBlocObserver();

  final newsEntryRepository = NewsEntryRepository(newsEntryApi: NewsEntryRest());

  runZonedGuarded(
        () => runApp(App(newsEntryRepository: newsEntryRepository)),
        (error, stackTrace) => log(error.toString(), stackTrace: stackTrace),
  );
}