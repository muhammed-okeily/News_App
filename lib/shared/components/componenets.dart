
import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:news/layout/cubit/states.dart';
import 'package:news/modules/web_view.dart';


Widget defaultButton({
  double width = double.infinity,
  Color background = Colors.black12,
  bool isUpperCase = true,
  double radius = 3.0,
  required  function,
  required String text,
}) =>
    Container(
      width: width,
      height: 50.0,
      child: MaterialButton(
        onPressed: function,
        child: Text(
          isUpperCase ? text.toUpperCase() : text,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          radius,
        ),
        color: background,
      ),
    );

Widget defaultTextButton({
  required  function,
   required String text,
}) =>
    TextButton(
      onPressed: function,
      child: Text(
        text.toUpperCase(),
      ),
    );

Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType type,
   onSubmit,
 onChange,
   onTap,
  bool isPassword = false,
  required validate,
  required String label,
  required IconData prefix,
           suffix,
       suffixPressed,
  bool isClickable = true,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      obscureText: isPassword,
      enabled: isClickable,
      onFieldSubmitted: onSubmit,
      onChanged: onChange,
      onTap: onTap,
      validator: validate,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(
          prefix,
        ),
        suffixIcon: suffix != null
            ? IconButton(
          onPressed: suffixPressed,
          icon: Icon(
            suffix,
          ),
        )
            : null,
        border: OutlineInputBorder(),
      ),
    );
Widget myDivider() => Padding(
  padding: const EdgeInsetsDirectional.only(
    start: 20.0,
  ),
  child: Container(
    width: double.infinity,
    height: 1.0,
    color: Colors.grey[300],
  ),
);
Widget buildArtricleItem(articles , context)=> InkWell(
  onTap: () {
    navigateTo(
      context,
      WebViewScreen(articles['url']),
    );
  },
  child:   Padding (
  
    padding: const EdgeInsets.all(20.0),
  
    child: Row(
  
      children: [
  
        Container(
  
          width: 120,
  
          height: 120,
  
          decoration: BoxDecoration(
  
              borderRadius: BorderRadius.circular(10.0),
  
              image: DecorationImage(
  
                image: NetworkImage('${articles['urlToImage']}'),
  
                fit: BoxFit.cover,
  
  
  
              )
  
  
  
          ),
  
        ),
  
        SizedBox(
  
          width: 20,
  
        ),
  
        Expanded(
  
          child: Container(
  
            height: 120,
  
            child: Column(
  
              crossAxisAlignment: CrossAxisAlignment.start,
  
              mainAxisAlignment: MainAxisAlignment.start,
  
              children: [
  
                Expanded(
  
                  child: Text(
  
                    '${articles['title']}',
  
                    style: Theme.of(context).textTheme.bodyText1,
  
                    maxLines: 2,
  
                    overflow: TextOverflow.ellipsis,
  
                  ),
  
                ),
  
                Text(
  
                  '${articles['publishedAt']}',
  
                  style: TextStyle(
  
                    color: Colors.grey ,
  
                  ),
  
                ),
  
  
  
              ],
  
            ),
  
          ),
  
        )
  
      ],
  
    ),
  
  ),
);

  Widget articleBuilder(list,context , {isSearch = false})=>ConditionalBuilder(
    condition: list.length>0,
    builder: (context) =>ListView.separated(
        physics: BouncingScrollPhysics(),
        itemBuilder: (context,index) => buildArtricleItem(list[index],context),
        separatorBuilder: (context,index)=>myDivider(),
        itemCount: 10) ,
    fallback: (context) => isSearch ? Container() : Center(child: CircularProgressIndicator()));

void navigateTo(context, widget) => Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => widget,
  ),
);
