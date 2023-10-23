package Tokenizer is

   subtype Token_T is Natural range 0 .. 102;
   subtype Count_T is Natural range 0 .. 255;
   type Query_T is array (Count_T) of Token_T;

   Pad_Tok : constant Token_T := Token_T'First;
   Str_Tok : constant Token_T := 1;
   Unk_Tok : constant Token_T := Token_T'Last - 1;

   function Encode (Text : String) return Query_T;
   --  Tokenize Text
   --  If Text generates less than 256 tokens, the start of Query_T will be padded with Padding
   --  If Text generates more than 256 tokens, the last 256 will be kept

   function Decode (Tokens: Query_T) return String;
   --  Decode Tokens into corresponding text

   --  function Join (First, Last : Query_T) return Query_T;
   --  -- Joins two Query_T's into a single Query_T.
   --  -- If combined the Query's contain more than 256 tokens,
   --  -- tokens form the start of First will be dropped.

end Tokenizer;