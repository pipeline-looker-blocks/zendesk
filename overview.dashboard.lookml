- dashboard: overview
  title: Overview
  layout: tile
  tile_size: 100

#  filters:

  elements:

  - name: add_a_unique_name_1465931582322
    type: single_value
    model: zendesk
    explore: tickets
    measures: [tickets.count]
    filters:
      tickets.status: new,open
    sorts: [tickets.count desc]
    limit: 500
    show_single_value_title: true
    single_value_title: New and open tickets
    show_comparison: false
  - name: add_a_unique_name_1465931953284
    title: Untitled Visualization
    type: single_value
    model: zendesk
    explore: tickets
    dimensions: [tickets.status]
    measures: [tickets.count]
    filters:
      tickets.status: pending
    sorts: [tickets.count desc]
    limit: 500
    show_single_value_title: true
    single_value_title: Pending tickets
    show_comparison: false
  - name: add_a_unique_name_1465932070514
    title: Untitled Visualization
    type: single_value
    model: zendesk
    explore: tickets
    measures: [tickets.count]
    filters:
      tickets.status: closed,solved
    sorts: [tickets.count desc]
    limit: 500
    show_single_value_title: true
    single_value_title: Closed and solved tickets
    show_comparison: false
  - name: add_a_unique_name_1465932151682
    title: Untitled Visualization
    type: looker_pie
    model: zendesk
    explore: tickets
    dimensions: [tickets.via__channel]
    measures: [tickets.count]
    sorts: [tickets.count desc]
    limit: 500
    value_labels: legend
    colors: ['#62bad4', '#a9c574', '#929292', '#9fdee0', '#1f3e5a', '#90c8ae', '#92818d',
      '#c5c6a6', '#82c2ca', '#cee0a0', '#928fb4', '#9fc190']
    show_view_names: true



