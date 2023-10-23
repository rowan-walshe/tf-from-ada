with Ada.Text_IO;
--  with Ada.Calendar; use Ada.Calendar;
--  with Interfaces.C; use Interfaces.C;
--  with Ada.Numerics.Discrete_Random;

--  with ai_h; use ai_h;

with Tokenizer; use Tokenizer;

procedure Ai_Model_From_Ada is

   --  package Rand_Token is new Ada.Numerics.Discrete_Random (Token);
   --  use Rand_Token;

   --  Gen : Generator;

   --  function Generate_Random_Query return Query_T
   --  is
   --     Result : Query_T;
   --  begin
   --     for I in Result'Range loop
   --        Result (I) := Random (Gen);
   --     end loop;
   --     return Result;
   --  end Generate_Random_Query;

   --  Tokens : constant Query_T := (2, 31, 2, 101, 101, 101, 101, 101, 101, 101, 81, 97, 3, 2, 2, 2, 4, 3, 2, 2, 2, 4, 3, 2, 2, 2, 4, 3, 2, 2, 2, 4, 3, 2, 2, 2, 35, 3, 2, 2, 2, 49, 2, 101, 101, 101, 101, 101, 101, 101, 101, 101, 101, 101, 101, 101, 101, 101, 101, 3, 2, 2, 2, 2, 2, 2, 80, 101, 101, 101, 2, 2, 2, 2, 98, 2, 52, 2, 31, 2, 101, 101, 101, 101, 101, 101, 101, 97, 3, 2, 2, 2, 2, 2, 2, 2, 101, 101, 101, 101, 101, 101, 2, 98, 2, 2, 2, 2, 31, 2, 101, 101, 101, 101, 101, 101, 101, 81, 97, 3, 2, 2, 2, 4, 3, 2, 2, 2, 4, 3, 2, 2, 2, 4, 3, 2, 2, 2, 4, 3, 2, 2, 2, 35, 3, 2, 2, 2, 49, 2, 101, 101, 101, 101, 101, 101, 101, 101, 101, 101, 101, 101, 101, 101, 101, 101, 101, 101, 101, 101, 3, 2, 2, 2, 2, 2, 2, 80, 101, 101, 101, 2, 2, 2, 2, 98, 2, 52, 2, 31, 2, 101, 101, 101, 101, 101, 101, 101, 97, 3, 2, 2, 2, 2, 2, 2, 2, 101, 101, 101, 101, 101, 101, 2, 98, 2, 2, 2, 2, 31, 2, 101, 101, 101, 101, 101, 101, 101, 81, 97, 3, 2, 2, 2, 4, 3, 2, 2, 2, 4, 3, 2, 2, 2, 4, 3, 2, 2, 2, 4, 3, 2, 2, 2, 35, 3);

   --  Model : constant TF_Model := loadModel;
   --  Indent : int;
   --  Start_Time, End_Time : Time;
   --  Total : Duration;

   Test : constant String := "with Ada.Text_IO; use Ada.Text_IO;";
   Tokens : constant Query_T := Encode (Test);
begin
   Ada.Text_IO.Put_Line ("Tokens: " & Tokens'Image);
   --  Ada.Text_IO.Put_Line ("Match: " & GNAT.Regexp.Match (Test, Pat_1)'Image);
   --  Ada.Text_IO.Put_Line ("Match: " & GNAT.Regexp.Match (Test, Pat_2)'Image);
   --  for J in 1 .. 10 loop
   --     Start_Time := Clock;
   --     Indent := runModel (Model, Generate_Random_Query);
   --     End_Time := Clock;
   --     Total := (End_Time - Start_Time) * 1000;
   --     Ada.Text_IO.Put_Line ("Indent by: " & Indent'Image);
   --     Ada.Text_IO.Put_Line ("Inference took: " & Total'Image & "ms");
   --  end loop;
end Ai_Model_From_Ada;
