



// For ascending  / по возрастанию
 ascending(List list){
  
   var sorted =  list.sort((a, b) => a.compareTo(b));

    return sorted;
 }

// For descending / по убыванию
 descending(List list){
  
   var sorted =  list.sort((b, a) => a.compareTo(b));

    return sorted;
 }


// For ascending  / по возрастанию
 ascendingQu(List<String> list){
  
  List<String> sorted = list;
  sorted.sort(); 

    return sorted;
 }

// For descending / по убыванию
 descendingQu(List<String> list){
  List<String> sorted = list;
  sorted.sort();
  var result = list.reversed;

    return sorted;
 }


search(List<String> list, String query){
  
  return list.where((item) => item.contains(query));
}