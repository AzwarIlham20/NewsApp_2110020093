import 'package:flutter/material.dart';
import 'package:news_app_2110020093/components/news.dart';
import 'package:news_app_2110020093/providers/news.provider.dart';
import 'package:provider/provider.dart';
// import 'package:news_app_2110020093/components/news.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController searchControler = TextEditingController(text: '');
  @override
  Widget build(BuildContext context) {
    return Consumer<NewsProvider>(
        builder: (BuildContext context, news, Widget? child) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Cari Berita'),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: searchControler,
                          decoration: const InputDecoration(
                            hintText: 'Cari Berita...',
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          news.search(searchControler.text);
                      }, 
                      icon: const Icon(Icons.send))
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  news.isDataEmpty 
                  ? const SizedBox() 
                  : news.isLoadingSearch
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : Column(
                        children: [
                          ...news.resSearch!.articles!.map(
                            (e) => News(
                              title: e.title ?? '',
                              image: e.urlToImage ?? '',
                            ),
                          )
                        ],
                      ),
                  // const News(
                  // title: 'testing',
                  // image: 'https://image.cnbcfm.com/api/v1/image/107359463-1705413592974-gettyimages-1920708166-raa-cryptoet240112_npLym.jpeg?v=1705413644&w=1920&h=1080',
                  // )
                ],
              ),
            ),
          ),
        );
      }
    );
  }
}
