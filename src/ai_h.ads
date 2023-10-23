pragma Ada_2012;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with System;

package ai_h is
   
   type TF_Model is private;

   subtype Token is int range 0 .. 102;
   type Query_T is array (1 .. 256) of Token;
   pragma Convention (CPP, Query_T);

   function loadModel return TF_Model  -- ai.h:1
   with Import => True, 
        Convention => CPP, 
        External_Name => "_Z9loadModelv";

   function runModel (bundle : TF_Model; tokens : Query_T) return int  -- ai.h:2
   with Import => True, 
        Convention => CPP, 
        External_Name => "_Z8runModelPvPi";

private

   type TF_Model is new System.Address;

end ai_h;
