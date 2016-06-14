- dashboard: ticket_submissions
  title: Ticket Submissions
  layout: tile
  tile_size: 100

#  filters:

  elements:

  - name: add_a_unique_name_1465935898873
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

