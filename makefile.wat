# JUDAS library makefile
#
# NOTE: modules which are or might be called from within an interrupt have the
# -zu option, to tell that SS != DS. It'll crash otherwise.
#
# note : nasm compiles for obj output :
# nasm judasasm.asm -dwatcom -fobj -E!nasm.err
# rem nasm judasasm.asm -ddjgpp -fcoff -E!nasm.err
#

judas.lib: judas.obj judassmp.obj judasraw.obj judaswav.obj judastbl.obj judasxm.obj judasmod.obj judass3m.obj judasio.obj judasasm.obj judasdma.obj judasmem.obj
        wlib -n -c judas.lib @judas.cmd        
judas.obj: judas.c
        wcl386 -c -d2 -w3 -zp4 -fo=judas.obj judas.c
judassmp.obj: judassmp.c
        wcl386 -c -d2 -w3 -zp4 -fo=judassmp.obj judassmp.c
judasraw.obj: judasraw.c
        wcl386 -c -d2 -w3 -zp4 -fo=judasraw.obj judasraw.c
judaswav.obj: judaswav.c
        wcl386 -c -d2 -w3 -zp4 -fo=judaswav.obj judaswav.c
judasio.obj: judasio.c
        wcl386 -c -d2 -w3 -zp4 -fo=judasio.obj judasio.c
judasmem.obj: judasmem.c
        wcl386 -c -d2 -w3 -zp4 -fo=judasmem.obj judasmem.c
judastbl.obj: judastbl.c
        wcl386 -c -d2 -w3 -zp4 -fo=judastbl.obj judastbl.c
judasxm.obj: judasxm.c
        wcl386 -c -d2 -zu -w3 -zp4 -fo=judasxm.obj judasxm.c
judasmod.obj: judasmod.c
        wcl386 -c -d2 -zu -w3 -zp4 -fo=judasmod.obj judasmod.c
judass3m.obj: judass3m.c
        wcl386 -c -d2 -zu -w3 -zp4 -fo=judass3m.obj judass3m.c
judasdma.obj: judasdma.c
        wcl386 -c -d2 -zu -w3 -zp4 -fo=judasdma.obj judasdma.c
judasasm.obj: judasasm.asm
        nasm -dwatcom -fobj judasasm.asm