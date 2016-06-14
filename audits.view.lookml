- view: audits
  sql_table_name: zd_pipeline.audits
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: _rjm_batched_at
    type: number
    sql: ${TABLE}._rjm_batched_at

  - dimension: author_id
    type: number
    sql: ${TABLE}.author_id

#### REVIEW THIS
  - dimension_group: created_at
    type: string
#     timeframes: [time, date, week, month]
    sql: ${TABLE}.created_at

  - dimension: metadata__suspension_type_id
    type: number
    sql: ${TABLE}.metadata__suspension_type_id

  - dimension: metadata__system__client
    type: string
    sql: ${TABLE}.metadata__system__client

  - dimension: metadata__system__ip_address
    type: string
    sql: ${TABLE}.metadata__system__ip_address

  - dimension: metadata__system__json_email_identifier
    type: string
    sql: ${TABLE}.metadata__system__json_email_identifier

  - dimension: metadata__system__latitude
    type: number
    sql: ${TABLE}.metadata__system__latitude

  - dimension: metadata__system__location
    type: string
    sql: ${TABLE}.metadata__system__location

  - dimension: metadata__system__longitude
    type: number
    sql: ${TABLE}.metadata__system__longitude

  - dimension: metadata__system__machine_generated
    type: yesno
    sql: ${TABLE}.metadata__system__machine_generated

  - dimension: metadata__system__message_id
    type: string
    sql: ${TABLE}.metadata__system__message_id

  - dimension: metadata__system__raw_email_identifier
    type: string
    sql: ${TABLE}.metadata__system__raw_email_identifier

  - dimension: metadata__trusted
    type: yesno
    sql: ${TABLE}.metadata__trusted

  - dimension: ticket_id
    type: number
    # hidden: true
    sql: ${TABLE}.ticket_id

  - dimension: via__channel
    type: string
    sql: ${TABLE}.via__channel

  - dimension: via__source__from__address
    type: string
    sql: ${TABLE}.via__source__from__address

  - dimension: via__source__from__id
    type: number
    sql: ${TABLE}.via__source__from__id

  - dimension: via__source__from__name
    type: string
    sql: ${TABLE}.via__source__from__name

  - dimension: via__source__from__subject
    type: string
    sql: ${TABLE}.via__source__from__subject

  - dimension: via__source__from__ticket_id
    type: number
    sql: ${TABLE}.via__source__from__ticket_id

  - dimension: via__source__from__title
    type: string
    sql: ${TABLE}.via__source__from__title

  - dimension: via__source__rel
    type: string
    sql: ${TABLE}.via__source__rel

  - dimension: via__source__to__address
    type: string
    sql: ${TABLE}.via__source__to__address

  - dimension: via__source__to__name
    type: string
    sql: ${TABLE}.via__source__to__name

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

