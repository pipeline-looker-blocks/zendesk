- view: tickets__followup_ids
  sql_table_name: zd_pipeline.tickets__followup_ids
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

  - dimension: value
    type: number
    sql: ${TABLE}.value

  - measure: count
    type: count
    drill_fields: []

