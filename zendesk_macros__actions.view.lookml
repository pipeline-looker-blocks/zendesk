- view: zendesk_macros__actions
  sql_table_name: zd_pipeline.zendesk_macros__actions
  fields:

  - dimension: _rjm_batched_at
    type: number
    sql: ${TABLE}._rjm_batched_at

  - dimension: _rjm_level_0_id
    type: number
    sql: ${TABLE}._rjm_level_0_id

  - dimension: _rjm_source_key_id
    type: number
    sql: ${TABLE}._rjm_source_key_id

  - dimension: field
    type: string
    sql: ${TABLE}.field

  - dimension: value
    type: string
    sql: ${TABLE}.value

  - measure: count
    type: count
    drill_fields: []

