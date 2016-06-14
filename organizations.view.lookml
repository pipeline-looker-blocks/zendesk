- view: organizations
  sql_table_name: zendesk_pipeline.organizations
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension_group: created
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.created_at

  - dimension: details
    type: string
    sql: ${TABLE}.details

#   missing from Pipeline?
#   - dimension: external_id
#     type: string
#     sql: ${TABLE}.external_id

  - dimension: name
    type: string
    sql: ${TABLE}.name

  - dimension: notes
    type: string
    sql: ${TABLE}.notes

#   missing from Looker?
#   - dimension: organization_fields__cid
#     type: number
#     value_format_name: id
#     sql: ${TABLE}.organization_fields__cid
# 
#   - dimension: result_type
#     type: string
#     sql: ${TABLE}.result_type

  - dimension: shared_comments
    type: yesno
    sql: ${TABLE}.shared_comments

  - dimension: shared_tickets
    type: yesno
    sql: ${TABLE}.shared_tickets

  - dimension_group: updated
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.updated_at
    
  - dimension: url
    type: string
    sql: ${TABLE}.url

  - measure: count
    type: count
    drill_fields: [id, name]
    
  - dimension: count_tickets_submitted
    type: number
    sql: |
        select 
        count(${id})
        from zd_pipeline.tickets
        
  - measure: avg_tickets_submitted
    type: avg
    sql: ${count_tickets_submitted}
            
    