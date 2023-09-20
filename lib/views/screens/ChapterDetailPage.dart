import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/json_decode_model.dart';
import '../../providers/json_decode_provider.dart';

class ChapterDetailPage extends StatefulWidget {
  const ChapterDetailPage({Key? key}) : super(key: key);

  @override
  State<ChapterDetailPage> createState() => _ChapterDetailPageState();
}

class _ChapterDetailPageState extends State<ChapterDetailPage> {
  @override
  void initState() {
    super.initState();
    loadJSON();
  }

  Future<void> loadJSON() async {
    await Provider.of<ShlokJsonDecodeProvider>(context, listen: false).loadJSON(
        Provider.of<ChapterJsonDecodeProvider>(context, listen: false)
            .chapterJsonDecodeModel
            .allChapter);
  }

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
          style: TextStyle(decoration: TextDecoration.underline,fontWeight: FontWeight.bold),
        ),

        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Stack(
        children: [
          Container(
            color: Colors.grey,
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(

                      height: MediaQuery.of(context).size.height * 0.25,
                      width: MediaQuery.of(context).size.width * 0.9,
                      decoration: BoxDecoration(

                        image: DecorationImage(
                          image: AssetImage(
                            'assets/images/${Provider.of<ChapterJsonDecodeProvider>(context, listen: false).chapterJsonDecodeModel.allChapter[chapterIndex].imageName}.jpg',
                          ),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text(
                    "Name Meaning :-",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    Provider.of<ChapterJsonDecodeProvider>(context,
                            listen: false)
                        .chapterJsonDecodeModel
                        .allChapter[chapterIndex]
                        .nameMeaning,
                    style: const TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Summary :-",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    color: Colors.white38,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        Provider.of<ChapterJsonDecodeProvider>(context,
                                listen: false)
                            .chapterJsonDecodeModel
                            .allChapter[chapterIndex]
                            .chapterSummaryEnglish,
                        style: const TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed('all_verses_page');
                      },
                      child: const Text("All Verses"),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
