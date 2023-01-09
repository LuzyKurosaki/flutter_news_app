

import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/news_articles/bloc/news_entry_details_bloc.dart';
import 'package:news_app/news_articles/models/news_entry.dart';

class NewsEntryDetailsPage extends StatelessWidget {
  const NewsEntryDetailsPage({super.key});

  static Route<void> route({required NewsEntry newsEntry}){
    return MaterialPageRoute(
      fullscreenDialog: true,
      builder: (context) => BlocProvider(
          create: (context) => NewsEntryDetailsBloc(newsEntry: newsEntry),
        child: const NewsEntryDetailsPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('News')),

        body:  NewsEntryDetailView()

    );
  }
}

class NewsEntryDetailView extends StatefulWidget{
  @override
  State<NewsEntryDetailView> createState() => _NewsEntryDetailViewState();
}

class _NewsEntryDetailViewState extends State<NewsEntryDetailView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsEntryDetailsBloc,NewsEntryDetailsState>(
      builder: (context, state) {
       return
       SingleChildScrollView(
         child:  Column(
           children: [
             Container(
               height:  MediaQuery.of(context).size.height * 0.3,
               width: MediaQuery.of(context).size.width,
               decoration: BoxDecoration(
                 image: DecorationImage(
                 fit: BoxFit.cover,
                 image: NetworkImage(state.newsEntry.urlToImage ?? 'https://images.pexels.com/photos/158651/news-newsletter-newspaper-information-158651.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1')
                 )
               ),
               alignment: Alignment.bottomCenter,
               child:
                 Container(
                   width: MediaQuery.of(context).size.width,
                   padding: EdgeInsets.only(bottom: 10.0, top: 10.0),
                   decoration: BoxDecoration(
                       color: Colors.black.withOpacity(0.7),
                       border: Border(top: BorderSide(
                       color: Colors.white,
                       width: 3
                     ))
                   ),
                   child: Text(state.newsEntry.title ?? '',
                     style: TextStyle(
                         fontSize: 24,
                          color: Colors.white
                     ),
                     textAlign: TextAlign.center,
                   ),
                 ),


             ),
             Padding(padding: EdgeInsets.only(bottom: 10, right: 10,left: 10),
              child: Column(children: [
                Text(state.newsEntry.description ?? ''),
                Text(state.newsEntry.content ?? ''),
              ],
              ),
             ),
           ],
         ),
       );
      },
    );
  }
}