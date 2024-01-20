import 'package:flutter/material.dart';

class RichTextWidget extends StatelessWidget {
  RichTextWidget({super.key, required this.tContent, required this.title});
  String title;
  String tContent;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.55,
      child: Wrap(
        children: [
          Text('$title: ',
              maxLines: 3, style: Theme.of(context).textTheme.bodyMedium),
          SizedBox(
            child: Text(tContent,
                maxLines: 4, style: Theme.of(context).textTheme.bodyMedium),
          )
        ],
      ),
    );
  }
}
