- view: users
  sql_table_name: zendesk_pipeline.users
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension: active
    type: yesno
    sql: ${TABLE}.active

  - dimension: alias
    type: string
    sql: ${TABLE}.alias

#   missing from Looker?
#   - dimension: chat_only
#     type: yesno
#     sql: ${TABLE}.chat_only

  - dimension_group: created
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.created_at

#   missing from Pipeline?
#   - dimension: custom_role_id
#     type: number
#     value_format_name: id
#     sql: ${TABLE}.custom_role_id

  - dimension: details
    type: string
    sql: ${TABLE}.details

  - dimension: email
    type: string
    sql: ${TABLE}.email

#   missing from Pipeline?
#   - dimension: external_id
#     type: string
#     sql: ${TABLE}.external_id

  - dimension_group: last_login
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_login_at

  - dimension: locale
    type: string
    sql: ${TABLE}.locale

  - dimension: locale_id
    type: number
    value_format_name: id
    sql: ${TABLE}.locale_id

  - dimension: moderator
    type: yesno
    sql: ${TABLE}.moderator

  - dimension: name
    type: string
    sql: ${TABLE}.name

  - dimension: notes
    type: string
    sql: ${TABLE}.notes

  - dimension: only_private_comments
    type: yesno
    sql: ${TABLE}.only_private_comments

  - dimension: organization_id
    type: number
    value_format_name: id
    sql: ${TABLE}.organization_id
    
#   missing from Pipeline?
#   - dimension: phone
#     type: string
#     sql: ${TABLE}.phone

#   missing from Looker?
#   - dimension: photo__content_type
#     type: string
#     sql: ${TABLE}.photo__content_type
# 
#   - dimension: photo__content_url
#     type: string
#     sql: ${TABLE}.photo__content_url
# 
#   - dimension: photo__file_name
#     type: string
#     sql: ${TABLE}.photo__file_name
# 
#   - dimension: photo__height
#     type: number
#     sql: ${TABLE}.photo__height
# 
#   - dimension: photo__id
#     type: number
#     sql: ${TABLE}.photo__id
# 
#   - dimension: photo__inline
#     type: yesno
#     sql: ${TABLE}.photo__inline
# 
#   - dimension: photo__mapped_content_url
#     type: string
#     sql: ${TABLE}.photo__mapped_content_url
# 
#   - dimension: photo__size
#     type: number
#     sql: ${TABLE}.photo__size
# 
#   - dimension: photo__width
#     type: number
#     sql: ${TABLE}.photo__width

  - dimension: remote_photo_url
    type: string
    sql: ${TABLE}.photo__url

#   missing from Looker?
#   - dimension: restricted_agent
#     type: yesno
#     sql: ${TABLE}.restricted_agent

#   missing from Looker?
#   - dimension: result_type
#     type: string
#     sql: ${TABLE}.result_type

  - dimension: role
    type: string
    sql: ${TABLE}.role

  - dimension: shared
    type: yesno
    sql: ${TABLE}.shared

#   missing from Looker?
#   - dimension: shared_agent
#     type: yesno
#     sql: ${TABLE}.shared_agent

  - dimension: signature
    type: string
    sql: ${TABLE}.signature

  - dimension: suspended
    type: yesno
    sql: ${TABLE}.suspended

  - dimension: ticket_restriction
    type: string
    sql: ${TABLE}.ticket_restriction

  - dimension: time_zone
    type: string
    sql: ${TABLE}.time_zone

#   missing from Looker?
#   - dimension: two_factor_auth_enabled
#     type: yesno
#     sql: ${TABLE}.two_factor_auth_enabled

  - dimension_group: updated
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.updated_at

  - dimension: url
    type: string
    sql: ${TABLE}.url

  - dimension: verified
    type: yesno
    sql: ${TABLE}.verified

  - measure: count
    type: count
    drill_fields: [id, name]

