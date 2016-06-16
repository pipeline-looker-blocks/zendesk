- dashboard: agent_performance
  title: Agent Performance
  layout: grid
  rows:
    - elements: [avg_resolution_time, average_response_time, tickets_solved]
      height: 150
    - elements: [performance_over_time]
      height: 300
    - elements: [performance_by_group]
      height: 300
    - elements: [performance_by_agent]
      height: 300

#  filters:

  elements:

  - name: avg_resolution_time
    title: Average business days to resolution
    type: single_value
    model: zendesk
    explore: zendesk_ticket_metrics
    measures: [zendesk_ticket_metrics.avg_first_resolution_time_in_days__business]
    sorts: [zendesk_ticket_metrics.avg_first_resolution_time_in_days__business desc]
    limit: 500
    show_single_value_title: true
    show_comparison: false
  - name: average_response_time
    title: Average business hours to first response
    type: single_value
    model: zendesk
    explore: zendesk_ticket_metrics
    measures: [zendesk_ticket_metrics.avg_reply_time_in_hours__business]
    sorts: [zendesk_ticket_metrics.avg_reply_time_in_hours__business desc]
    limit: 500
    show_single_value_title: true
    show_comparison: false
  - name: tickets_solved
    title: All time tickets solved
    type: single_value
    model: zendesk
    explore: zendesk_ticket_metrics
    measures: [tickets.count_solved_tickets]
    limit: 500
    show_single_value_title: true
    show_comparison: false
  - name: performance_by_group
    title: Performance by group
    type: looker_column
    model: zendesk
    explore: zendesk_ticket_metrics
    dimensions: [zendesk_ticket_metrics.group_name]
    measures: [zendesk_ticket_metrics.count, zendesk_ticket_metrics.avg_first_resolution_time_in_days__business,
      zendesk_ticket_metrics.avg_reply_time_in_hours__business]
    sorts: [zendesk_ticket_metrics.count desc]
    limit: 500
    column_limit: 50
    stacking: ''
    colors: ['#62bad4', '#a9c574', '#929292', '#9fdee0', '#1f3e5a', '#90c8ae', '#92818d',
      '#c5c6a6', '#82c2ca', '#cee0a0', '#928fb4', '#9fc190']
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
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
  - name: performance_over_time
    title: Performance over time
    type: looker_line
    model: zendesk
    explore: zendesk_ticket_metrics
    dimensions: [zendesk_ticket_metrics.created_week]
    measures: [zendesk_ticket_metrics.count, zendesk_ticket_metrics.avg_reply_time_in_hours__business,
      zendesk_ticket_metrics.avg_first_resolution_time_in_days__business]
    sorts: [zendesk_ticket_metrics.count desc]
    limit: 500
    column_limit: 50
    stacking: ''
    colors: ['#62bad4', '#a9c574', '#929292', '#9fdee0', '#1f3e5a', '#90c8ae', '#92818d',
      '#c5c6a6', '#82c2ca', '#cee0a0', '#928fb4', '#9fc190']
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
  - name: performance_by_agent
    title: Performance by agent
    type: table
    model: zendesk
    explore: zendesk_ticket_metrics
    dimensions: [zendesk_ticket_metrics.assignee_email]
    measures: [tickets.count_solved_tickets, zendesk_ticket_metrics.avg_reply_time_in_hours__business,
      zendesk_ticket_metrics.avg_first_resolution_time_in_days__business]
    sorts: [tickets.count_solved_tickets desc]
    limit: 500
    column_limit: 50
    show_view_names: true
    show_row_numbers: true
    truncate_column_names: false
    table_theme: editable
    limit_displayed_rows: false
