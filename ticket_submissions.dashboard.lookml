- dashboard: ticket_submissions
  title: Ticket Submissions
  layout: grid
  rows:
    - elements: [all_tickets, orgs_submitting, avg_tickets_per_org]
      height: 150
    - elements: [tickets_submitted_by_org]
      height: 300
    - elements: [ticket_stats_by_org]
      height: 300
    - elements: [peak_hours, peak_days]
      height: 300

#  filters:

  elements:

  - name: all_tickets
    type: single_value
    model: zendesk
    explore: tickets
    measures: [tickets.count]
    sorts: [tickets.count desc]
    limit: 500
    show_single_value_title: true
    single_value_title: All time tickets submitted
    show_comparison: false
  - name: orgs_submitting
    type: single_value
    model: zendesk
    explore: tickets
    measures: [tickets.count_orgs_submitting]
    sorts: [tickets.count_orgs_submitting desc]
    limit: 500
    show_single_value_title: true
    single_value_title: Organizations submitting tickets
    show_comparison: false
  - name: avg_tickets_per_org
    type: single_value
    model: zendesk
    explore: average_tickets_per_org
    measures: [average_tickets_per_org.avg_tix_per_org]
    sorts: [average_tickets_per_org.avg_tix_per_org desc]
    limit: 500
    show_single_value_title: true
    single_value_title: Average number of tickets submitted per organization
    show_comparison: false
  - name: ticket_stats_by_org
    title: Ticket stats by organization
    type: table
    model: zendesk
    explore: tickets
    dimensions: [tickets.organization_name]
    measures: [tickets.count_new_tickets, tickets.count_open_tickets, tickets.count_pending_tickets,
      tickets.count_solved_tickets, tickets.count, response_and_resolution_time.avg_days_to_resolution]
    sorts: [response_and_resolution_time.avg_days_to_resolution]
    limit: 500
    show_view_names: true
    show_row_numbers: true
    truncate_column_names: false
    table_theme: editable
    limit_displayed_rows: false
  - name: tickets_submitted_by_org
    title: Tickets submitted by organization
    type: looker_column
    model: zendesk
    explore: tickets
    dimensions: [tickets.created_at_month, tickets.organization_name]
    pivots: [tickets.organization_name]
    measures: [tickets.count]
    sorts: [tickets.count desc, tickets.organization_name]
    limit: 500
    column_limit: 50
    stacking: percent
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
    x_axis_scale: time
    ordering: none
    show_null_labels: false
  - name: peak_hours
    title: Peak hours
    type: looker_column
    model: zendesk
    explore: tickets
    measures: [tickets.count]
    limit: 500
    column_limit: 50
    stacking: percent
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
    ordering: none
    show_null_labels: false
  - name: peak_days
    title: Peak days
    type: looker_column
    model: zendesk
    explore: tickets
    dimensions: [tickets.time_day_of_week]
    measures: [tickets.count]
    sorts: [tickets.time_day_of_week]
    limit: 500
    column_limit: 50
    stacking: percent
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
    ordering: none
    show_null_labels: false
    



