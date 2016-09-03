program programRooms;

var
  rooms: array [0..4] of string;

var
  room, currentRoom: integer;


procedure writeRoom(room: integer);
begin
  writeln(room, ': ', rooms[room]);  
end;

procedure writeCurrentRoom();
begin
  writeln();
  writeln('Текущая комната:');
  writeRoom(currentRoom);
end;

procedure writeAvailableRooms();
var
  prev, next: integer;
begin
  prev := (currentRoom + 1 + 5) mod 5;
  next := (currentRoom - 1 + 5) mod 5;
  writeln('Доступные комнаты:');
  writeRoom(prev);
  writeRoom(next);
end;

function checkRoom(room: integer): boolean;
begin
  checkRoom := (room = (currentRoom + 1 + 5) mod 5) OR (room = (currentRoom - 1 + 5) mod 5);
end;

begin
  rooms[0] := 'Гостиная';
  rooms[1] := 'Спальня';
  rooms[2] := 'Кухня';
  rooms[3] := 'Детская';
  rooms[4] := 'Библиотека';
  
  currentRoom := 0;
  
  while true do
  begin
    writeCurrentRoom();
    writeAvailableRooms();
    writeln('Введите номер комнаты:');
    readln(room);
    if checkRoom(room) then
      currentRoom := room;
  end;  
end.