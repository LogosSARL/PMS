--------------------------------------------------------
--  DDL for Trigger PRJ_WBS_AUD
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "PRJ"."PRJ_WBS_AUD" 
    after update or delete on prj_wbs
    for each row
declare
    t varchar2(128) := 'PRJ_WBS';
    u varchar2(128) := nvl(sys_context('APEX$SESSION','APP_USER'),user);
begin
if updating then
    if (:old.wbs_id is null and :new.wbs_id is not null) or 
        (:old.wbs_id is not null and :new.wbs_id is null) or 
        :old.wbs_id != :new.wbs_id then 
        insert into history (
            id, table_name, column_name, pk1, tab_row_version, action, action_date, action_by, data_type, old_number, new_number
        ) values (
            history_seq.nextval, t, 'WBS_ID', :old.wbs_prj_id, null, 'U', sysdate, u, 'NUMBER', :old.wbs_id, :new.wbs_id);

    end if;
    if (:old.wbs_prj_id is null and :new.wbs_prj_id is not null) or 
        (:old.wbs_prj_id is not null and :new.wbs_prj_id is null) or 
        :old.wbs_prj_id != :new.wbs_prj_id then 
        insert into history (
            id, table_name, column_name, pk1, tab_row_version, action, action_date, action_by, data_type, old_number, new_number
        ) values (
            history_seq.nextval, t, 'WBS_PRJ_ID', :old.wbs_prj_id, null, 'U', sysdate, u, 'NUMBER', :old.wbs_prj_id, :new.wbs_prj_id);

    end if;
    if (:old.wbs_desc is null and :new.wbs_desc is not null) or 
        (:old.wbs_desc is not null and :new.wbs_desc is null) or 
        :old.wbs_desc != :new.wbs_desc then 
        insert into history (
            id, table_name, column_name, pk1, tab_row_version, action, action_date, action_by, data_type, old_vc, new_vc
        ) values (
            history_seq.nextval, t, 'WBS_DESC', :old.wbs_prj_id, null, 'U', sysdate, u, 'VARCHAR2', :old.wbs_desc, :new.wbs_desc);

    end if;
    if (:old.wbs_start_date is null and :new.wbs_start_date is not null) or 
        (:old.wbs_start_date is not null and :new.wbs_start_date is null) or 
        :old.wbs_start_date != :new.wbs_start_date then 
        insert into history (
            id, table_name, column_name, pk1, tab_row_version, action, action_date, action_by, data_type, old_date, new_date
        ) values (
            history_seq.nextval, t, 'WBS_START_DATE', :old.wbs_prj_id, null, 'U', sysdate, u, 'DATE', :old.wbs_start_date, :new.wbs_start_date);

    end if;
    if (:old.wbs_end_date is null and :new.wbs_end_date is not null) or 
        (:old.wbs_end_date is not null and :new.wbs_end_date is null) or 
        :old.wbs_end_date != :new.wbs_end_date then 
        insert into history (
            id, table_name, column_name, pk1, tab_row_version, action, action_date, action_by, data_type, old_date, new_date
        ) values (
            history_seq.nextval, t, 'WBS_END_DATE', :old.wbs_prj_id, null, 'U', sysdate, u, 'DATE', :old.wbs_end_date, :new.wbs_end_date);

    end if;
    if (:old.wbs_duration is null and :new.wbs_duration is not null) or 
        (:old.wbs_duration is not null and :new.wbs_duration is null) or 
        :old.wbs_duration != :new.wbs_duration then 
        insert into history (
            id, table_name, column_name, pk1, tab_row_version, action, action_date, action_by, data_type, old_number, new_number
        ) values (
            history_seq.nextval, t, 'WBS_DURATION', :old.wbs_prj_id, null, 'U', sysdate, u, 'NUMBER', :old.wbs_duration, :new.wbs_duration);

    end if;
    if (:old.wbs_comments is null and :new.wbs_comments is not null) or 
        (:old.wbs_comments is not null and :new.wbs_comments is null) or 
        :old.wbs_comments != :new.wbs_comments then 
        insert into history (
            id, table_name, column_name, pk1, tab_row_version, action, action_date, action_by, data_type, old_vc, new_vc
        ) values (
            history_seq.nextval, t, 'WBS_COMMENTS', :old.wbs_prj_id, null, 'U', sysdate, u, 'VARCHAR2', :old.wbs_comments, :new.wbs_comments);

    end if;
    if (:old.wbs_status is null and :new.wbs_status is not null) or 
        (:old.wbs_status is not null and :new.wbs_status is null) or 
        :old.wbs_status != :new.wbs_status then 
        insert into history (
            id, table_name, column_name, pk1, tab_row_version, action, action_date, action_by, data_type, old_number, new_number
        ) values (
            history_seq.nextval, t, 'WBS_STATUS', :old.wbs_prj_id, null, 'U', sysdate, u, 'NUMBER', :old.wbs_status, :new.wbs_status);

    end if;
    if (:old.wbs_completion_percentage is null and :new.wbs_completion_percentage is not null) or 
        (:old.wbs_completion_percentage is not null and :new.wbs_completion_percentage is null) or 
        :old.wbs_completion_percentage != :new.wbs_completion_percentage then 
        insert into history (
            id, table_name, column_name, pk1, tab_row_version, action, action_date, action_by, data_type, old_number, new_number
        ) values (
            history_seq.nextval, t, 'WBS_COMPLETION_PERCENTAGE', :old.wbs_prj_id, null, 'U', sysdate, u, 'NUMBER', :old.wbs_completion_percentage, :new.wbs_completion_percentage);

    end if;
    if (:old.wbs_scope_of_work is null and :new.wbs_scope_of_work is not null) or 
        (:old.wbs_scope_of_work is not null and :new.wbs_scope_of_work is null) or 
        :old.wbs_scope_of_work != :new.wbs_scope_of_work then 
        insert into history (
            id, table_name, column_name, pk1, tab_row_version, action, action_date, action_by, data_type, old_vc, new_vc
        ) values (
            history_seq.nextval, t, 'WBS_SCOPE_OF_WORK', :old.wbs_prj_id, null, 'U', sysdate, u, 'VARCHAR2', :old.wbs_scope_of_work, :new.wbs_scope_of_work);

    end if;
    if (:old.wbs_lessons_learned is null and :new.wbs_lessons_learned is not null) or 
        (:old.wbs_lessons_learned is not null and :new.wbs_lessons_learned is null) or 
        :old.wbs_lessons_learned != :new.wbs_lessons_learned then 
        insert into history (
            id, table_name, column_name, pk1, tab_row_version, action, action_date, action_by, data_type, old_vc, new_vc
        ) values (
            history_seq.nextval, t, 'WBS_LESSONS_LEARNED', :old.wbs_prj_id, null, 'U', sysdate, u, 'VARCHAR2', :old.wbs_lessons_learned, :new.wbs_lessons_learned);

    end if;
    if (:old.wbs_risk is null and :new.wbs_risk is not null) or 
        (:old.wbs_risk is not null and :new.wbs_risk is null) or 
        :old.wbs_risk != :new.wbs_risk then 
        insert into history (
            id, table_name, column_name, pk1, tab_row_version, action, action_date, action_by, data_type, old_vc, new_vc
        ) values (
            history_seq.nextval, t, 'WBS_RISK', :old.wbs_prj_id, null, 'U', sysdate, u, 'VARCHAR2', :old.wbs_risk, :new.wbs_risk);

    end if;
    if (:old.wbs_concerns is null and :new.wbs_concerns is not null) or 
        (:old.wbs_concerns is not null and :new.wbs_concerns is null) or 
        :old.wbs_concerns != :new.wbs_concerns then 
        insert into history (
            id, table_name, column_name, pk1, tab_row_version, action, action_date, action_by, data_type, old_vc, new_vc
        ) values (
            history_seq.nextval, t, 'WBS_CONCERNS', :old.wbs_prj_id, null, 'U', sysdate, u, 'VARCHAR2', :old.wbs_concerns, :new.wbs_concerns);

    end if;
    if (:old.wbs_assumptions is null and :new.wbs_assumptions is not null) or 
        (:old.wbs_assumptions is not null and :new.wbs_assumptions is null) or 
        :old.wbs_assumptions != :new.wbs_assumptions then 
        insert into history (
            id, table_name, column_name, pk1, tab_row_version, action, action_date, action_by, data_type, old_vc, new_vc
        ) values (
            history_seq.nextval, t, 'WBS_ASSUMPTIONS', :old.wbs_prj_id, null, 'U', sysdate, u, 'VARCHAR2', :old.wbs_assumptions, :new.wbs_assumptions);

    end if;
    if (:old.wbs_acceptance_criteria is null and :new.wbs_acceptance_criteria is not null) or 
        (:old.wbs_acceptance_criteria is not null and :new.wbs_acceptance_criteria is null) or 
        :old.wbs_acceptance_criteria != :new.wbs_acceptance_criteria then 
        insert into history (
            id, table_name, column_name, pk1, tab_row_version, action, action_date, action_by, data_type, old_vc, new_vc
        ) values (
            history_seq.nextval, t, 'WBS_ACCEPTANCE_CRITERIA', :old.wbs_prj_id, null, 'U', sysdate, u, 'VARCHAR2', :old.wbs_acceptance_criteria, :new.wbs_acceptance_criteria);

    end if;
