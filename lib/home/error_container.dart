import 'package:flutter/material.dart';

class ErrorContainer extends StatelessWidget {
  final String message;
  final VoidCallback onTryAgain;

  const ErrorContainer(
      {Key key, @required this.message, @required this.onTryAgain})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '😰',
                style: TextStyle(fontSize: 50.0),
              )
            ],
          ),
          SizedBox(height: 10.0),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: Text(
                  message,
                  style: TextStyle(fontSize: 14.0),
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  maxLines: 10,
                ),
              )
            ],
          ),
          SizedBox(height: 10.0),
          FlatButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
            ),
            color: Color(0xFFDC2626),
            splashColor: Colors.white,
            onPressed: onTryAgain,
            child: Text(
              'Try Again',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14.0,
                letterSpacing: 1.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
