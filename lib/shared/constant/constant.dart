
 const api_key = "12b71bf44a8b400ea6e1ea46cdcbc4fb" ;

void printFullText(String text)
{
 final pattern = RegExp('.{1,800}'); // 800 is the size of each chunk
 pattern.allMatches(text).forEach((match) => print(match.group(0)));
}