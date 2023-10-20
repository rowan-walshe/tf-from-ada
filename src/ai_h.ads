pragma Ada_2012;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;

package ai_h is

   function loadAndRun return int  -- ai.h:1
   with Import => True, 
        Convention => CPP, 
        External_Name => "_Z10loadAndRunv";

end ai_h;
