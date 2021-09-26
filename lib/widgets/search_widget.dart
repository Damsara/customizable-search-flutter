import 'package:cached_network_image/cached_network_image.dart';
import 'package:customizable_search/helper/screen_utils.dart';
import 'package:flutter/material.dart';

class SearchGameItem extends StatelessWidget {

  final String? imageUrl;
  final String? title;
  final String? releaseDate;

  SearchGameItem({this.title, this.releaseDate , this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 0 , bottom: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        color: Color(0xff07070B).withOpacity(0.4),
      ),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0)
        ),
        margin: EdgeInsets.symmetric(vertical: 15 , horizontal: 15),
        child: Row(
          children: [
            Container(
              height: ScreenUtils.getDesignHeight(81),
              width: ScreenUtils.getDesignWidth(60),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5.0),
                child: CachedNetworkImage(
                  imageUrl: imageUrl!,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: ScreenUtils.getDesignWidth(180),
                    child: Text(title! , style: TextStyle(fontSize: 18 , fontWeight: FontWeight.bold , color: Colors.white),),),
                  Container(
                    width: ScreenUtils.getDesignWidth(80),
                    child: Text(releaseDate == null ? 'Not Mentioned' : releaseDate! , style: TextStyle(fontSize: 18  , fontWeight: FontWeight.bold , color: Colors.red),),),
                ],
              ),
            ),
            Spacer(),
            Container(
              height: ScreenUtils.getDesignHeight(20),
              width: ScreenUtils.getDesignWidth(20),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.red
              ),
              child: Icon(Icons.arrow_forward_ios_rounded , color: Colors.white , size: 15,),
            ),
          ],
        ),
      ),
    );
  }
}
