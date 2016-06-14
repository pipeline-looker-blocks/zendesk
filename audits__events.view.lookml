- view: audits__events
  sql_table_name: zendesk_pipeline.audits__events
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: _rjm_level_0_id
    type: number
    sql: ${TABLE}._rjm_level_0_id

  - dimension: _rjm_source_key_id
    type: number
    sql: ${TABLE}._rjm_source_key_id

  - dimension: action
    type: string
    sql: ${TABLE}.action

  - dimension: agreement_id
    type: number
    sql: ${TABLE}.agreement_id

  - dimension: audit_id
    type: number
    # hidden: true
    sql: ${TABLE}.audit_id

  - dimension: author_id
    type: number
    sql: ${TABLE}.author_id

  - dimension: field_name
    type: string
    sql: ${TABLE}.field_name

  - dimension: previous_value
    type: string
    sql: ${TABLE}.previous_value

  - dimension: public
    type: yesno
    sql: ${TABLE}.public

## REMOVE?
#   - dimension: resource8d62628496709122f28c657cd8d694aa
#     type: number
#     sql: ${TABLE}."resource#8d62628496709122f28c657cd8d694aa"
# 
#   - dimension: resourcec436944843b562f7f0e888953d2bd016
#     type: string
#     sql: ${TABLE}."resource#c436944843b562f7f0e888953d2bd016"

  - dimension: subject
    type: string
    sql: ${TABLE}.subject


  - dimension: ticket_id
    type: number
    value_format_name: id
    sql: ${audits.ticket_id}

  - dimension_group: created_at
    type: time
    timeframes: [time, date, week, month]
    sql: ${audits.created_at}

  - dimension: type
    type: string
    sql: ${TABLE}.type

  - dimension: value
    type: string
    sql: ${TABLE}.value

  - dimension: via__channel
    type: string
    sql: ${TABLE}.via__channel

  - dimension: via__source__from__id
    type: number
    sql: ${TABLE}.via__source__from__id

  - dimension: via__source__from__title
    type: string
    sql: ${TABLE}.via__source__from__title

  - dimension: via__source__rel
    type: string
    sql: ${TABLE}.via__source__rel

  - measure: count
    type: count
    drill_fields: [id, field_name, audits.id, audits.via__source__from__name, audits.via__source__to__name]
    
    # ----- ADDITIONAL FIELDS -----
    
  - dimension: number_of_agent_touches  ## The SQL in this dimensions should be updated to reflect whatever your business
    type: number                        ## considers and "agent touch"
    hidden: true
    sql: |
     CASE 
     WHEN ${value} IN ('true','false','incident') THEN 1 
     ELSE 0
     END
         
  - measure: total_agent_touches
    type: sum
    sql: ${number_of_agent_touches}

  - measure: count_unique_tickets
    type: count_distinct
    sql: ${ticket_id}
      
  - measure: average_agents_touches
    type: avg
    sql: ${number_of_agent_touches}  