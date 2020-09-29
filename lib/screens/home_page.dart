import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:the_news_app/models/article_model.dart';
import 'package:the_news_app/models/category_model.dart';
import 'package:the_news_app/research/data.dart';
import 'package:the_news_app/research/fetcher.dart';

import 'category_news.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<CategoryModel> categoriesList = new List<CategoryModel>();
  List<ArticleModel> articles = new List<ArticleModel>();

  @override
  void initState() {
    super.initState();
    categoriesList = getCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("News",style: TextStyle(
              color: Colors.black
            ),),
            Text("App",style: TextStyle(
              color: Colors.blue
            ),)
          ],
        ),
        elevation: 0.0,
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.0),
          child: ListView.builder(
        itemCount: categoriesList.length,
          itemBuilder: (context , index){
            return CategoryTile(
              imageUrl: categoriesList[index].imageUrl,
              categoryName: categoriesList[index].categoryName,
            );
          })),
    );
  }
}

class CategoryTile extends StatelessWidget {
  final imageUrl,categoryName;
  CategoryTile({this.imageUrl,this.categoryName});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
            builder: (context) => CategoryNews(
              newsCategory: categoryName.toLowerCase(),
            )
        ));
      },
      child: Container(
        margin: EdgeInsets.only(top: 20.0,bottom: 20.0),
        child: Stack(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(7.0),
                child: CachedNetworkImage(imageUrl: imageUrl,width: 360.0,height: 200.0,fit: BoxFit.cover)),
            Container(
              alignment: Alignment.center,
              width: 360.0,
              height: 200.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7.0),
                color: Colors.black26,
              ),
              child: Text(categoryName,style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.w700
              ),),
            )
          ],
        ),
      ),
    );
  }
}

