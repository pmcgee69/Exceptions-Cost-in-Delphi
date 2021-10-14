program Project1;
{$APPTYPE CONSOLE}

uses
  System.Diagnostics,
  System.SysUtils;

const
   exception_freq  = 5000; repeat_freq = 10000000 div exception_freq;
type
   int = integer;
   fn  = function (i,j:int):single;
var
   arr : array[1..exception_freq] of int;


function divexcept(i,j:int):single;
begin
    result := i/j
end;

function divnoexcept(i,j:int):single;
begin
    if j<>0 then result := i/j
            else result := -1;
end;


function run_test(f:fn; s:string): integer;
var
   i,j, num_ok, num_ex : int;
   Stopwatch : TStopwatch;
begin
  writeln(s);

  num_ok := 0;
  num_ex := 0;
  Stopwatch := TStopwatch.StartNew;
  for j := 1 to repeat_freq do
    for i := 1 to exception_freq do
      try
        if f( arr[i], i-1 ) > 0 then
           inc(num_ok)
        //else inc(num_ex)
      except
        on E: Exception do
          //Writeln(E.ClassName, ': ', E.Message);
          inc(num_ex);
      end;
  result := Stopwatch.ElapsedMilliseconds;

  writeln( exception_freq * repeat_freq, '  ', num_ok, '  ', num_ex);
  writeln('time: ', result,' ms');
  writeln;
end;


const No_runs = 6;

begin
  var time_nox := 0;
  var time_exc := 0;
  for var i := 1 to exception_freq do  arr[i] := trunc(random(1000));

  for var z := 1 to No_runs do begin
    time_nox := time_nox + run_test(divnoexcept, 'No exceptions');
    time_exc := time_exc + run_test(divexcept,   'Throw exceptions - 1 in '+(exception_freq).ToString);
  end;

  writeln('av Nox : ', time_nox/No_runs:1:1,'  av Exc : ', time_exc/No_runs:1:1);
  readln;
end.
