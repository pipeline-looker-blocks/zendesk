
- view: response_and_resolution_time
  derived_table:
    sql: |
      with audits_events_ts as (
      select
        e.*, a.created_at, a.ticket_id
      from zd_pipeline.audits__events e
      join zd_pipeline.audits a
      on e._rjm_source_key_id = a.id
      ),
      
      max_solved as (
      select
        max(created_at) resolution_date,
        ticket_id
      from audits_events_ts
      where value = 'solved'
      group by 2
      ), 
      
      min_admin_comment as (
      select
        min(e.created_at) first_response, 
        ticket_id
      from 
        (select d.* 
        from audits_events_ts d
        join zd_pipeline.users u
        on d.author_id = u.id
        where role IN ('agent','admin')) e
      where type = 'Comment'
        and public = 1
      group by 2
      ) 
        
      select
       t.created_at, 
       t.ticket_id,
       c.first_response,
       s.resolution_date, 
       datediff('hour', t.created_at, c.first_response) time_to_first_response_hr, 
       datediff('hour', t.created_at, s.resolution_date) time_to_resolution_hr, 
       datediff('day', t.created_at, c.first_response) time_to_first_response_day, 
       datediff('day', t.created_at, s.resolution_date) time_to_resolution_day
      from zd_pipeline.tickets t
      left join max_solved s
      on t.id = s.ticket_id
      left join min_admin_comment c
      on t.id = c.ticket_id

  fields:
  - measure: count
    type: count
    drill_fields: detail*
    
  - measure: avg_hours_to_first_response
    type: avg
    sql: ${TABLE}.time_to_first_response_hr
    
  - measure: avg_hours_to_resolution
    type: avg
    sql: ${TABLE}.time_to_resolution_hr
    
  - measure: avg_days_to_first_response
    type: avg
    sql: ${TABLE}.time_to_first_response_day
    
  - measure: avg_days_to_resolution
    type: avg
    sql: ${TABLE}.time_to_resolution_day

  - dimension_group: created_at
    type: time
    sql: ${TABLE}.created_at

  - dimension_group: first_response
    type: time
    sql: ${TABLE}.first_response

  - dimension_group: resolution_date
    type: time
    sql: ${TABLE}.resolution_date
    
  - dimension: ticket_id
    type: number
    sql: ${TABLE}.ticket_id

  - dimension: time_to_first_response_hr
    type: number
    sql: ${TABLE}.time_to_first_response_hr

  - dimension: time_to_resolution_hr
    type: number
    sql: ${TABLE}.time_to_resolution_hr

  - dimension: time_to_first_response_day
    type: number
    sql: ${TABLE}.time_to_first_response_day

  - dimension: time_to_resolution_day
    type: number
    sql: ${TABLE}.time_to_resolution_day

  sets:
    detail:
      - created_at_time
      - first_response_time
      - resolution_date_time
      - time_to_first_response_hr
      - time_to_resolution_hr
      - time_to_first_response_day
      - time_to_resolution_day

