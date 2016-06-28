- view: ticket_fields
  sql_table_name: zd_pipeline.ticket_fields
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

#   - dimension: active
#     type: yesno
#     sql: ${TABLE}.active

#   - dimension: collapsed_for_agents
#     type: yesno
#     sql: ${TABLE}.collapsed_for_agents

  - dimension_group: created
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.created_at

  - dimension: description
    type: string
    sql: ${TABLE}.description

  - dimension: position
    type: number
    sql: ${TABLE}.position

#   - dimension: removable
#     type: yesno
#     sql: ${TABLE}.removable

  - dimension: required
    type: yesno
    sql: ${TABLE}.required

  - dimension: tag
    type: string
    sql: ${TABLE}.tag

  - dimension: title
    type: string
    sql: ${TABLE}.title

  - dimension: type
    type: string
    sql: ${TABLE}.type

  - measure: count
    type: count
    drill_fields: [id]

