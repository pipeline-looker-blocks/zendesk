- connection: vandelay_looker_connection

- include: "*.view.lookml"       # include all the views
- include: "*.dashboard.lookml"  # include all the dashboards


- explore: audits
  label: 'Ticket Changes'
  joins:
    - join: tickets
      type: left_outer 
      sql_on: ${audits.ticket_id} = ${tickets.id}
      relationship: many_to_one

    - join: organizations
      type: left_outer 
      sql_on: ${tickets.organization_id} = ${organizations.id}
      relationship: many_to_one
      
    - join: requesters
      from: users
      type: left_outer 
      sql_on: ${tickets.requester_id} = ${requesters.id}
      relationship: many_to_one

    - join: assignees
      from: users
      type: left_outer 
      sql_on: ${tickets.assignee_id} = ${assignees.id}
      relationship: many_to_one
      
    - join: audits__events
#       type: left_outer 
      view_label: 'Ticket Changes'
      sql_on: ${audits.id} = ${audits__events._rjm_source_key_id}
      relationship: one_to_many


# - explore: audits__events
#   joins:
#     - join: audits
#       type: left_outer 
#       sql_on: ${audits__events._rjm_source_key_id} = ${audits.id}
#       relationship: many_to_one
# 
#     - join: tickets
#       type: left_outer 
#       sql_on: ${audits.ticket_id} = ${tickets.id}
#       relationship: many_to_one
# 
#     - join: organizations
#       type: left_outer 
#       sql_on: ${tickets.organization_id} = ${organizations.id}
#       relationship: many_to_one
#       
#     - join: requesters
#       from: users
#       type: left_outer 
#       sql_on: ${tickets.requester_id} = ${requesters.id}
#       relationship: many_to_one
# 
#     - join: assignees
#       from: users
#       type: left_outer 
#       sql_on: ${tickets.assignee_id} = ${assignees.id}
#       relationship: many_to_one

- explore: organizations

- explore: ticket_fields
  label: 'Ticket Fields'
  joins:
    - join: tickets__fields
      view_label: 'Ticket Fields'
      sql_on: ${ticket_fields.id_field_name} = ${tickets__fields._rjm_source_key_id}
      relationship: one_to_many

- explore: tickets
  joins:
    - join: organizations
      type: left_outer 
      sql_on: ${tickets.organization_id} = ${organizations.id}
      relationship: many_to_one
      
    - join: requesters
      from: users
      type: left_outer 
      sql_on: ${tickets.requester_id} = ${requesters.id}
      relationship: many_to_one

    - join: assignees
      from: users
      type: left_outer 
      sql_on: ${tickets.assignee_id} = ${assignees.id}
      relationship: many_to_one
      
    - join: groups
      type: left_outer 
      sql_on: ${tickets.group_id} = ${groups.id}
      relationship: many_to_one

# - explore: tickets__fields
#   view_label: 'Ticket fields'

- explore: ticket__tags
  joins:
    - join: tickets
      type: left_outer 
      sql_on: ${ticket__tags._rjm_source_key_id} = ${tickets.id}
      relationship: many_to_one

    - join: organizations
      type: left_outer 
      sql_on: ${tickets.organization_id} = ${organizations.id}
      relationship: many_to_one
      
    - join: requesters
      from: users
      type: left_outer 
      sql_on: ${tickets.requester_id} = ${requesters.id}
      relationship: many_to_one

    - join: assignees
      from: users
      type: left_outer 
      sql_on: ${tickets.assignee_id} = ${assignees.id}
      relationship: many_to_one

- explore: users
  joins:
    - join: organizations
      type: left_outer 
      sql_on: ${users.organization_id} = ${organizations.id}
      relationship: many_to_one

- explore: groups

- explore: tag_types

- explore: ticket_metrics
  joins:
    - join: tickets
      type: left_outer 
      sql_on: ${ticket_metrics.ticket_id} = ${tickets.id}
      relationship: many_to_one

    - join: organizations
      type: left_outer 
      sql_on: ${tickets.organization_id} = ${organizations.id}
      relationship: many_to_one
      
    - join: users
      type: left_outer
      sql_on: ${tickets.assignee_id} = ${users.id}
      relationship: many_to_one
      
    - join: groups
      type: left_outer
      sql_on: ${tickets.group_id} = ${groups.id}
      relationship: many_to_one
      
    - join: requesters
      from: users
      type: left_outer 
      sql_on: ${tickets.requester_id} = ${requesters.id}
      relationship: many_to_one

    - join: assignees
      from: users
      type: left_outer 
      sql_on: ${tickets.assignee_id} = ${assignees.id}
      relationship: many_to_one

