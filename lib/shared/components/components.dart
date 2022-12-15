import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
//import 'package:udemy_abdullah_mansour/modules/newsApp/web_view.dart';
//import '../../modules/Shop_App/onBoarding.dart';
import '../../modules/newsApp/web_view.dart';
import '../styles/colors.dart';
Widget defaultTextFormField ({
  @required String text,
  @required IconData prefix,
  @required TextEditingController controller,
  @required TextInputType type,
  @required Function validate,
  Function onSubmit,
  Function onChange,
  Function onTap,
  IconData suffix,
  Function suffixIconOnPressed,
  bool obSecure=false,
})=>TextFormField(
  obscureText: obSecure,
controller: controller,
keyboardType: type,
onTap:onTap,
onChanged:onChange,
onFieldSubmitted:onSubmit,
decoration: InputDecoration(
labelText:text,
border: OutlineInputBorder(),
prefixIcon: Icon(prefix),
  suffixIcon: IconButton(
    onPressed: suffixIconOnPressed,
    icon: Icon(suffix),
  ),
),
validator:validate ,
);
Widget defaultButton({
  @required Function onPressed,
  @required String text,
  TextStyle textStyle
})=>MaterialButton(
onPressed: onPressed,
child: Text('${text}'.toUpperCase(),
  style: textStyle,
),
color: defaultPrimaryColor,
);
Widget defaultTextButton({
  @required Function onPressed,
  @required String text,
  TextStyle textStyle
})=>TextButton(
onPressed: onPressed,
child: Text(text.toUpperCase(),
style:textStyle ,
),
);
Widget buildNewsItem(article,context)=>
  //   InkWell(
  // onTap: (){
  //   navigateTo(context, WebViewScreen(article['url']));
  // },
  //  child:
 Padding(
    padding: const EdgeInsets.all(20.0),
    child: Row(
      children: [
        Container(
          width: 120.0,
          height: 120.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage('${article['urlToImage']}'),
            ),
          ),
        ),
        SizedBox(width: 10.0,),
        Expanded(
          child: Container(
            height: 120.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text('${article['title']}',
                    style: Theme.of(context).textTheme.bodyText1,
                    maxLines: 3,
                  ),
                ),
                Text('${article['publishedAt']}',
                  style: Theme.of(context).textTheme.bodyText2,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        )
      ],
    ),
  );
Widget articleBuilder(list,context,{isFallback=false})=>ConditionalBuilder(
  condition: list.length >0,
  builder:(context)=>ListView.separated(
    itemBuilder: (context,index)=>buildNewsItem(list[index],context),
    separatorBuilder: (context,index)=>Divider(
      thickness: 1,
      color: Colors.grey[200],
      indent: 50.0,
      endIndent: 50.0,
    ),
    itemCount: list.length,
  ),
  fallback: (context)=>isFallback ? Container():Center(child: CircularProgressIndicator(color: Colors.deepOrange,)),
);
void navigateTo(context,widget)=>Navigator.push(
  context,
  MaterialPageRoute(builder:(context)=>widget,),
);
void NavigateAndPush(context,widget)=>Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(
      builder: (context)=>widget,
    ),
        (route) {
      return false;
        } ,
);
/*Widget PageViewBuilder(PageItems model)=>Column(
  children: [
    Expanded(
      child: Container(
        decoration: BoxDecoration(

        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: Image(image:
          AssetImage(
            '${model.image}',
          ),
            fit: BoxFit.cover,
          ),
        ),

      ),
    ),
    SizedBox(
      height: 30,
    ),
    Text(
      '${model.title}',
      style: TextStyle(
        fontSize: 20.0,
        color: Colors.black,
      ),
    ),
    SizedBox(
      height: 20,
    ),
    Text(
      '${model.body}',
      style: TextStyle(
        fontSize: 15.0,
        color: Colors.grey[300],
      ),
    ),
    SizedBox(
      height: 100,
    ),
  ],
);
*/