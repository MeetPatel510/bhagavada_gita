import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/json_decode_model.dart';
import '../../providers/json_decode_provider.dart';

class ShlokDetailPage extends StatefulWidget {
  const ShlokDetailPage({Key? key}) : super(key: key);

  @override
  State<ShlokDetailPage> createState() => _ShlokDetailPageState();
}

class _ShlokDetailPageState extends State<ShlokDetailPage> {
  @override
  void initState() {
    super.initState();
    Provider.of<ShlokJsonDecodeProvider>(context, listen: false)
        .englishLanguage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text(Provider.of<ShlokJsonDecodeProvider>(context, listen: false)
            .shlokJsonDecodeModel
            .allShloks[shlokIndex]
            .verse),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Padding(

        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Container(
                color: Colors.grey,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    Provider.of<ShlokJsonDecodeProvider>(context, listen: false)
                        .shlokJsonDecodeModel
                        .allShloks[shlokIndex]
                        .sanskrit,
                    style: const TextStyle(
                      fontSize: 22,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                "Translation",
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                    onPressed: () {
                      Provider.of<ShlokJsonDecodeProvider>(context,
                              listen: false)
                          .englishLanguage();
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: const Text('English',style: TextStyle(color: Colors.black)),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Provider.of<ShlokJsonDecodeProvider>(context,
                              listen: false)
                          .hindiLanguage();
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: const Text('Hindi',style: TextStyle(color: Colors.black),),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Provider.of<ShlokJsonDecodeProvider>(context,
                              listen: false)
                          .gujaratiLanguage();
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: const Text('Gujarati',style: TextStyle(color: Colors.black)),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                color:Colors.white54,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    Provider.of<ShlokJsonDecodeProvider>(context)
                        .shlokJsonDecodeModel
                        .allShloks[shlokIndex]
                        .translation,
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
