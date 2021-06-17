envsubst < calibre_lvs.rule.template > calibre_lvs.rule
v2lvs -i -lsp inputs/dffram/RAM8.spi -s inputs/dffram/RAM8.spi -lsp inputs/dffram/RAM32.spi -s inputs/dffram/RAM32.spi -lsp inputs/dffram/RAM512.spi -s inputs/dffram/RAM512.spi -lsp inputs/adk/stdcells.spi -s inputs/adk/stdcells.spi -lsp source.added -s source.added -v inputs/design.flatbuslvs.v -o design.lvs.v.spice
calibre -lvs -hier ./calibre_lvs.rule -hcell hcells -automatch

