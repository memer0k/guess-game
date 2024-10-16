{Нужно реализовать игру «Угадай число!»}
const
  Max_Steps = 15;

begin
  println('Игра «Угадай число!»');
  var lower_bound := ReadInteger($'{newline}Введите нижнюю границу дипазона:');
  var upper_bound := ReadInteger('Введите верхнюю границу дипазона:');
  while upper_bound < lower_bound do 
  begin
    println($'{newline}Ошибка: верхняя граница не может быть меньше нижней.');
    upper_bound := ReadInteger('Введите верхнюю границу дипазона:');
  end;
  var X := Random(lower_bound, upper_bound);
  var Max_Step := min(upper_bound - lower_bound + 1, Max_Steps);
  var attempt := '';
  case Max_Step of 
    1: attempt := 'попытка';
    2..4: attempt := 'попытки';
    5..15: attempt := 'попыток';
  end;
  println($'{newline}Задан диапазон: {lower_bound}..{upper_bound}.');
  println($'Компьютер загадал число. Попробуйте отгадать его! У вас есть {Max_Step} {attempt}.{newline}');
  var count_attempts := 1;
  while count_attempts <= Max_Step do 
  begin
    println($'Попытка #{count_attempts}/{Max_Step}.');
    var input_numb := ReadInteger($'Введите число из диапазона {lower_bound}..{upper_bound}:');
    if (count_attempts = Max_Step) and (input_numb <> X) then
    begin
      println($'Вы проиграли! Исчерпано допустимое количество попыток.{newline}Было загадано число {X}.');
      exit;
    end;
    if (input_numb > upper_bound) or (input_numb < lower_bound) then
    begin
      println($'Вы проиграли!{newline}Было загадано число {X}.');
      exit;
    end;
    if input_numb = X then 
    begin
      var step := '';
      case count_attempts of 
        1: step := 'шаг';
        2..4: step := 'шага';
        5..15: step := 'шагов';
      end;
      println($'Число отгадано! Это {X}.');
      println($'Вы угадали число за {count_attempts} {step}.');
      exit;
    end
    else 
    if X > input_numb then 
    begin
      println($'Загаданное число больше {input_numb}.');
      lower_bound := input_numb;
    end
    else
    if X < input_numb then 
    begin
      println($'Загаданное число меньше {input_numb}.');
      upper_bound := input_numb;
    end;
    count_attempts += 1;
    println();
  end;
end.