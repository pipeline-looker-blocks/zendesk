- dashboard: agent_performance
  title: Agent Performance
  layout: tile
  tile_size: 100

#  filters:

  elements:

  - name: add_a_unique_name_1466097725783
    title: Average business days to resolution
    type: single_value
    model: zendesk
    explore: zendesk_ticket_metrics
    measures: [zendesk_ticket_metrics.avg_first_resolution_time_in_days__business]
    sorts: [zendesk_ticket_metrics.avg_first_resolution_time_in_days__business desc]
    limit: 500
    show_single_value_title: true
    show_comparison: false
