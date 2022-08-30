import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'Albums/Album.dart';
import 'PhotoPage.dart';
import 'Albums/AlbumList.dart';

class Images extends StatefulWidget {
  Album snapshot;

  Images(this.snapshot);

  @override
  State<Images> createState() => _ImagesState();
}

class _ImagesState extends State<Images> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Material(
                    child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PhotoPage(widget.snapshot)),
                    );
                  },
                  child: Image.network(
                    widget.snapshot.image,
                    filterQuality: FilterQuality.high,
                  ),
                ))),
          ],
        ),
        Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: EdgeInsets.only(top: 5),
              child: Icon(
                Icons.more_horiz,
                color: Colors.grey,
              ),
            ))
      ],
    );
  }
}
