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
      sql_on: ${audits__events.audit_id} = ${audits.id}
      relationship: many_to_one

    - join: tickets
      type: left_outer 
      sql_on: ${audits.ticket_id} = ${tickets.via__source__from__ticket_id}
      relationship: many_to_one

    - join: organizations
      type: left_outer 
      sql_on: ${tickets.organization_id} = ${organizations.id}
      relationship: many_to_one


- explore: audits__events__attachments

- explore: audits__events__attachments__thumbnails

- explore: audits__events__previous_value

- explore: audits__events__recipients

- explore: audits__events__value

- explore: audits__metadata__flags

- explore: audits__metadata__notifications_suppressed_for

- explore: audits__via__source__from__original_recipients

- explore: audits__via__source__from__ticket_ids

- explore: average_tickets_per_org

- explore: organizations

- explore: organizations__domain_names

- explore: ticket_fields

- explore: ticket_fields__custom_field_options

- explore: ticket_fields__system_field_options

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

- explore: tickets__collaborator_ids

- explore: tickets__custom_fields

- explore: tickets__fields

- explore: tickets__followup_ids

- explore: tickets__sharing_agreement_ids

- explore: tickets__tags

- explore: users
  joins:
    - join: organizations
      type: left_outer 
      sql_on: ${users.organization_id} = ${organizations.id}
      relationship: many_to_one

- explore: users__photo__thumbnails

- explore: zendesk_groups

- explore: zendesk_macros

- explore: zendesk_macros__actions

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

