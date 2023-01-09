

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/news_articles/models/news_entry.dart';
import 'package:news_app/news_articles/view/news_entry_details_page.dart';

class NewsEntryListItem extends StatelessWidget {
  const NewsEntryListItem({super.key, required this.newsEntry});

  final NewsEntry newsEntry;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Material(
      child: Card(
        child: InkWell(
          splashColor: Colors.blue.withAlpha(30),
          onTap: (){
              Navigator.of(context).push(NewsEntryDetailsPage.route(newsEntry: newsEntry));
          },
          child:  ListTile(
            title: Text(newsEntry.title ?? ''),
            subtitle: Text(newsEntry.source ?? '', maxLines: 3),
          ),
        )
      )
    );
  }

}