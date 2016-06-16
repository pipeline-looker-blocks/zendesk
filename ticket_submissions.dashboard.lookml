- dashboard: ticket_submissions
  title: Ticket Submissions
  layout: tile
  tile_size: 100

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

