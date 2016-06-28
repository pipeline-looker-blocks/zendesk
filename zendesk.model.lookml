- connection: pipeline

- include: "*.view.lookml"       # include all the views
- include: "*.dashboard.lookml"  # include all the dashboards


- explore: audits
  fields: [
    ALL_FIELDS*,
    -tickets.requester_email,
    -tickets.assignee_email
    ]
  joins:
    - join: tickets
      type: left_outer 
      sql_on: ${audits.ticket_id} = ${tickets.id}
      relationship: many_to_one

    - join: organizations
      type: left_outer 
      sql_on: ${tickets.organization_id} = ${organizations.id}
      relationship: many_to_one


- explore: audits__events
  fields: [
    ALL_FIELDS*,
    -tickets.requester_email,
    -tickets.assignee_email
    ]
  joins:
    - join: audits
      type: left_outer 
      sql_on: ${audits__events._rjm_source_key_id} = ${audits.id}
      relationship: many_to_one

    - join: tickets
      type: left_outer 
      sql_on: ${audits.ticket_id} = ${tickets.id}
      relationship: many_to_one

    - join: organizations
      type: left_outer 
      sql_on: ${tickets.organization_id} = ${organizations.id}
      relationship: many_to_one

- explore: organizations

- explore: ticket_fields

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
      
    - join: zendesk_groups
      type: left_outer 
      sql_on: ${tickets.group_id} = ${zendesk_groups.id}
      relationship: many_to_one

- explore: tickets__fields

- explore: tickets__tags

- explore: users
  joins:
    - join: organizations
      type: left_outer 
      sql_on: ${users.organization_id} = ${organizations.id}
      relationship: many_to_one

- explore: zendesk_groups

- explore: zendesk_tags

- explore: zendesk_ticket_metrics
  fields: [
    ALL_FIELDS*,
    -tickets.requester_email, 
    -tickets.assignee_email
    ]
  joins:
    - join: tickets
      type: left_outer 
      sql_on: ${zendesk_ticket_metrics.ticket_id} = ${tickets.id}
      relationship: many_to_one

    - join: organizations
      type: left_outer 
      sql_on: ${tickets.organization_id} = ${organizations.id}
      relationship: many_to_one
      
    - join: users
      type: left_outer
      sql_on: ${tickets.assignee_id} = ${users.id}
      relationship: many_to_one
      
    - join: zendesk_groups
      type: left_outer
      sql_on: ${tickets.group_id} = ${zendesk_groups.id}
      relationship: many_to_one

