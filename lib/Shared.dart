import 'package:flutter/material.dart';

Widget articalItem(map){
  return Padding(
    padding: const EdgeInsets.all(20.0),
    child: Row(
      children: [
        Container(
          width: 120,
          height: 120,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              image: DecorationImage(
                image: map['urlToImage'] == ''  ||  map['urlToImage'] == null?
               AssetImage('img/not-found.jpg') as ImageProvider:
                NetworkImage(
                  map['urlToImage'],
                ),
                onError: (exception, stackTrace) => print('Error'),
                fit: BoxFit.cover,
              )),
        ),
        SizedBox(
          width: 25,
        ),
        Expanded(
          child: Container(
            height: 120,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    map['title'],
                    style: TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w600),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 4,
                  ),
                ),
                Text(
              map['publishedAt'],
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 18, fontWeight: FontWeight.w600),
                )
              ],
            ),
          ),
        )
      ],
    ),
  );
}