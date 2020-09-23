import 'package:flutter/material.dart';
import 'package:github_repo/Jsonreader.dart';

import 'Model/GitHubModel.dart';
import 'Themes/styling.dart';
import 'Widgets/CircularCachedNetworkAvatar.dart';


class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}


class _MyHomePageState extends State<MyHomePage> {

  Widget gitList(Item item){
    return Card(
      elevation: 8.0,
      child: Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top:18.0),
              child: CircularCachedNetworkAvatar(url: item.owner.avatarUrl,size: 50,),
            ),
            Text(item.owner.login,
              style: AppTheme.userTitle),
            Divider(),
            Padding(
              padding: const EdgeInsets.only(top:10.0),
              child: Text(item.name.toUpperCase(),
                style:AppTheme.headerTitle,
              )
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(child: Text(item.description,
              style: AppTheme.descTitle,),),
            ),
            Icon(Icons.star,
              color: AppTheme.primaryColor,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(item.stargazersCount.toString()),
            ),
          ],
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GitHub"),
        centerTitle: true,
        backgroundColor: AppTheme.primaryColor,
      ),
      body: Container(
        child: FutureBuilder(
          future: JsonReader.readJson(),
          builder: (BuildContext context,AsyncSnapshot<List<Item>> snapshot) {
            if (snapshot.data == null) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      child: CircularProgressIndicator(
                        valueColor:new AlwaysStoppedAnimation<Color>(AppTheme.primaryColor),
                      ),
                    ),
                    Text('loading.....')
                  ],
                ),
              );
            } else {
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, index) {
                    Item item = snapshot.data[index];
                    return gitList(item);
                  }
              );
            }
          },
        ),
      ),
    );
  }
}
