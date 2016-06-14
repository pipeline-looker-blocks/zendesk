- view: zendesk_tags
  sql_table_name: zd_pipeline.zendesk_tags
  fields:

  - dimension: _rjm_batched_at
    type: number
    sql: ${TABLE}._rjm_batched_at

  - dimension: count
    type: number
    sql: ${TABLE}.count

  - dimension: name
    type: string
    sql: ${TABLE}.name

