for "_i" from 0 to 99999 do
{
_sounds = ["RadioAmbient2","RadioAmbient6","RadioAmbient8"];

_selected = _sounds select (floor (random (count _sounds)));

nul = [Radio,_selected] call fn_netSay3D;  

sleep (15 + (random 30));
}