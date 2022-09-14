#!/bin/bash

nasm -dwatcom -fobj dos32/input.asm
nasm -dwatcom -fobj dos32/timer.asm
nasm -dwatcom -fobj dos32/dpmi.asm
wcl386 -d2 -ldos4g ichinit.c pci.c codec.c dos32/dpmi.obj dos32/timer.obj dos32/input.obj
