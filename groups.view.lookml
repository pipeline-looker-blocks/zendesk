- view: groups
  sql_table_name: looker_zendesk.zendesk_groups
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: created_at
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.created_at

#   - dimension: deleted
#     type: yesno
#     sql: ${TABLE}.deleted

  - dimension: name
    type: string
    sql: ${TABLE}.name

  - measure: count
    type: count
    drill_fields: [id, name]