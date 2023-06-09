import 'package:flutter/material.dart';
import 'package:pmsnb1/models/post_model.dart';
import 'package:pmsnb1/widgets/modal_add_post.dart';

openCustomeDialog(BuildContext context, PostModel? postModel){
    return showGeneralDialog(
      context: context, 
      barrierColor: Colors.black.withOpacity(.5),
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        return Transform.scale(
          scale: animation.value,
          child: Opacity(
            opacity: animation.value,
            child: ModalAddPost(postModel: postModel),
          ),
        );
      },
      transitionDuration: Duration(milliseconds: 200),
      barrierDismissible: true,
      barrierLabel: '',
      pageBuilder: (context, animation, secondaryAnimation) {
        return Container();
      },
    );
  }
