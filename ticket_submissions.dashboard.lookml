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
