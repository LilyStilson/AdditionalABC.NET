unit AdditionalABC;

interface
  
  type
    frac = record
      m: Integer;
      n: 1..maxint;
    end;
    
  function Division (x:Integer):Integer;
  function Prime (x:Integer):boolean;
  function GCD (x, y:Integer):integer;
  function LCM (m, n:Integer):integer;
  function NumAdd (x:Integer):integer;
  function DelArr<T> (a: array of T; i: Integer):array of T;
  function InsArr<T> (a: array of T; i: Integer; n: T):array of T;
  function SortE (a: array of Integer):array of Integer;
  function SortS (a: array of Integer):array of Integer;
  function SortI (a: array of Integer):array of Integer;
  function ArrayAverage (a: array of Integer):Real;
  function MatrixMax (a: array [,] of Integer; n, m:Integer):Integer;
  function FindSubStr (subStr, Str: String; k: Integer): Integer;
  function ClearStr (Str: String): String;
  function FindWord (Str: String; k: Integer): String;
  function WordAmmount (Str: String): Integer;
  function ReverseString (Str: String): String;
  function DelWord (Str: String; k: Integer): String;
  function ToWordsNonSeparated (Str: String): array of String;
  
  procedure author;
  procedure WritelnMatrix<T> (a: array [,] of T; n, m: Integer);
  procedure MatrixUpperD<T> (a: array [,] of T; n, m: Integer);
  procedure MatrixLowerD<T> (a: array [,] of T; n, m: Integer);
    
implementation
  
//Copyright
procedure Author;                            
begin    
  writeln('This program is under GNU GPL V3.0 License, 2017, Kostya Romanets, 10V, LIT, Khabarovsk');
end;

//Divisors  
function Division (x:Integer):Integer;       
begin
  for var i:=1 to x do
    if x mod i = 0 then
      Division:=x;
end;

//Prime number check
function Prime (x:integer):boolean;         
begin    
  if x=2 then 
    Prime:=True
  else 
    if not odd(x) then 
      Prime:=False
    else  
      begin
        Prime:=True;                 
        for var i:=2 to x-1 do                 
          if x mod i=0 then 
            Prime:=False;
      end;
  if (x=1) or (x=-1) then
    Prime:=False;
end; 

//Greatest Common Divisor  
function GCD (x, y:integer):integer; 
begin
  while x<>y do 
    if y>x then 
      y:=y-x 
    else 
      x:=x-y;
  GCD:=y;
end;

//Least Common Multiple  
function LCM (m, n:integer):integer; 
begin
  LCM:=(m div GCD(m, n))*n;
end;

//Sum of number's numbers 
function NumAdd (x:integer):integer; 
var
  n:integer;
begin
  n:=0;
  while (x<>0) do 
    begin
      n:=n+(x mod 10);
      x:=x div 10;
    end;
  NumAdd:=n;
end;

//Delete from dynamic array one index
function DelArr<T> (a: array of T; i: Integer):array of T; 
begin
  for var c:=i+1 to a.High do
    begin
      swap (a[i], a[c]);
      inc (i);
    end;
  SetLength (a, a.High);
  DelArr:=a; 
end;

//function DelArr<T> (Self: array of T; i: Integer):array of T;

//Insert to dynamic array one index 
function InsArr<T> (a: array of T; i: Integer; n: T):array of T;
var
  c: Integer;
begin
  SetLength (a, a.High+1);
  a[a.High]:=n;
  c:=a.High;
  //if a[0]=a.Max then
    {for var j:=a.High-1 downto i+1 do
      begin
        swap (a[j], a[c]);
        dec (c);
      end;
  else}
    for var j:=a.High-1 downto i do
      begin
        swap (a[j], a[c]);
        dec (c);
      end;   
  InsArr:=a;
end;
 
function SortE (a: array of Integer):array of Integer;
var
  n: Integer;
begin
  n:=a.High;
  for var k:=0 to n-1 do
    for var i:=0 to n-1 do
      if a[i]>a[i+1] then
        swap (a[i], a[i+1]);
