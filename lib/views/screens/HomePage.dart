import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/json_decode_model.dart';
import '../../providers/json_decode_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    loadJSON();
  }

  Future<void> loadJSON() async {
    await Provider.of<ChapterJsonDecodeProvider>(context, listen: false)
        .loadJSON();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height / 0.5,
        child: Column(
          children: [
            Expanded(
                flex: 3,
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                            "assets/images/bg.jpg"),
                        fit: BoxFit.fill,),
                  ),
                )),
            Expanded(
              flex: 13,
              child: ListView.builder(
                itemCount: Provider.of<ChapterJsonDecodeProvider>(context)
                    .chapterJsonDecodeModel
                    .allChapter
                    .length,
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 4,
                ),
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Container(
                    height: 150,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/images/quotes.jpg"),
                            fit: BoxFit.fill)),
                    child: Center(
                      child: ListTile(
                        onTap: () {
                          chapterIndex = index;
                          Navigator.of(context)
                              .pushNamed("chapter_detail_page");
                        },
                        leading: Padding(
                          padding: const EdgeInsets.only(left: 100,bottom: 30),
                          child: Text(
                            "${Provider.of<ChapterJsonDecodeProvider>(context, listen: false).chapterJsonDecodeModel.allChapter[index].id}",
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                        title: Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Text(
                            Provider.of<ChapterJsonDecodeProvider>(context,
                                    listen: false)
                                .chapterJsonDecodeModel
                                .allChapter[index]
                                .nameHindi,
                            style: TextStyle(color: Colors.black,fontWeight:FontWeight.bold),
                          ),
                        ),
                        subtitle: Padding(
                          padding: const EdgeInsets.only(),
                          child: Text(
                            "Verses : ${Provider.of<ChapterJsonDecodeProvider>(context, listen: false).chapterJsonDecodeModel.allChapter[index].versesCount}",
                            style: TextStyle(color: Colors.pink),
                          ),
                        ),
                        // trailing: const Icon(
                        //   Icons.arrow_forward_ios_outlined,
                        //   color: Colors.black,
                        // ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
