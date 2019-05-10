#!/bin/bash
#Reset plasmashell after graphics glitch (usually after resume)

#resets plasmashell
kquitapp5 plasmashell && kstart5 plasmashell & 
