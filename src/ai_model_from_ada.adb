with Ada.Text_IO;
with Interfaces.C; use Interfaces.C;

with add_h;
with ai_h;

procedure Ai_Model_From_Ada is
   Indent : constant int := ai_h.loadAndRun;
begin
   Ada.Text_IO.Put_Line ("The sum of 3 and 4 is " & add_h.add (3, 4)'Image);
   Ada.Text_IO.Put_Line ("Indent by: " & Indent'Image);
end Ai_Model_From_Ada;
