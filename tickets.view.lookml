- view: tickets
  sql_table_name: zendesk_pipeline.tickets
  fields:
  

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

# KEEP?
  - dimension: via__source__from__ticket_id
    type: number
    sql: ${TABLE}.via__source__from__ticket_id

  - dimension: allow_channelback
    type: yesno
    sql: ${TABLE}.allow_channelback
    
  - dimension: assignee_email
    description: the requester is the customer who initiated the ticket. the email is retrieved from the `users` table.
    sql: ${assignees.email}

  - dimension: assignee_id  ## include only if your Zendesk application utilizes the assignee_id field
    type: number
    value_format_name: id
    sql: ${TABLE}.assignee_id

#   - dimension: brand_id      ## include only if your Zendesk application utilizes the brand field
#     value_format_name: id                ## only associated with Zendesk Enterprise Accounts
#     type: number
#     sql: ${TABLE}.brand_id
  
## EXISTS IN LOOKER BLOCK BUT NOT HERE    
#   - dimension: bug
#     type: yesno
#     sql: ${TABLE}.bug

  - dimension_group: created_at
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.created_at::timestamp

## KEEP?
#   - dimension: generated_timestamp
#     type: number
#     sql: ${TABLE}.generated_timestamp

## EXISTS IN LOOKER BLOCK BUT NOT HERE    
#   - dimension: description
#     sql: ${TABLE}.description
# 
#   - dimension_group: due
#     type: time
#     timeframes: [time, date, week, month]
#     sql: ${TABLE}.due_at
# 
#   - dimension: external_id
#     sql: ${TABLE}.external_id
# 
#   - dimension: forum_topic_id
#     type: number
#     value_format_name: id
#     sql: ${TABLE}.forum_topic_id

  - dimension: group_id
    type: number
    value_format_name: id
    sql: ${TABLE}.group_id

  - dimension: has_incidents
    type: yesno
    sql: ${TABLE}.has_incidents

  - dimension: organization_id
    type: number
    value_format_name: id
    sql: ${TABLE}.organization_id
    
  - dimension: organization_name
    type: string
    sql: ${organizations.name}

#   - dimension: priority  ## include only if your Zendesk application utilizes the priority field
#     type: string
#     sql: ${TABLE}.priority

  - dimension: raw_subject
    type: string
    sql: ${TABLE}.raw_subject

  - dimension: recipient
    type: string
    sql: ${TABLE}.recipient

  - dimension: requester_email
    description: the requester is the customer who initiated the ticket. the email is retrieved from the `users` table.
    sql: ${requesters.email}

  - dimension: requester_id   
    description: the requester is the customer who initiated the ticket
    type: number
    value_format_name: id
    sql: ${TABLE}.requester_id

## EXISTS IN LOOKER BLOCK BUT NOT HERE
#   - dimension: requester_locale_id
#     type: number
#     value_format_name: id
#     sql: ${TABLE}.requester_locale_id
# 
#   - dimension: requester_name
#     description: the requester is the customer who initiated the ticket
#     sql: ${TABLE}.requester_name

## KEEP?
#   - dimension: result_type
#     type: string
#     sql: ${TABLE}.result_type

  - dimension: satisfaction_rating__comment
    type: string
    sql: ${TABLE}.satisfaction_rating__comment

  - dimension: satisfaction_rating__id
    type: number
    sql: ${TABLE}.satisfaction_rating__id

  - dimension: satisfaction_rating__score
    type: string
    sql: ${TABLE}.satisfaction_rating__score

  - dimension: status
    type: string
    sql: ${TABLE}.status

  - dimension: subject    ## depending on use, either this field or "via_channel" will represent the channel the ticket came through
    type: string
    sql: ${TABLE}.subject

  - dimension: submitter_id     ## The submitter is always the first to comment on a ticket
    description: a submitter is either a customer or an agent submitting on behalf of a customer
    type: number
    value_format_name: id               
    sql: ${TABLE}.submitter_id

## EXISTS IN LOOKER BLOCK BUT NOT HERE
#   - dimension: ticket_form_id
#     type: number
#     value_format_name: id
#     sql: ${TABLE}.ticket_form_id

  - dimension: type
    type: string
    sql: ${TABLE}.type

  - dimension_group: updated_at
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.updated_at

  - dimension: url
    type: string
    sql: ${TABLE}.url

  - dimension: via__channel
    type: string
    sql: ${TABLE}.via__channel

  - dimension: via__source__from__address
    type: string
    sql: ${TABLE}.via__source__from__address

  - dimension: via__source__from__name
    type: string
    sql: ${TABLE}.via__source__from__name

  - dimension: via__source__from__subject
    type: string
    sql: ${TABLE}.via__source__from__subject

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
    drill_fields: [id, requester_email]


  # ----- ADDITIONAL FIELDS -----
  
  - dimension: is_backlogged
    type: yesno
    sql: ${status} = 'pending'

  - dimension: is_new
    type: yesno
    sql: ${status} = 'new'

  - dimension: is_open
    type: yesno
    sql: ${status} = 'open'

  - dimension: is_solved
    description: solved tickets have either a solved or closed status
    type: yesno
    sql: ${status} = 'solved' OR ${status} = 'closed'
    
  - dimension: subject_category
    sql: |
        CASE
        WHEN ${subject} LIKE 'Chat%' THEN 'Chat'
        WHEN ${subject} LIKE 'Offline message%' THEN 'Offline Message'
        WHEN ${subject} LIKE 'Phone%' THEN 'Phone Call'
        ELSE 'Other'
        END
    
  - measure: count_pending_tickets
    type: count
    filters: 
      is_backlogged: 'Yes'
    
  - measure: count_new_tickets
    type: count
    filters: 
      is_new: 'Yes'
        
  - measure: count_open_tickets
    type: count
    filters: 
      is_open: 'Yes'
        
  - measure: count_solved_tickets
    type: count
    filters: 
      is_solved: 'Yes'
      
  - measure: count_distinct_organizations
    type: count_distinct
    sql: ${organization_id}
      
  - measure: count_orgs_submitting
    type: count_distinct
    sql: ${organizations.name}
    filters:
      organization_name: "-NULL"
        
############ TIME FIELDS ###########

  - dimension_group: time
    type: time
    timeframes: [day_of_week, hour_of_day]  ###   use day_of_week
    sql: ${TABLE}.created_at::timestamp
  
#   - dimension: created_day_of_week   
#     sql_case:
#       Sunday:    ${hidden_created_day_of_week_index} = 6
#       Monday:    ${hidden_created_day_of_week_index} = 0
#       Tuesday:   ${hidden_created_day_of_week_index} = 1
#       Wednesday: ${hidden_created_day_of_week_index} = 2
#       Thursday:  ${hidden_created_day_of_week_index} = 3
#       Friday:    ${hidden_created_day_of_week_index} = 4
#       Saturday:  ${hidden_created_day_of_week_index} = 5
    
### REVIEW
#   - dimension: satisfaction_rating_percent_tier
#     type: tier
#     tiers: [10,20,30,40,50,60,70,80,90]
#     sql: ${satisfaction_rating}
# 
#   - measure: average_satisfaction_rating
#     type: avg
#     sql: ${satisfaction_rating}
#     value_format: '#,#00.00%'


### REVIEW BELOW
  # ----- Sets of fields for drilling ------
#   sets:
#     detail:
#     - via__source__from__ticket_id
#     - via__source__from__name
#     - via__source__to__name
#     - organizations.id
#     - organizations.name
#     - audits.count
#     - zendesk_ticket_metrics.count

