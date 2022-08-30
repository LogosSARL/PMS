--------------------------------------------------------
--  DDL for Function SPLIT
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "PRJ"."SPLIT" 
(
    p_list varchar2,
    p_del varchar2 := ':'
) return varchar2
is
    l_idx    pls_integer;
    l_list    varchar2(32767) := p_list;
    l_value    varchar2(32767) := '';
begin
    loop
        l_idx := instr(l_list,p_del);
        if l_idx > 0 then
            l_value := l_value || substr(l_list,1,l_idx-1);
            l_list := substr(l_list,l_idx+length(p_del));
        else
        l_value := l_value || l_list;
         return l_value;  
            
        end if;
    end loop;
    return l_value;
end split;

/
