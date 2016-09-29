- view: audits
  sql_table_name: looker_zendesk.audits
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: author_id
    type: number
    sql: ${TABLE}.author_id

  - dimension_group: created_at
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.created_at::timestamp

  - dimension: ticket_id
    type: number
    # hidden: true
    sql: ${TABLE}.ticket_id

  - measure: count
    type: count
    drill_fields: detail*


  # ----- Sets of fields for drilling ------
  sets:
    detail:
    - id
    - via__source__from__name
    - via__source__to__name
    - tickets.via__source__from__name
    - tickets.id
    - tickets.via__source__to__name
    - audits__events.count