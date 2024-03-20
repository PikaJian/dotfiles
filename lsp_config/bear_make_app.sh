#!/bin/bash
if [ -e "compile_commands.json" ]; then
    make clean
    rm -rf compile_commands.json
    rm .clangd
fi
bear_command='bear -l /home/pikajian/software_packages/usr/lib/x86_64-linux-gnu/bear/libear.so'
eval $bear_command make
sed -i 's/-mips32r2 -EL -msoft-float//g' compile_commands.json
echo -e "CompileFlags:" >> .clangd
echo -e "\tAdd: \n\t\t\"-ferror-limit=0\"" >> .clangd
echo -e "\tRemove: \n\t\t\"-mips32r2\"" >> .clangd
