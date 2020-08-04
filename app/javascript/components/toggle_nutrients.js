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

const toggleFoods = () => {
  const foodBox = Array.from(document.querySelectorAll('.food-box'));
  const arrows = Array.from(document.querySelectorAll('.show-food'));

  foodBox.forEach((box) => {
    arrows.forEach((arrow) => {
      arrow.addEventListener('click', () => {
        if (foodBox.indexOf(box) === arrows.indexOf(arrow)) {
          if (box.classList.contains('hide')) {
            box.classList.remove('hide')
            arrow.innerHTML = '';
            arrow.insertAdjacentHTML('beforeend', "<p>HIDE FOOD</p> <i class='fas fa-angle-up'></i>")
          } else {
            box.classList.add('hide')
            arrow.innerHTML = '';
            arrow.insertAdjacentHTML('beforeend', "<p>SHOW FOOD</p> <i class='fas fa-angle-down'></i>")
          };
        };
      });
    });
  });
};

export { toggleNutrients }
export { toggleFoods }
