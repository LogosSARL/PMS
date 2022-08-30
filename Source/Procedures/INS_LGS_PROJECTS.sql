--------------------------------------------------------
--  DDL for Procedure INS_LGS_PROJECTS
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "PRJ"."INS_LGS_PROJECTS" (
p_sessionid IN VARCHAR2 default null,
p_lang IN VARCHAR2 default null,
p_id IN VARCHAR2 default null,
p_dowhat IN VARCHAR2 default null) AS 

p_header_color varchar2(20) := 'FF0000';


 BEGIN NULL;
htp.prn('
');
htp.prn('
');
htp.prn('
');
htp.prn('
');
htp.prn('
');
htp.prn('
');
htp.prn('
');
htp.prn('
<HTML><HTML dir="ltr">
<title>Header</title>
		} 
</script>

<body bgcolor=#FFFFFF>
<table width="100%">
<tr bgcolor=><td align="center" size="5" ><font color=""><b>Projects</b></font></td></tr>
</table>
<FORM NAME="insert" METHOD=POST ACTION="insupd_LGS_PROJECTS">
<Table Width="100%">
<td valign="left"><INPUT TYPE=Hidden SIZE=10  NAME="p_sessionid" value="');
htp.prn(p_sessionid);
htp.prn('"</td>
<td valign="left"><INPUT TYPE=Hidden SIZE=10  NAME="p_dowhat" value="');
htp.prn(p_dowhat);
htp.prn('"</td>
</table>
<table>
<tr>
<td align=center valign=top><p><INPUT TYPE=BUTTON VALUE="Save" onClick="validate_lgs_projects();"></td>
</tr>
</table>
</form>
</BODY>
</html>
');
 END;

/
