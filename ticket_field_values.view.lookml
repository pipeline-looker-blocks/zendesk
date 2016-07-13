- view: tickets__fields
  sql_table_name: zd_pipeline.tickets__fields
  fields:

  - dimension: id_field_value
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: _rjm_source_key_id
    type: number
    sql: ${TABLE}._rjm_source_key_id

  - dimension: value
    type: string
    sql: ${TABLE}.value

  - measure: count_field_values
    type: count
    drill_fields: [id_field_value]

