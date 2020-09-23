lgi = require('lgi');
gtk = lgi.Gtk;
gtk.init();

bld = gtk.Builder();
bld:add_from_file('Lab_01.glade');

ui = bld.objects;
ui.Window.title = 'Calculator';
ui.Window.on_destroy = gtk.main_quit();
--
Box_A = ui.TextBox_A;
Box_B = ui.TextBox_B;
Result = ui.TextBox_Result;
function Is_Numbers(a, b)
  if(a == nil or b == nil) then
    Result.text = 'Вы не ввели число а или b, а может сразу оба';
    return false;
  end
  return true;
end
--
function ui.Button_Sum:on_clicked()
  a = tonumber(Box_A.text);
  b = tonumber(Box_B.text);
  if(Is_Numbers(a, b)) then
    Result.text = a + b;
  end
end
function ui.Button_Minus:on_clicked()
  a = tonumber(Box_A.text);
  b = tonumber(Box_B.text);
  if(Is_Numbers(a, b)) then
    Result.text = a - b;
  end
end
function ui.Button_Mul:on_clicked()
  a = tonumber(Box_A.text);
  b = tonumber(Box_B.text);
  if(Is_Numbers(a, b)) then
    Result.text = a * b;
  end
end
function ui.Button_Divide:on_clicked()
  a = tonumber(Box_A.text);
  b = tonumber(Box_B.text);
  if(Is_Numbers(a, b)) then
    if(b == 0) then
      Result.text = 'Нельзя делить на ноль!';
    else
      Result.text = a / b;
    end
  end
end
--
ui.Window:show_all();

gtk.main()