end;
  
function SortS (a: array of Integer):array of Integer;
var
  n, min_index: Integer;
begin
  n:=a.High;
  for var k:=0 to n-1 do
    begin
      min_index:=k;
      for var i:=k+1 to n do
        if a[i]<a[min_index] then
          min_index:=i;
      swap (a[k], a[min_index]);
    end;
end;
  
function SortI (a: array of Integer):array of Integer;
var
  m, n, tmp: Integer;
begin
  n:=a.High+1;
  for var k := 0 to n-1 do
    begin
      tmp := a[k];
      m := 0;
      for var i := 0 to k - 1 do 
          if a[i] > tmp then 
              m := i + 1;
      for var i := k downto m + 1 do 
          a[i] := a[i - 1];
      a[m] := tmp;
    end;
end;

function ArrayAverage (a: array of Integer):Real;
var
  n, s: Integer;
begin
  n:=a.High+1;
  for var i:=0 to n-1 do
      inc (s, a[i]);
  ArrayAverage:=s/n;
end;

procedure WritelnMatrix<T> (a: array [,] of T; n, m: Integer);
begin
  for var i:=0 to n-1 do
    begin
      for var j:=0 to m-1 do
        write (a[i, j]:4);
      writeln;
    end;
  writeln;
end;
  
procedure MatrixUpperD<T> (a: array [,] of T; n, m: Integer);
begin
  for var i:=0 to n-1 do
    begin
      for var j:=0 to m-1 do
        if i<j then
          write (a[i, j]:4)
        else
          write ('    ');
      writeln;
    end;         
end;
  
procedure MatrixLowerD<T> (a: array [,] of T; n, m: Integer);
begin
  for var i:=0 to n-1 do
    begin
      for var j:=0 to m-1 do
        if i>j then
          write (a[i, j]:4)
        else
          write ('    ');
      writeln;
    end;         
end;
  
function MatrixMax (a: array [,] of Integer; n, m:Integer):Integer;
var
  max: Integer;
begin
  max:=1;
  for var i:=0 to n-1 do
    for var j:=0 to m-1 do
      if (a[i, j]) > max then 
          max:=a[i, j];
  MatrixMax:=max;
end; 

function FindSubStr (subStr, Str: String; k: Integer): Integer;
var
  n: Integer;
begin
  Delete (Str, 1, k);
  n:=Pos (subStr, Str);
  if n>0 then
    FindSubStr:=k+n
  else
    FindSubStr:=0;
end;

function ClearStr (Str: String): String;
var
  c: String;
  s: array of String;
begin
  s:=Str.ToWords;
  for var i:=0 to s.High do
      c:=c+s[i]+' ';
  ClearStr:=c;
end;
  
function FindWord (Str: String; k: Integer): String;
var
  s: array of String;
begin
  s:=Str.ToWords;
  FindWord:=s[k+1];
end;

function WordAmmount (Str: String): Integer;
var
  s: array of String;
begin
  s:=Str.ToWords;
  WordAmmount:=s.High+1;
end;

function ReverseString (Str: String): String;
var
  c: String;
  s: array of String;
begin
  s:= Str.ToWords;
  for var i:=s.High downto 0 do
    c:=c+s[i]+' ';
  ReverseString:=c;
end;

function DelWord (Str: String; k: Integer): String;
var
  s: array of String;
begin
  s:=Str.ToWords;
  s[k]:='';
  
  for var i:=k+1 to s.High do
    begin
      swap (s[k], s[i]);
      inc (k);
    end;  
  DelWord:=s.ToString;
end;
  
function ToWordsNonSeparated (Str: String): array of String;
var
  k: Integer;
  s: array of String;
begin
  for var i:=1 to Str.Length do
    if Str[i]=';' then
      inc (k);
  s:= new String[k+1];
  k:=0;
  for var i:=1 to Str.Length do
    if not (Str[i]=';') then
      s[k]:=s[k]+Str[i]
    else
      inc (k);
  ToWordsNonSeparated:=s;
end;
end.