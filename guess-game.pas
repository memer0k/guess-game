{Нужно реализовать игру «Угадай число!»}
const Max_Steps = 15; 
begin
  println('Игра «Угадай число!»');
  var lower_bound := ReadInteger('Введите нижнюю границу дипазона:');
  var upper_bound := ReadInteger('Введите верхнюю границу дипазона:');
  while upper_bound < lower_bound do 
  begin
    println('Ошибка: верхняя граница не может быть меньше нижней.');
    upper_bound := ReadInteger('Введите верхнюю границу дипазона:');
  end;
  var X := Random(lower_bound, upper_bound);
  var Max_Step := min(upper_bound - lower_bound + 1, Max_Steps);
end.