with Ada.Containers.Vectors;
with GNAT.Regpat; use GNAT.Regpat;

with Ada.Text_IO; use Ada.Text_IO;

package body Tokenizer is

   package Token_Vectors is new
    Ada.Containers.Vectors
     (Index_Type   => Natural,
      Element_Type => Token_T);
   use type Token_Vectors.Vector;
   use Token_Vectors;

   Word : constant Pattern_Matcher := Compile ("^\w*\b");

   function Encode (Text : String) return Query_T is
      Current : Integer := Text'First;
      Matches : Match_Array (0 .. 0);
      Buffer : Token_Vectors.Vector;
      Result : Query_T := [others => Padding];
      Offset : Integer;
   begin
      while Current <= Text'Last loop
         --  TODO loop over expected token matchers
         Put_Line ("Attempting to match on: """ & Text (Current .. Text'Last) & """");
         Match (Word, Text (Current .. Text'Last), Matches);
         if Matches (0) = No_Match then
            Current := Current + 1;
            Buffer.Append (Unknown);
         else
            Put_Line ("Matched: """ & Text (Matches (0).First .. Matches (0).Last) & """");
            Current := Matches (0).Last + 1;
            for I in Matches (0).First .. Matches (0).Last loop
               Buffer.Append (Unknown);
            end loop;
         end if;
      end loop;

      --  Move Tokens from Buffer to Query_T
      --  Both are indexed from 0
      if Natural (Buffer.Length) > Result'Length then
         Offset := Natural (Buffer.Length) - Result'Length;
         for I in Result'Range loop
            Result (I) := Buffer (I + Offset);
         end loop;
      else
         Offset := Result'Length - Natural (Buffer.Length);
         for I in 0 .. Natural (Buffer.Last_Index) loop
            Result (I + Offset) := Buffer (I);
         end loop;
      end if;
      return Result;
   end Encode;

   --  function Decode (Tokens: Query_T) return String is
   --  begin
   --  end Decode;

   --  function Join (First, Last : Query_T) return Query_T is
   --  begin
   --  end Join;

end Tokenizer;