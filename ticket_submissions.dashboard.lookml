- dashboard: ticket_submissions
  title: Ticket Submissions
  layout: tile
#   rows:
#     - elements: [all_tickets, orgs_submitting, avg_tickets_per_org]
#       height: 150
#     - elements: [ticket_stats_by_org]
#       height: 400
#     - elements: [peak_hours, peak_days]
#       height: 400

  filters:

  - name: date
    type: date_filter
  - name: organization
    type: string_filter


  elements:

  - name: all_tickets
    type: single_value
    model: zendesk
    explore: ticket_metrics
    measures: [tickets.count]
    sorts: [tickets.count desc]
    limit: 500
    show_single_value_title: true
    single_value_title: All time tickets submitted
    show_comparison: false
    listen:
      date: tickets.created_at_date
      organization: tickets.organization_name

  - name: orgs_submitting
    type: single_value
    model: zendesk
    explore: ticket_metrics
    measures: [tickets.count_orgs_submitting]
    sorts: [tickets.count_orgs_submitting desc]
    limit: 500
    show_single_value_title: true
    single_value_title: Organizations submitting tickets
    show_comparison: false
    listen:
      date: tickets.created_at_date
      organization: tickets.organization_name

  - name: avg_tickets_per_org
    title: Average tickets per org
    type: single_value
    model: zendesk
    explore: ticket_metrics
    measures: [tickets.count_distinct_organizations, tickets.count]
    dynamic_fields:
    - table_calculation: average_tickets_per_org
      label: Average tickets per org
      expression: round(${tickets.count} / ${tickets.count_distinct_organizations}, 2)
    hidden_fields: [tickets.count_distinct_organizations, tickets.count]
    sorts: [tickets.count_distinct_organizations desc]
    limit: 500
    show_comparison: false
    listen:
      date: tickets.created_at_date
      organization: tickets.organization_name

  - name: ticket_stats_by_org
    title: Ticket stats by organization
    type: table
    model: zendesk
    explore: ticket_metrics
    dimensions: [organizations.name]
    measures: [tickets.count_open_tickets,
      tickets.count_solved_tickets, tickets.count, ticket_metrics.avg_full_resolution_time_in_days__business]
    sorts: [tickets.count_new_tickets desc]
    limit: 500
    listen:
      date: ticket_metrics.created_date
      organization: ticket_metrics.organization_name


  - name: tickets_submitted_by_org
    title: Ticket submitted by organization
    type: looker_line
    model: zendesk
    explore: tickets
    dimensions: [tickets.created_at_month, tickets.organization_name]
    pivots: [tickets.organization_name]
    measures: [tickets.count]
    sorts: [tickets.count desc, tickets.organization_name]
    limit: 1000
    column_limit: 5000
    stacking: ''
    colors: ['#FFCC00', '#1E2023', '#3399CC', '#CC3399', '#66CC66', '#999999', '#FF4E00', '#A2ECBA', '#9932CC', '#0000CD']
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
    y_axis_scale_mode: linear
    show_null_points: true
    point_style: none
    interpolation: linear
    listen:
      date: tickets.created_at_date
      organization: tickets.organization_name


  - name: peak_hours
    title: Peak hours
    type: looker_column
    model: zendesk
    explore: ticket_metrics
    dimensions: [tickets.time_hour_of_day]
    measures: [tickets.count]
    sorts: [tickets.time_hour_of_day]
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
    listen:
      date: tickets.created_at_date
      organization: tickets.organization_name

  - name: peak_days
    title: Peak days
    type: looker_column
    model: zendesk
    explore: ticket_metrics
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
    listen:
      date: tickets.created_at_date
      organization: tickets.organization_name
