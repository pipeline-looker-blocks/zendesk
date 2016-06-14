- view: zendesk_macros
  sql_table_name: zd_pipeline.zendesk_macros
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: _rjm_batched_at
    type: number
    sql: ${TABLE}._rjm_batched_at

  - dimension: active
    type: yesno
    sql: ${TABLE}.active

  - dimension_group: created
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.created_at

  - dimension: position
    type: number
    sql: ${TABLE}.position

  - dimension: title
    type: string
    sql: ${TABLE}.title

  - dimension_group: updated
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.updated_at

  - dimension: url
    type: string
    sql: ${TABLE}.url

  - measure: count
    type: count
    drill_fields: [id]

