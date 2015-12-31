//$(document).ready(function(){
//$('second-cat').html("<%= collection_select(:category, :category2_id, Category.where(previous: 8), :id, :name, include_blank: false) %>");
//});


/*window.onload = ->
  elem1 = document.getElementById('category_category1_id')
  elem1Value = elem1.options[elem1.selectedIndex].value

  document.getElementById('second-cat').innerHTML = "<%= collection_select(:category, :category2_id, Category.where(previous:"  + elem1Value + "), :id, :name, include_blank: false) %>"

  elem2 = document.getElementById('category_category2_id')
  elem2Value = elem2.options[elem2.selectedIndex].value

  document.getElementById('third-cat').innerHTML = "<%= collection_select(:category, :category3_id, Category.where(previous: " + elem2Value + "), :id, :name, include_blank: false) %>" */