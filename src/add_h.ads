pragma Ada_2012;

pragma Style_Checks (Off);
pragma Warnings (Off, "-gnatwu");

with Interfaces.C; use Interfaces.C;

package add_h is

   function add (x : int; y : int) return int  -- add.h:4
   with Import => True, 
        Convention => CPP, 
        External_Name => "_Z3addii";

end add_h;

pragma Style_Checks (On);
pragma Warnings (On, "-gnatwu");
