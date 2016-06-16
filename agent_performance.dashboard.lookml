- dashboard: agent_performance
  title: Agent Performance
  layout: tile
  tile_size: 100

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
  
  
