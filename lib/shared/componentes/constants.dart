// shared/componentes/constants.dart
// const HOME = 'top-headlines';
// const API_KEY = '52f15b1b8bec4c708dd42775edc5db1a';



void printFullText(String text) {
  final Pattern = RegExp('.{1,800}');
  Pattern.allMatches(text).forEach((match) => print(match.group(0)));
}


// CacheHelper.removeData(key: 'uId').then((value) {
//   if (value) {
//     Navigator.pushAndRemoveUntil(
//       context,
//       MaterialPageRoute(builder: (context) => LoginScreen()),
//       (route) => false,
//     );
//   }
// });

