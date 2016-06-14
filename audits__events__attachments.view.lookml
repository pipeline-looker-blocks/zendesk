- view: audits__events__attachments
  sql_table_name: zd_pipeline.audits__events__attachments
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: _rjm_batched_at
    type: number
    sql: ${TABLE}._rjm_batched_at

  - dimension: _rjm_level_0_id
    type: number
    sql: ${TABLE}._rjm_level_0_id

  - dimension: _rjm_level_1_id
    type: number
    sql: ${TABLE}._rjm_level_1_id

  - dimension: _rjm_source_key_id
    type: number
    sql: ${TABLE}._rjm_source_key_id

  - dimension: content_type
    type: string
    sql: ${TABLE}.content_type

  - dimension: content_url
    type: string
    sql: ${TABLE}.content_url

  - dimension: file_name
    type: string
    sql: ${TABLE}.file_name

  - dimension: height
    type: number
    sql: ${TABLE}.height

  - dimension: inline
    type: yesno
    sql: ${TABLE}.inline

  - dimension: mapped_content_url
    type: string
    sql: ${TABLE}.mapped_content_url

  - dimension: size
    type: number
    sql: ${TABLE}.size

  - dimension: url
    type: string
    sql: ${TABLE}.url

  - dimension: width
    type: number
    sql: ${TABLE}.width

  - measure: count
    type: count
    drill_fields: [id, file_name]

