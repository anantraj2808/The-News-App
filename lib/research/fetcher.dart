import 'dart:convert';
import 'package:the_news_app/apiData/api.dart';
import 'package:the_news_app/models/article_model.dart';
import 'package:http/http.dart' as http;

class NewsForCategorie {

  List<ArticleModel> news  = [];

  Future<void> getNewsForCategory(String category) async{
    String url = "http://newsapi.org/v2/top-headlines?country=in&category=$category&apiKey=${apiKey}";

    var response = await http.get(url);

    var jsonData = jsonDecode(response.body);

    if(jsonData['status'] == "ok"){
      jsonData["articles"].forEach((element){

        if(element['urlToImage'] != null && element['description'] != null){
          ArticleModel article = ArticleModel(
            title: element['title'],
            author: element['author'],
            description: element['description'],
            urlToImage: element['urlToImage'],
            content: element["content"],
            url: element["url"],
          );
          news.add(article);
        }

      });
    }


  }


}