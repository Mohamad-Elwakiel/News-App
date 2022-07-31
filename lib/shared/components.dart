// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors




import 'package:cached_network_image/cached_network_image.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/web_view/web_view_screen.dart';


Widget buildArticleItem (article, context) => InkWell(
  onTap: ()
  {
    navigateTo(context, WebViewScreen(article['url']));
  },
  child:   Padding(
    padding: const EdgeInsets.all(20.0),
    child: Row(
  
      children: [
  
        Container(
  
          width: 120,
  
          height: 120,
  
          decoration: BoxDecoration(
  
            borderRadius: BorderRadius.circular(10),
  
            image: DecorationImage(
  
              image: NetworkImage('${article['urlToImage']}'),
  
              fit: BoxFit.cover,
  
            ),
  
  
  
          ),
  
        ),
  
        SizedBox(
  
          width: 10,
  
        ),
  
        // ignore: sized_box_for_whitespace
  
        Expanded(
  
          child: Container(
  
            height: 120,
  
            child: Column(
  
              mainAxisAlignment: MainAxisAlignment.start,
  
              crossAxisAlignment: CrossAxisAlignment.start,
  
              children: [
  
                Text(
  
                  '${article['title']}',
  
                  style: Theme.of(context).textTheme.bodyText1,
  
                  maxLines: 3,
  
                  overflow: TextOverflow.ellipsis,
  
                ),
  
                Text(
  
                  '${article['publishedAt']}',
  
                  style: TextStyle(
  
                    color: Colors.grey,
  
  
  
                  ),
  
                ),
  
  
  
              ],
  
            ),
  
          ),
  
        ),
  
      ],
  
    ),
  
  ),
);

Widget itemDivider () => Padding (
  padding: const EdgeInsets.all(15.0),
  child:   Container(

    height: 1,

    color: Colors.blueGrey,

  ),
);

Widget articleBuilder (list, {isSearch = false}) => ConditionalBuilder(
    condition: list.isNotEmpty,
    builder: (context) => ListView.separated(
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) => buildArticleItem(list[index], context),
        separatorBuilder: (context, index) => itemDivider(),
        itemCount: list.length),
    fallback: (context) => isSearch ? Container() : Center(child: CircularProgressIndicator()));

Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType inputType,
  Function(String?)?  onSubmit,
  Function(String?)? onChange,
  VoidCallback? onTap,
  required String? Function(String?)? validator,
  required String text,
  required IconData prefixIcon,
  IconData? suffixIcon,
  bool isClickable = true,
  VoidCallback? suffixPressed,
  bool isPassword = false,
}) =>  TextFormField(
  controller: controller,
  keyboardType: inputType,
  obscureText: isPassword,
  onFieldSubmitted: onSubmit,
  onChanged: onChange,
  enabled: isClickable,
  validator: validator,
  onTap: onTap,
  decoration: InputDecoration(
    labelText: text,
    border: OutlineInputBorder(),
    prefixIcon: Icon(
      prefixIcon,
    ),
    suffixIcon: suffixIcon!=null? IconButton(
      icon: Icon(suffixIcon),
      onPressed: suffixPressed,
    ) :  null,
  ),
);


void navigateTo (context, Widget) => Navigator.push(context, MaterialPageRoute(builder: (context) => Widget));