- dashboard: ticket_submissions
  title: Ticket Submissions
  layout: tile
  tile_size: 100

#  filters:

  elements:

  - name: all_tickets
    title: Untitled Visualization
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
    title: Untitled Visualization
    type: single_value
    model: zendesk
    explore: tickets
    measures: [tickets.count_orgs_submitting]
    sorts: [tickets.count_orgs_submitting desc]
    limit: 500
    show_single_value_title: true
    single_value_title: Organizations submitting tickets
    show_comparison: false

