- dashboard: agent_performance
  title: Agent Performance
  layout: grid
  rows:
    - elements: [average_response_time, avg_resolution_time, tickets_solved]
      height: 150
    - elements: [performance_over_time]
      height: 400
    - elements: [performance_by_group]
      height: 400
    - elements: [performance_by_agent]
      height: 400

  filters:

  - name: date
    type: date_filter
  - name: group
    type: string_filter
  - name: agent
    type: string_filter

  elements:

  - name: avg_resolution_time
    title: Average business days to resolution
    type: single_value
    model: zendesk
    explore: ticket_metrics
    measures: [ticket_metrics.avg_first_resolution_time_in_days__business]
    sorts: [ticket_metrics.avg_first_resolution_time_in_days__business desc]
    limit: 500
    show_single_value_title: true
    show_comparison: false
    listen:
      date: ticket_metrics.created_date
      group: ticket_metrics.group_name
      agent: ticket_metrics.assignee_email

  - name: average_response_time
    title: Average business hours to first response
    type: single_value
    model: zendesk
    explore: ticket_metrics
    measures: [ticket_metrics.avg_reply_time_in_hours__business]
    sorts: [ticket_metrics.avg_reply_time_in_hours__business desc]
    limit: 500
    show_single_value_title: true
    show_comparison: false
    listen:
      date: ticket_metrics.created_date
      group: ticket_metrics.group_name
      agent: ticket_metrics.assignee_email

  - name: tickets_solved
    title: All time tickets solved
    type: single_value
    model: zendesk
    explore: ticket_metrics
    measures: [tickets.count_solved_tickets]
    limit: 500
    show_single_value_title: true
    show_comparison: false
    listen:
      date: ticket_metrics.created_date
      group: ticket_metrics.group_name
      agent: ticket_metrics.assignee_email

  - name: performance_by_group
    title: Performance by group
    type: looker_column
    model: zendesk
    explore: ticket_metrics
    dimensions: [ticket_metrics.group_name]
    measures: [ticket_metrics.count, ticket_metrics.avg_first_resolution_time_in_days__business,
      ticket_metrics.avg_reply_time_in_hours__business]
    sorts: [ticket_metrics.count desc]
    limit: 500
    column_limit: 50
    stacking: ''
    colors: ['#FFCC00', '#1E2023', '#3399CC', '#CC3399', '#66CC66', '#999999', '#FF4E00', '#A2ECBA', '#9932CC', '#0000CD']
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
    listen:
      date: ticket_metrics.created_date
      group: ticket_metrics.group_name
      agent: ticket_metrics.assignee_email

  - name: performance_over_time
    title: Performance over time
    type: looker_line
    model: zendesk
    explore: ticket_metrics
    dimensions: [ticket_metrics.created_week]
    measures: [ticket_metrics.count, ticket_metrics.avg_reply_time_in_hours__business,
      ticket_metrics.avg_first_resolution_time_in_days__business]
    sorts: [ticket_metrics.count desc]
    limit: 500
    column_limit: 50
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
    x_axis_scale: auto
    y_axis_scale_mode: linear
    show_null_points: true
    point_style: none
    interpolation: linear
    listen:
      date: ticket_metrics.created_date
      group: ticket_metrics.group_name
      agent: ticket_metrics.assignee_email

  - name: performance_by_agent
    title: Performance by agent
    type: table
    model: zendesk
    explore: ticket_metrics
    dimensions: [ticket_metrics.assignee_email]
    measures: [tickets.count_solved_tickets, ticket_metrics.avg_reply_time_in_hours__business,
      ticket_metrics.avg_first_resolution_time_in_days__business]
    sorts: [tickets.count_solved_tickets desc]
    limit: 500
    column_limit: 50
    show_view_names: true
    show_row_numbers: true
    truncate_column_names: false
    table_theme: editable
    limit_displayed_rows: false
    listen:
      date: ticket_metrics.created_date
      group: ticket_metrics.group_name
      agent: ticket_metrics.assignee_email