elsif deleting then
    insert into history (
        id, table_name, column_name, pk1, tab_row_version, action, action_date, action_by, data_type, old_number, new_number
    ) values (
        history_seq.nextval, t, 'WBS_ID', :old.wbs_prj_id, null, 'D', sysdate, u, 'NUMBER', :old.wbs_id, :new.wbs_id);
    insert into history (
        id, table_name, column_name, pk1, tab_row_version, action, action_date, action_by, data_type, old_number, new_number
    ) values (
        history_seq.nextval, t, 'WBS_PRJ_ID', :old.wbs_prj_id, null, 'D', sysdate, u, 'NUMBER', :old.wbs_prj_id, :new.wbs_prj_id);
    insert into history (
        id, table_name, column_name, pk1, tab_row_version, action, action_date, action_by, data_type, old_vc, new_vc
    ) values (
        history_seq.nextval, t, 'WBS_DESC', :old.wbs_prj_id, null, 'D', sysdate, u, 'VARCHAR2', :old.wbs_desc, :new.wbs_desc);
    insert into history (
        id, table_name, column_name, pk1, tab_row_version, action, action_date, action_by, data_type, old_date, new_date
    ) values (
        history_seq.nextval, t, 'WBS_START_DATE', :old.wbs_prj_id, null, 'D', sysdate, u, 'DATE', :old.wbs_start_date, :new.wbs_start_date);
    insert into history (
        id, table_name, column_name, pk1, tab_row_version, action, action_date, action_by, data_type, old_date, new_date
    ) values (
        history_seq.nextval, t, 'WBS_END_DATE', :old.wbs_prj_id, null, 'D', sysdate, u, 'DATE', :old.wbs_end_date, :new.wbs_end_date);
    insert into history (
        id, table_name, column_name, pk1, tab_row_version, action, action_date, action_by, data_type, old_number, new_number
    ) values (
        history_seq.nextval, t, 'WBS_DURATION', :old.wbs_prj_id, null, 'D', sysdate, u, 'NUMBER', :old.wbs_duration, :new.wbs_duration);
    insert into history (
        id, table_name, column_name, pk1, tab_row_version, action, action_date, action_by, data_type, old_vc, new_vc
    ) values (
        history_seq.nextval, t, 'WBS_COMMENTS', :old.wbs_prj_id, null, 'D', sysdate, u, 'VARCHAR2', :old.wbs_comments, :new.wbs_comments);
    insert into history (
        id, table_name, column_name, pk1, tab_row_version, action, action_date, action_by, data_type, old_number, new_number
    ) values (
        history_seq.nextval, t, 'WBS_STATUS', :old.wbs_prj_id, null, 'D', sysdate, u, 'NUMBER', :old.wbs_status, :new.wbs_status);
    insert into history (
        id, table_name, column_name, pk1, tab_row_version, action, action_date, action_by, data_type, old_number, new_number
    ) values (
        history_seq.nextval, t, 'WBS_COMPLETION_PERCENTAGE', :old.wbs_prj_id, null, 'D', sysdate, u, 'NUMBER', :old.wbs_completion_percentage, :new.wbs_completion_percentage);
    insert into history (
        id, table_name, column_name, pk1, tab_row_version, action, action_date, action_by, data_type, old_vc, new_vc
    ) values (
        history_seq.nextval, t, 'WBS_SCOPE_OF_WORK', :old.wbs_prj_id, null, 'D', sysdate, u, 'VARCHAR2', :old.wbs_scope_of_work, :new.wbs_scope_of_work);
    insert into history (
        id, table_name, column_name, pk1, tab_row_version, action, action_date, action_by, data_type, old_vc, new_vc
    ) values (
        history_seq.nextval, t, 'WBS_LESSONS_LEARNED', :old.wbs_prj_id, null, 'D', sysdate, u, 'VARCHAR2', :old.wbs_lessons_learned, :new.wbs_lessons_learned);
    insert into history (
        id, table_name, column_name, pk1, tab_row_version, action, action_date, action_by, data_type, old_vc, new_vc
    ) values (
        history_seq.nextval, t, 'WBS_RISK', :old.wbs_prj_id, null, 'D', sysdate, u, 'VARCHAR2', :old.wbs_risk, :new.wbs_risk);
    insert into history (
        id, table_name, column_name, pk1, tab_row_version, action, action_date, action_by, data_type, old_vc, new_vc
    ) values (
        history_seq.nextval, t, 'WBS_CONCERNS', :old.wbs_prj_id, null, 'D', sysdate, u, 'VARCHAR2', :old.wbs_concerns, :new.wbs_concerns);
    insert into history (
        id, table_name, column_name, pk1, tab_row_version, action, action_date, action_by, data_type, old_vc, new_vc
    ) values (
        history_seq.nextval, t, 'WBS_ASSUMPTIONS', :old.wbs_prj_id, null, 'D', sysdate, u, 'VARCHAR2', :old.wbs_assumptions, :new.wbs_assumptions);
    insert into history (
        id, table_name, column_name, pk1, tab_row_version, action, action_date, action_by, data_type, old_vc, new_vc
    ) values (
        history_seq.nextval, t, 'WBS_ACCEPTANCE_CRITERIA', :old.wbs_prj_id, null, 'D', sysdate, u, 'VARCHAR2', :old.wbs_acceptance_criteria, :new.wbs_acceptance_criteria);

end if;
end prj_wbs_aud;

/
ALTER TRIGGER "PRJ"."PRJ_WBS_AUD" ENABLE;
