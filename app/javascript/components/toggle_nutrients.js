const toggleNutrients = () => {
  const foods = Array.from(document.querySelectorAll('.toggle-nutrients'));
  const foodNutrients = Array.from(document.querySelectorAll('.nutrients'));
  
  foods.forEach((food) => {
    foodNutrients.forEach((nutrient) => {
      food.addEventListener('click', () => {
        if (foods.indexOf(food) === foodNutrients.indexOf(nutrient)) {
          if (nutrient.classList.contains('hide')) {
            nutrient.classList.remove('hide')
            nutrient.classList.add('show')
          } else {
            nutrient.classList.remove('show')
            nutrient.classList.add('hide')
          };
        };
      });
    });
  });
};

export { toggleNutrients }
