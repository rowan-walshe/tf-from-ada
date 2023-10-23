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

   --  Pat_Word : constant Pattern_Matcher := Compile ("^\w*\b");

   Pat_001 : constant Pattern_Matcher := Compile ("^""(""""|[^""\n])*""");  --  Match a string
   Pat_002 : constant Pattern_Matcher := Compile ("^ ");
   Pat_003 : constant Pattern_Matcher := Compile ("^(\r)?\n");
   Pat_004 : constant Pattern_Matcher := Compile ("^--.*");
   Pat_005 : constant Pattern_Matcher := Compile ("^\.");
   Pat_006 : constant Pattern_Matcher := Compile ("^abort\b");
   Pat_007 : constant Pattern_Matcher := Compile ("^else\b");
   Pat_008 : constant Pattern_Matcher := Compile ("^new\b");
   Pat_009 : constant Pattern_Matcher := Compile ("^return\b");
   Pat_010 : constant Pattern_Matcher := Compile ("^elsif\b");
   Pat_011 : constant Pattern_Matcher := Compile ("^not\b");
   Pat_012 : constant Pattern_Matcher := Compile ("^reverse\b");
   Pat_013 : constant Pattern_Matcher := Compile ("^abstract\b");
   Pat_014 : constant Pattern_Matcher := Compile ("^end\b");
   Pat_015 : constant Pattern_Matcher := Compile ("^null\b");
   Pat_016 : constant Pattern_Matcher := Compile ("^accept\b");
   Pat_017 : constant Pattern_Matcher := Compile ("^entry\b");
   Pat_018 : constant Pattern_Matcher := Compile ("^select\b");
   Pat_019 : constant Pattern_Matcher := Compile ("^access\b");
   Pat_020 : constant Pattern_Matcher := Compile ("^exception\b");
   Pat_021 : constant Pattern_Matcher := Compile ("^of\b");
   Pat_022 : constant Pattern_Matcher := Compile ("^separate\b");
   Pat_023 : constant Pattern_Matcher := Compile ("^aliased\b");
   Pat_024 : constant Pattern_Matcher := Compile ("^exit\b");
   Pat_025 : constant Pattern_Matcher := Compile ("^some\b");
   Pat_026 : constant Pattern_Matcher := Compile ("^all\b");
   Pat_027 : constant Pattern_Matcher := Compile ("^others\b");
   Pat_028 : constant Pattern_Matcher := Compile ("^subtype\b");
   Pat_029 : constant Pattern_Matcher := Compile ("^and\b");
   Pat_030 : constant Pattern_Matcher := Compile ("^for\b");
   Pat_031 : constant Pattern_Matcher := Compile ("^out\b");
   Pat_032 : constant Pattern_Matcher := Compile ("^synchronized\b");
   Pat_033 : constant Pattern_Matcher := Compile ("^array\b");
   Pat_034 : constant Pattern_Matcher := Compile ("^function\b");
   Pat_035 : constant Pattern_Matcher := Compile ("^overriding\b");
   Pat_036 : constant Pattern_Matcher := Compile ("^at\b");
   Pat_037 : constant Pattern_Matcher := Compile ("^tagged\b");
   Pat_038 : constant Pattern_Matcher := Compile ("^generic\b");
   Pat_039 : constant Pattern_Matcher := Compile ("^package\b");
   Pat_040 : constant Pattern_Matcher := Compile ("^task\b");
   Pat_041 : constant Pattern_Matcher := Compile ("^begin\b");
   Pat_042 : constant Pattern_Matcher := Compile ("^goto\b");
   Pat_043 : constant Pattern_Matcher := Compile ("^pragma\b");
   Pat_044 : constant Pattern_Matcher := Compile ("^terminate\b");
   Pat_045 : constant Pattern_Matcher := Compile ("^body\b");
   Pat_046 : constant Pattern_Matcher := Compile ("^private\b");
   Pat_047 : constant Pattern_Matcher := Compile ("^then\b");
   Pat_048 : constant Pattern_Matcher := Compile ("^if\b");
   Pat_049 : constant Pattern_Matcher := Compile ("^procedure\b");
   Pat_050 : constant Pattern_Matcher := Compile ("^type\b");
   Pat_051 : constant Pattern_Matcher := Compile ("^case\b");
   Pat_052 : constant Pattern_Matcher := Compile ("^in\b");
   Pat_053 : constant Pattern_Matcher := Compile ("^protected\b");
   Pat_054 : constant Pattern_Matcher := Compile ("^constant\b");
   Pat_055 : constant Pattern_Matcher := Compile ("^interface\b");
   Pat_056 : constant Pattern_Matcher := Compile ("^until\b");
   Pat_057 : constant Pattern_Matcher := Compile ("^is\b");
   Pat_058 : constant Pattern_Matcher := Compile ("^raise\b");
   Pat_059 : constant Pattern_Matcher := Compile ("^use\b");
   Pat_060 : constant Pattern_Matcher := Compile ("^declare\b");
   Pat_061 : constant Pattern_Matcher := Compile ("^range\b");
   Pat_062 : constant Pattern_Matcher := Compile ("^delay\b");
   Pat_063 : constant Pattern_Matcher := Compile ("^limited\b");
   Pat_064 : constant Pattern_Matcher := Compile ("^record\b");
   Pat_065 : constant Pattern_Matcher := Compile ("^when\b");
   Pat_066 : constant Pattern_Matcher := Compile ("^delta\b");
   Pat_067 : constant Pattern_Matcher := Compile ("^loop\b");
   Pat_068 : constant Pattern_Matcher := Compile ("^rem\b");
   Pat_069 : constant Pattern_Matcher := Compile ("^while\b");
   Pat_070 : constant Pattern_Matcher := Compile ("^digits\b");
   Pat_071 : constant Pattern_Matcher := Compile ("^renames\b");
   Pat_072 : constant Pattern_Matcher := Compile ("^with\b");
   Pat_073 : constant Pattern_Matcher := Compile ("^do\b");
   Pat_074 : constant Pattern_Matcher := Compile ("^mod\b");
   Pat_075 : constant Pattern_Matcher := Compile ("^requeue\b");
   Pat_076 : constant Pattern_Matcher := Compile ("^xor\b");
   Pat_077 : constant Pattern_Matcher := Compile ("^abs\b");
   Pat_078 : constant Pattern_Matcher := Compile ("^or\b");
   Pat_079 : constant Pattern_Matcher := Compile ("^=>");
   Pat_080 : constant Pattern_Matcher := Compile ("^\(");
   Pat_081 : constant Pattern_Matcher := Compile ("^\)");
   Pat_082 : constant Pattern_Matcher := Compile ("^'");
   Pat_083 : constant Pattern_Matcher := Compile ("^>=");
   Pat_084 : constant Pattern_Matcher := Compile ("^<=");
   Pat_085 : constant Pattern_Matcher := Compile ("^/=");
   Pat_086 : constant Pattern_Matcher := Compile ("^>");
   Pat_087 : constant Pattern_Matcher := Compile ("^<");
   Pat_088 : constant Pattern_Matcher := Compile ("^:=");
   Pat_089 : constant Pattern_Matcher := Compile ("^=");
   Pat_090 : constant Pattern_Matcher := Compile ("^\+");
   Pat_091 : constant Pattern_Matcher := Compile ("^-");
   Pat_092 : constant Pattern_Matcher := Compile ("^\*");
   Pat_093 : constant Pattern_Matcher := Compile ("^/");
   Pat_094 : constant Pattern_Matcher := Compile ("^\*\*");
   Pat_095 : constant Pattern_Matcher := Compile ("^&");
   Pat_096 : constant Pattern_Matcher := Compile ("^,");
   Pat_097 : constant Pattern_Matcher := Compile ("^;");
   Pat_098 : constant Pattern_Matcher := Compile ("^:");
   Pat_099 : constant Pattern_Matcher := Compile ("^\[");
   Pat_100 : constant Pattern_Matcher := Compile ("^\]");

   type Consume_T is record
      Token : Token_T;
      Offset : Positive;
   end record;

   function Get_Offset (Match : Match_Location) return Positive is
   begin
      Put_Line ("Offset: " & Match.First'Image & ", " & Match.Last'Image);
      return Match.Last - Match.First + 1;
   end Get_Offset;

   function Next_Token (Text : String) return Consume_T is
      Matches : Match_Array (0 .. 0);
   begin
      Match (Pat_001, Text, Matches);
      if Matches (0) /= No_Match then
         return (001, Get_Offset (Matches (0)));
      end if;
      Match (Pat_002, Text, Matches);
      if Matches (0) /= No_Match then
         return (002, Get_Offset (Matches (0)));
      end if;
      Match (Pat_003, Text, Matches);
      if Matches (0) /= No_Match then
         return (003, Get_Offset (Matches (0)));
      end if;
      Match (Pat_004, Text, Matches);
      if Matches (0) /= No_Match then
         return (004, Get_Offset (Matches (0)));
      end if;
      Match (Pat_005, Text, Matches);
      if Matches (0) /= No_Match then
         return (005, Get_Offset (Matches (0)));
      end if;
      Match (Pat_006, Text, Matches);
      if Matches (0) /= No_Match then
         return (006, Get_Offset (Matches (0)));
      end if;
      Match (Pat_007, Text, Matches);
      if Matches (0) /= No_Match then
         return (007, Get_Offset (Matches (0)));
      end if;
      Match (Pat_008, Text, Matches);
      if Matches (0) /= No_Match then
         return (008, Get_Offset (Matches (0)));
      end if;
      Match (Pat_009, Text, Matches);
      if Matches (0) /= No_Match then
         return (009, Get_Offset (Matches (0)));
      end if;
      Match (Pat_010, Text, Matches);
      if Matches (0) /= No_Match then
         return (010, Get_Offset (Matches (0)));
      end if;
      Match (Pat_011, Text, Matches);
      if Matches (0) /= No_Match then
         return (011, Get_Offset (Matches (0)));
      end if;
      Match (Pat_012, Text, Matches);
      if Matches (0) /= No_Match then
         return (012, Get_Offset (Matches (0)));
      end if;
      Match (Pat_013, Text, Matches);
      if Matches (0) /= No_Match then
         return (013, Get_Offset (Matches (0)));
      end if;
      Match (Pat_014, Text, Matches);
      if Matches (0) /= No_Match then
         return (014, Get_Offset (Matches (0)));
      end if;
      Match (Pat_015, Text, Matches);
      if Matches (0) /= No_Match then
         return (015, Get_Offset (Matches (0)));
      end if;
      Match (Pat_016, Text, Matches);
      if Matches (0) /= No_Match then
         return (016, Get_Offset (Matches (0)));
      end if;
      Match (Pat_017, Text, Matches);
      if Matches (0) /= No_Match then
         return (017, Get_Offset (Matches (0)));
      end if;
      Match (Pat_018, Text, Matches);
      if Matches (0) /= No_Match then
         return (018, Get_Offset (Matches (0)));
      end if;
      Match (Pat_019, Text, Matches);
      if Matches (0) /= No_Match then
         return (019, Get_Offset (Matches (0)));
      end if;
      Match (Pat_020, Text, Matches);
      if Matches (0) /= No_Match then
         return (020, Get_Offset (Matches (0)));
      end if;
      Match (Pat_021, Text, Matches);
      if Matches (0) /= No_Match then
         return (021, Get_Offset (Matches (0)));
      end if;
      Match (Pat_022, Text, Matches);
      if Matches (0) /= No_Match then
         return (022, Get_Offset (Matches (0)));
      end if;
      Match (Pat_023, Text, Matches);
      if Matches (0) /= No_Match then
         return (023, Get_Offset (Matches (0)));
      end if;
      Match (Pat_024, Text, Matches);
      if Matches (0) /= No_Match then
         return (024, Get_Offset (Matches (0)));
      end if;
      Match (Pat_025, Text, Matches);
      if Matches (0) /= No_Match then
         return (025, Get_Offset (Matches (0)));
      end if;
      Match (Pat_026, Text, Matches);
      if Matches (0) /= No_Match then
         return (026, Get_Offset (Matches (0)));
      end if;
      Match (Pat_027, Text, Matches);
      if Matches (0) /= No_Match then
         return (027, Get_Offset (Matches (0)));
      end if;
      Match (Pat_028, Text, Matches);
      if Matches (0) /= No_Match then
         return (028, Get_Offset (Matches (0)));
      end if;
      Match (Pat_029, Text, Matches);
      if Matches (0) /= No_Match then
         return (029, Get_Offset (Matches (0)));
      end if;
      Match (Pat_030, Text, Matches);
      if Matches (0) /= No_Match then
         return (030, Get_Offset (Matches (0)));
      end if;
      Match (Pat_031, Text, Matches);
      if Matches (0) /= No_Match then
         return (031, Get_Offset (Matches (0)));
      end if;
      Match (Pat_032, Text, Matches);
      if Matches (0) /= No_Match then
         return (032, Get_Offset (Matches (0)));
      end if;
      Match (Pat_033, Text, Matches);
      if Matches (0) /= No_Match then
         return (033, Get_Offset (Matches (0)));
      end if;
      Match (Pat_034, Text, Matches);
      if Matches (0) /= No_Match then
         return (034, Get_Offset (Matches (0)));
      end if;
      Match (Pat_035, Text, Matches);
      if Matches (0) /= No_Match then
         return (035, Get_Offset (Matches (0)));
      end if;
      Match (Pat_036, Text, Matches);
      if Matches (0) /= No_Match then
         return (036, Get_Offset (Matches (0)));
      end if;
      Match (Pat_037, Text, Matches);
      if Matches (0) /= No_Match then
         return (037, Get_Offset (Matches (0)));
      end if;
      Match (Pat_038, Text, Matches);
      if Matches (0) /= No_Match then
         return (038, Get_Offset (Matches (0)));
      end if;
      Match (Pat_039, Text, Matches);
      if Matches (0) /= No_Match then
         return (039, Get_Offset (Matches (0)));
      end if;
      Match (Pat_040, Text, Matches);
      if Matches (0) /= No_Match then
         return (040, Get_Offset (Matches (0)));
      end if;
      Match (Pat_041, Text, Matches);
      if Matches (0) /= No_Match then
         return (041, Get_Offset (Matches (0)));
      end if;
      Match (Pat_042, Text, Matches);
      if Matches (0) /= No_Match then
         return (042, Get_Offset (Matches (0)));
      end if;
      Match (Pat_043, Text, Matches);
      if Matches (0) /= No_Match then
         return (043, Get_Offset (Matches (0)));
      end if;
      Match (Pat_044, Text, Matches);
      if Matches (0) /= No_Match then
         return (044, Get_Offset (Matches (0)));
      end if;
      Match (Pat_045, Text, Matches);
      if Matches (0) /= No_Match then
         return (045, Get_Offset (Matches (0)));
      end if;
      Match (Pat_046, Text, Matches);
      if Matches (0) /= No_Match then
         return (046, Get_Offset (Matches (0)));
      end if;
      Match (Pat_047, Text, Matches);
      if Matches (0) /= No_Match then
         return (047, Get_Offset (Matches (0)));
      end if;
      Match (Pat_048, Text, Matches);
      if Matches (0) /= No_Match then
         return (048, Get_Offset (Matches (0)));
      end if;
      Match (Pat_049, Text, Matches);
      if Matches (0) /= No_Match then
         return (049, Get_Offset (Matches (0)));
      end if;
      Match (Pat_050, Text, Matches);
      if Matches (0) /= No_Match then
         return (050, Get_Offset (Matches (0)));
      end if;
      Match (Pat_051, Text, Matches);
      if Matches (0) /= No_Match then
         return (051, Get_Offset (Matches (0)));
      end if;
      Match (Pat_052, Text, Matches);
      if Matches (0) /= No_Match then
         return (052, Get_Offset (Matches (0)));
      end if;
      Match (Pat_053, Text, Matches);
      if Matches (0) /= No_Match then
         return (053, Get_Offset (Matches (0)));
      end if;
      Match (Pat_054, Text, Matches);
      if Matches (0) /= No_Match then
         return (054, Get_Offset (Matches (0)));
      end if;
      Match (Pat_055, Text, Matches);
      if Matches (0) /= No_Match then
         return (055, Get_Offset (Matches (0)));
      end if;
      Match (Pat_056, Text, Matches);
      if Matches (0) /= No_Match then
         return (056, Get_Offset (Matches (0)));
      end if;
      Match (Pat_057, Text, Matches);
      if Matches (0) /= No_Match then
         return (057, Get_Offset (Matches (0)));
      end if;
      Match (Pat_058, Text, Matches);
      if Matches (0) /= No_Match then
         return (058, Get_Offset (Matches (0)));
      end if;
      Match (Pat_059, Text, Matches);
      if Matches (0) /= No_Match then
         return (059, Get_Offset (Matches (0)));
      end if;
      Match (Pat_060, Text, Matches);
      if Matches (0) /= No_Match then
         return (060, Get_Offset (Matches (0)));
      end if;
      Match (Pat_061, Text, Matches);
      if Matches (0) /= No_Match then
         return (061, Get_Offset (Matches (0)));
      end if;
      Match (Pat_062, Text, Matches);
      if Matches (0) /= No_Match then
         return (062, Get_Offset (Matches (0)));
      end if;
      Match (Pat_063, Text, Matches);
      if Matches (0) /= No_Match then
         return (063, Get_Offset (Matches (0)));
      end if;
      Match (Pat_064, Text, Matches);
      if Matches (0) /= No_Match then
         return (064, Get_Offset (Matches (0)));
      end if;
      Match (Pat_065, Text, Matches);
      if Matches (0) /= No_Match then
         return (065, Get_Offset (Matches (0)));
      end if;
      Match (Pat_066, Text, Matches);
      if Matches (0) /= No_Match then
         return (066, Get_Offset (Matches (0)));
      end if;
      Match (Pat_067, Text, Matches);
      if Matches (0) /= No_Match then
         return (067, Get_Offset (Matches (0)));
      end if;
      Match (Pat_068, Text, Matches);
      if Matches (0) /= No_Match then
         return (068, Get_Offset (Matches (0)));
      end if;
      Match (Pat_069, Text, Matches);
      if Matches (0) /= No_Match then
         return (069, Get_Offset (Matches (0)));
      end if;
      Match (Pat_070, Text, Matches);
      if Matches (0) /= No_Match then
         return (070, Get_Offset (Matches (0)));
      end if;
      Match (Pat_071, Text, Matches);
      if Matches (0) /= No_Match then
         return (071, Get_Offset (Matches (0)));
      end if;
      Match (Pat_072, Text, Matches);
      if Matches (0) /= No_Match then
         return (072, Get_Offset (Matches (0)));
      end if;
      Match (Pat_073, Text, Matches);
      if Matches (0) /= No_Match then
         return (073, Get_Offset (Matches (0)));
      end if;
      Match (Pat_074, Text, Matches);
      if Matches (0) /= No_Match then
         return (074, Get_Offset (Matches (0)));
      end if;
      Match (Pat_075, Text, Matches);
      if Matches (0) /= No_Match then
         return (075, Get_Offset (Matches (0)));
      end if;
      Match (Pat_076, Text, Matches);
      if Matches (0) /= No_Match then
         return (076, Get_Offset (Matches (0)));
      end if;
      Match (Pat_077, Text, Matches);
      if Matches (0) /= No_Match then
         return (077, Get_Offset (Matches (0)));
      end if;
      Match (Pat_078, Text, Matches);
      if Matches (0) /= No_Match then
         return (078, Get_Offset (Matches (0)));
      end if;
      Match (Pat_079, Text, Matches);
      if Matches (0) /= No_Match then
         return (079, Get_Offset (Matches (0)));
      end if;
      Match (Pat_080, Text, Matches);
      if Matches (0) /= No_Match then
         return (080, Get_Offset (Matches (0)));
      end if;
      Match (Pat_081, Text, Matches);
      if Matches (0) /= No_Match then
         return (081, Get_Offset (Matches (0)));
      end if;
      Match (Pat_082, Text, Matches);
      if Matches (0) /= No_Match then
         return (082, Get_Offset (Matches (0)));
      end if;
      Match (Pat_083, Text, Matches);
      if Matches (0) /= No_Match then
         return (083, Get_Offset (Matches (0)));
      end if;
      Match (Pat_084, Text, Matches);
      if Matches (0) /= No_Match then
         return (084, Get_Offset (Matches (0)));
      end if;
      Match (Pat_085, Text, Matches);
      if Matches (0) /= No_Match then
         return (085, Get_Offset (Matches (0)));
      end if;
      Match (Pat_086, Text, Matches);
      if Matches (0) /= No_Match then
         return (086, Get_Offset (Matches (0)));
      end if;
      Match (Pat_087, Text, Matches);
      if Matches (0) /= No_Match then
         return (087, Get_Offset (Matches (0)));
      end if;
      Match (Pat_088, Text, Matches);
      if Matches (0) /= No_Match then
         return (088, Get_Offset (Matches (0)));
      end if;
      Match (Pat_089, Text, Matches);
      if Matches (0) /= No_Match then
         return (089, Get_Offset (Matches (0)));
      end if;
      Match (Pat_090, Text, Matches);
      if Matches (0) /= No_Match then
         return (090, Get_Offset (Matches (0)));
      end if;
      Match (Pat_091, Text, Matches);
      if Matches (0) /= No_Match then
         return (091, Get_Offset (Matches (0)));
      end if;
      Match (Pat_092, Text, Matches);
      if Matches (0) /= No_Match then
         return (092, Get_Offset (Matches (0)));
      end if;
      Match (Pat_093, Text, Matches);
      if Matches (0) /= No_Match then
         return (093, Get_Offset (Matches (0)));
      end if;
      Match (Pat_094, Text, Matches);
      if Matches (0) /= No_Match then
         return (094, Get_Offset (Matches (0)));
      end if;
      Match (Pat_095, Text, Matches);
      if Matches (0) /= No_Match then
         return (095, Get_Offset (Matches (0)));
      end if;
      Match (Pat_096, Text, Matches);
      if Matches (0) /= No_Match then
         return (096, Get_Offset (Matches (0)));
      end if;
      Match (Pat_097, Text, Matches);
      if Matches (0) /= No_Match then
         return (097, Get_Offset (Matches (0)));
      end if;
      Match (Pat_098, Text, Matches);
      if Matches (0) /= No_Match then
         return (098, Get_Offset (Matches (0)));
      end if;
      Match (Pat_099, Text, Matches);
      if Matches (0) /= No_Match then
         return (099, Get_Offset (Matches (0)));
      end if;
      Match (Pat_100, Text, Matches);
      if Matches (0) /= No_Match then
         return (100, Get_Offset (Matches (0)));
      end if;
      --  Put_Line ("Attempting to match on: """ & Text  & """");
      --  Put_Line ("Matched: """ & Text (Matches (0).First .. Matches (0).Last) & """");
      --  Match (Pat_Word, Text, Matches);
      --  if Matches (0) /= No_Match then
      --     return ()
      --     Current := Matches (0).Last + 1;
      --     for I in Matches (0).First .. Matches (0).Last loop
      --        Buffer.Append (Unknown);
      --     end loop;
      --  else
      return (Unknown, 1);
   end Next_Token;

   function Encode (Text : String) return Query_T is
      Current : Integer := Text'First;
      Buffer : Token_Vectors.Vector;
      Result : Query_T := [others => Padding];
      Offset : Integer;
      Consumed : Consume_T;
   begin
      while Current <= Text'Last loop
         --  TODO loop over expected token matchers
         Consumed := Next_Token (Text (Current .. Text'Last));
         Buffer.Append (Consumed.Token);
         Current := Current + Consumed.Offset;
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