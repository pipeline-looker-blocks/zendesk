- dashboard: overview
  title: Overview
  layout: grid
  rows:
    - elements: [new_open_tickets, pending_tickets, closed_tickets]
      height: 150
    - elements: [tickets_and_orgs]
      height: 400
    - elements: [tickets_by_channel, count_by_status]
      height: 400
    - elements: [top_orgs, top_requesters, top_assignees]
      height: 400
#     - elements: [ticket_tags]
#       height: 500

  filters:

  - name: date
    type: date_filter

  elements:

  - name: new_open_tickets
    type: single_value
    model: zendesk
    explore: ticket_metrics
    measures: [tickets.count]
    filters:
      tickets.status: new,open
    sorts: [tickets.count desc]
    limit: 500
    show_single_value_title: true
    single_value_title: New and open tickets
    show_comparison: false
    listen:
      date: tickets.created_at_date

  - name: pending_tickets
    title: Pending tickets
    type: single_value
    model: zendesk
    explore: ticket_metrics
    dimensions: [tickets.status]
    measures: [tickets.count]
    filters:
      tickets.status: pending
    sorts: [tickets.count desc]
    limit: 500
    show_single_value_title: true
    single_value_title: Pending tickets
    show_comparison: false
    listen:
      date: tickets.created_at_date

  - name: closed_tickets
    title: Untitled Visualization
    type: single_value
    model: zendesk
    explore: ticket_metrics
    measures: [tickets.count]
    filters:
      tickets.status: closed,solved
    sorts: [tickets.count desc]
    limit: 500
    show_single_value_title: true
    single_value_title: Closed and solved tickets
    show_comparison: false
    listen:
      date: tickets.created_at_date

  - name: tickets_by_channel
    title: Tickets submitted by channel
    type: looker_pie
    model: zendesk
    explore: ticket_metrics
    dimensions: [tickets.via__channel]
    measures: [tickets.count]
    sorts: [tickets.count desc]
    limit: 500
    value_labels: legend
    colors: ['#FFCC00', '#1E2023', '#3399CC', '#CC3399', '#66CC66', '#999999', '#FF4E00', '#A2ECBA', '#9932CC', '#0000CD']
    show_view_names: true
    listen:
      date: tickets.created_at_date

  - name: tickets_and_orgs
    title: Ticket submissions over time
    type: looker_line
    model: zendesk
    explore: ticket_metrics
    dimensions: [tickets.created_at_week]
    measures: [tickets.count, tickets.count_distinct_organizations]
    sorts: [tickets.created_at_week desc]
    limit: 500
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    show_null_points: true
    point_style: none
    interpolation: linear
    colors: ['#FFCC00', '#1E2023', '#3399CC', '#CC3399', '#66CC66', '#999999', '#FF4E00', '#A2ECBA', '#9932CC', '#0000CD']
    listen:
      date: tickets.created_at_date

  - name: count_by_status
    title: New, open, solved, and pending ticket count
    type: looker_column
    model: zendesk
    explore: ticket_metrics
    measures: [tickets.count_solved_tickets, tickets.count_new_tickets, tickets.count_open_tickets,
      tickets.count_pending_tickets]
    sorts: [tickets.count_solved_tickets desc]
    limit: 500
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    show_null_labels: false
    colors: ['#FFCC00', '#1E2023', '#3399CC', '#CC3399', '#66CC66', '#999999', '#FF4E00', '#A2ECBA', '#9932CC', '#0000CD']
    listen:
      date: tickets.created_at_date

  - name: top_orgs
    title: Top 20 organizations by tickets submitted
    type: table
    model: zendesk
    explore: ticket_metrics
    dimensions: [tickets.organization_name]
    measures: [tickets.count]
    sorts: [tickets.count desc]
    limit: 20
    show_view_names: true
    show_row_numbers: true
    truncate_column_names: false
    table_theme: editable
    limit_displayed_rows: false
    listen:
      date: tickets.created_at_date

  - name: top_requesters
    title: Top 20 requesters by tickets submitted
    type: table
    model: zendesk
    explore: ticket_metrics
    dimensions: [tickets.requester_email]
    measures: [tickets.count]
    sorts: [tickets.count desc]
    limit: 20
    show_view_names: true
    show_row_numbers: true
    truncate_column_names: false
    table_theme: editable
    limit_displayed_rows: false
    listen:
      date: tickets.created_at_date

  - name: top_assignees
    title: Top 20 agents by all time tickets
    type: table
    model: zendesk
    explore: ticket_metrics
    dimensions: [tickets.assignee_email]
    measures: [tickets.count]
    sorts: [tickets.count desc]
    limit: 20
    show_view_names: true
    show_row_numbers: true
    truncate_column_names: false
    table_theme: editable
    limit_displayed_rows: false
    listen:
      date: tickets.created_at_date


# INCLUDE ONLY IF TICKET TAGS ARE USED AND 'ticket__tags' IS INCLUDED AS AN EXPLORE FILE

#   - name: ticket_tags
#     title: Ticket tags
#     type: looker_column
#     model: zendesk
#     explore: ticket__tags
#     dimensions: [ticket__tags.value, ticket__tags.created_at_month]
#     pivots: [ticket__tags.value]
#     measures: [ticket__tags.count]
#     sorts: [ticket__tags.created_at_month desc, ticket__tags.value]
#     limit: 500
#     column_limit: 50
#     stacking: percent
#     show_value_labels: false
#     label_density: 25
#     legend_position: center
#     x_axis_gridlines: false
#     y_axis_gridlines: true
#     show_view_names: true
#     limit_displayed_rows: false
#     y_axis_combined: true
#     show_y_axis_labels: true
#     show_y_axis_ticks: true
#     y_axis_tick_density: default
#     show_x_axis_label: true
#     show_x_axis_ticks: true
#     x_axis_scale: auto
#     ordering: none
#     show_null_labels: false
#     colors: ['#FFCC00', '#1E2023', '#3399CC', '#CC3399', '#66CC66', '#999999', '#FF4E00', '#A2ECBA', '#9932CC', '#0000CD']
#     listen:
#       date: ticket__tags.created_at_date

#   - name: ticket_tags
#     title: Ticket tags
#     type: looker_column
#     model: zendesk
#     explore: ticket__tags
#     dimensions: [ticket__tags.value, ticket__tags.created_at_month]
#     pivots: [ticket__tags.value]
#     measures: [ticket__tags.count]
#     sorts: [ticket__tags.created_at_month desc, ticket__tags.value]
#     limit: 500
#     column_limit: 50
#     stacking: percent
#     show_value_labels: false
#     label_density: 25
#     legend_position: center
#     x_axis_gridlines: false
#     y_axis_gridlines: true
#     show_view_names: true
#     limit_displayed_rows: false
#     y_axis_combined: true
#     show_y_axis_labels: true
#     show_y_axis_ticks: true
#     y_axis_tick_density: default
#     show_x_axis_label: true
#     show_x_axis_ticks: true
#     x_axis_scale: auto
#     ordering: none
#     show_null_labels: false
#     colors: ['#FFCC00', '#1E2023', '#3399CC', '#CC3399', '#66CC66', '#999999', '#FF4E00', '#A2ECBA', '#9932CC', '#0000CD']
#     listen:
#       date: ticket__tags.created_at_date
