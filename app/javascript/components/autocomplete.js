import 'js-autocomplete/auto-complete.css';
import autocomplete from 'js-autocomplete';

const autocompleteSearch = function() {
  const searchInput = document.getElementById('food_name');
  
  if (searchInput) {
    new autocomplete({
      selector: searchInput,
      minChars: 1,
      source: function(term, suggest){
        $.getJSON('/autocomplete',
          { food_name: term },
          function(data) {
            return data;
        }).then((data) => {
          // const matches = []
          // data.foods.forEach((food) => {
          //   matches.push({type: 'food', name: food });
          // });
          suggest(data.foods)
        });
      },
    });
  }
};

export { autocompleteSearch };
