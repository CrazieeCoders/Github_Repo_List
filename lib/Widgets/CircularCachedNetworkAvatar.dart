import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CircularCachedNetworkAvatar extends StatelessWidget {

  final String url;
  final double size;

  CircularCachedNetworkAvatar({this.url,this.size=25.0});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      child: url != null
        ? ClipOval(
        child: CachedNetworkImage(
          fadeInDuration: const Duration(seconds: 0),
          fadeOutDuration: const Duration(seconds: 0),
          imageUrl: url,
          placeholder: (context,url){
           return Container(
             color: Colors.grey,
             child: Icon(Icons.person_outline),
           );
          },
          fit: BoxFit.cover,
        ),
      ):
      CircleAvatar(
          backgroundColor: Colors.grey,
          child: Icon(Icons.person))
    );
  }
}
