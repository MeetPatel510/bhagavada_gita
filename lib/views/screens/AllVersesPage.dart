import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/json_decode_model.dart';
import '../../providers/json_decode_provider.dart';

class AllVersesPage extends StatefulWidget {
  const AllVersesPage({Key? key}) : super(key: key);

  @override
  State<AllVersesPage> createState() => _AllVersesPageState();
}

class _AllVersesPageState extends State<AllVersesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text(
          Provider.of<ChapterJsonDecodeProvider>(context, listen: false)
              .chapterJsonDecodeModel
              .allChapter[chapterIndex]
              .nameTranslationEnglish,
          style: TextStyle(decoration: TextDecoration.underline),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: Provider.of<ShlokJsonDecodeProvider>(context)
              .shlokJsonDecodeModel
              .allShloks
              .length,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) => Container(
            color: Colors.grey,
            child: Container(
              color: Colors.grey,
              child: ListTile(
                onTap: () {
                  shlokIndex = index;
                  Navigator.of(context).pushNamed("shlok_detail_page");
                },
                leading: Text(
                  Provider.of<ShlokJsonDecodeProvider>(context)
                      .shlokJsonDecodeModel
                      .allShloks[index]
                      .verse,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black
                  ),
                ),
                title: Text(Provider.of<ShlokJsonDecodeProvider>(context)
                    .shlokJsonDecodeModel
                    .allShloks[index]
                    .sanskrit,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black
                ),
                ),
                contentPadding: const EdgeInsets.all(16),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
