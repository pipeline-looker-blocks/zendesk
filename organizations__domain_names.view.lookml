- view: organizations__domain_names
  sql_table_name: zd_pipeline.organizations__domain_names
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
    type: string
    sql: ${TABLE}.value

  - measure: count
    type: count
    drill_fields: []

