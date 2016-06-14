- view: ticket_fields
  sql_table_name: zd_pipeline.ticket_fields
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

  - dimension: collapsed_for_agents
    type: yesno
    sql: ${TABLE}.collapsed_for_agents

  - dimension_group: created
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.created_at

  - dimension: description
    type: string
    sql: ${TABLE}.description

  - dimension: editable_in_portal
    type: yesno
    sql: ${TABLE}.editable_in_portal

  - dimension: position
    type: number
    sql: ${TABLE}.position

  - dimension: raw_description
    type: string
    sql: ${TABLE}.raw_description

  - dimension: raw_title
    type: string
    sql: ${TABLE}.raw_title

  - dimension: raw_title_in_portal
    type: string
    sql: ${TABLE}.raw_title_in_portal

  - dimension: removable
    type: yesno
    sql: ${TABLE}.removable

  - dimension: required
    type: yesno
    sql: ${TABLE}.required

  - dimension: required_in_portal
    type: yesno
    sql: ${TABLE}.required_in_portal

  - dimension: tag
    type: string
    sql: ${TABLE}.tag

  - dimension: title
    type: string
    sql: ${TABLE}.title

  - dimension: title_in_portal
    type: string
    sql: ${TABLE}.title_in_portal

  - dimension: type
    type: string
    sql: ${TABLE}.type

  - dimension_group: updated
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.updated_at

  - dimension: url
    type: string
    sql: ${TABLE}.url

  - dimension: visible_in_portal
    type: yesno
    sql: ${TABLE}.visible_in_portal

  - measure: count
    type: count
    drill_fields: [id]

