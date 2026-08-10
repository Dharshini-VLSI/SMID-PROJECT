@echo off
echo Compiling...

iverilog -o out.vvp *.v

echo Running...
vvp -l sim.log out.vvp

echo Done! Check sim.log
pause