view: ticket_metrics {
  sql_table_name: looker_zendesk.zendesk_ticket_metrics ;;
  #   definition resource: https://developer.zendesk.com/rest_api/docs/core/ticket_metrics

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: agent_wait_time_in_minutes__business {
    type: number
    sql: ${TABLE}.agent_wait_time_in_minutes__business ;;
  }

  dimension: agent_wait_time_in_minutes__calendar {
    type: number
    sql: ${TABLE}.agent_wait_time_in_minutes__calendar ;;
  }

  dimension_group: assigned {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.assigned_at ;;
  }

  dimension: assignee_id {
    type: number
    sql: ${tickets.assignee_id} ;;
  }

  dimension: assignee_email {
    type: string
    sql: ${users.email} ;;
  }

  dimension: group_name {
    type: string
    sql: ${groups.name} ;;
  }

  dimension_group: assignee_updated {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.assignee_updated_at ;;
  }

  dimension_group: created {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.created_at ;;
  }

  dimension: organization_name {
    type: string
    sql: ${tickets.organization_name} ;;
  }

  # MINUTES

  dimension: first_resolution_time_in_minutes__business {
    type: number
    sql: ${TABLE}.first_resolution_time_in_minutes__business ;;
  }

  measure: avg_first_resolution_time_in_minutes__business {
    type: average
    sql: ${first_resolution_time_in_minutes__business} ;;
  }

  #   - dimension: first_resolution_time_in_minutes__calendar
  #     type: number
  #     sql: ${TABLE}.first_resolution_time_in_minutes__calendar
  #
  #   - measure: avg_first_resolution_time_in_minutes__calendar
  #     type: avg
  #     sql: ${first_resolution_time_in_minutes__calendar}

  dimension: full_resolution_time_in_minutes__business {
    type: number
    sql: ${TABLE}.full_resolution_time_in_minutes__business ;;
  }

  measure: avg_full_resolution_time_in_minutes__business {
    type: average
    sql: ${full_resolution_time_in_minutes__business} ;;
  }

  #   - dimension: full_resolution_time_in_minutes__calendar
  #     type: number
  #     sql: ${TABLE}.full_resolution_time_in_minutes__calendar
  #
  #   - measure: avg_full_resolution_time_in_minutes__calendar
  #     type: avg
  #     sql: ${full_resolution_time_in_minutes__calendar}


  # HOURS

  dimension: first_resolution_time_in_hours__business {
    type: number
    sql: (${TABLE}.first_resolution_time_in_minutes__business / 60) ;;
  }

  measure: avg_first_resolution_time_in_hours__business {
    type: average
    sql: ${first_resolution_time_in_hours__business} ;;
  }

  #   - dimension: first_resolution_time_in_hours__calendar
  #     type: number
  #     sql: ${TABLE}.first_resolution_time_in_minutes__calendar / 60
  #
  #   - measure: avg_first_resolution_time_in_hours__calendar
  #     type: avg
  #     sql: ${first_resolution_time_in_hours__calendar}

  dimension: full_resolution_time_in_hours__business {
    type: number
    sql: ${TABLE}.full_resolution_time_in_minutes__business / 60 ;;
  }

  measure: avg_full_resolution_time_in_hours__business {
    type: average
    sql: ${full_resolution_time_in_hours__business} ;;
  }

  #   - dimension: full_resolution_time_in_hours__calendar
  #     type: number
  #     sql: ${TABLE}.full_resolution_time_in_minutes__calendar / 60
  #
  #   - measure: avg_full_resolution_time_in_hours__calendar
  #     type: avg
  #     sql: ${full_resolution_time_in_minutes__calendar}


  # DAYS

  dimension: first_resolution_time_in_days__business {
    type: number
    sql: ${TABLE}.first_resolution_time_in_minutes__business / 480 ;;
  }

  measure: avg_first_resolution_time_in_days__business {
    type: average
    sql: ${first_resolution_time_in_days__business} ;;
  }

  #   - dimension: first_resolution_time_in_days__calendar
  #     type: number
  #     sql: ${TABLE}.first_resolution_time_in_minutes__calendar / 1440
  #
  #   - measure: avg_first_resolution_time_in_days__calendar
  #     type: avg
  #     sql: ${first_resolution_time_in_days__calendar}

  dimension: full_resolution_time_in_days__business {
    type: number
    sql: ${TABLE}.full_resolution_time_in_minutes__business / 480 ;;
  }

  measure: avg_full_resolution_time_in_days__business {
    type: average
    sql: ${full_resolution_time_in_days__business} ;;
  }

  #   - dimension: full_resolution_time_in_days__calendar
  #     type: number
  #     sql: ${TABLE}.full_resolution_time_in_minutes__calendar / 1440
  #
  #   - measure: avg_full_resolution_time_in_days__calendar
  #     type: avg
  #     sql: ${full_resolution_time_in_days__calendar}


  dimension_group: initially_assigned {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.initially_assigned_at ;;
  }

  dimension_group: latest_comment_added {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.latest_comment_added_at ;;
  }

  #   - dimension: on_hold_time_in_minutes__business
  #     type: number
  #     sql: ${TABLE}.on_hold_time_in_minutes__business
  #
  #   - dimension: on_hold_time_in_minutes__calendar
  #     type: number
  #     sql: ${TABLE}.on_hold_time_in_minutes__calendar

  dimension: reopens {
    type: number
    sql: ${TABLE}.reopens ;;
  }

  dimension: replies {
    type: number
    sql: ${TABLE}.replies ;;
  }

  # FIRST REPLY MINUTES

  dimension: reply_time_in_minutes__business {
    type: number
    sql: ${TABLE}.reply_time_in_minutes__business ;;
  }

  measure: avg_reply_time_in_minutes__business {
    type: average
    sql: ${reply_time_in_minutes__business} ;;
  }

  #   - dimension: reply_time_in_minutes__calendar
  #     type: number
  #     sql: ${TABLE}.reply_time_in_minutes__calendar
  #
  #   - measure: avg_reply_time_in_minutes__calendar
  #     type: avg
  #     sql: ${reply_time_in_minutes__calendar}


  # FIRST REPLY HOURS

  dimension: reply_time_in_hours__business {
    type: number
    sql: ${TABLE}.reply_time_in_minutes__business / 60 ;;
  }

  measure: avg_reply_time_in_hours__business {
    type: average
    sql: ${reply_time_in_hours__business} ;;
  }

  #   - dimension: reply_time_in_hours__calendar
  #     type: number
  #     sql: ${TABLE}.reply_time_in_minutes__calendar / 60
  #
  #   - measure: avg_reply_time_in_hours__calendar
  #     type: avg
  #     sql: ${reply_time_in_hours__calendar}

  dimension_group: requester_updated {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.requester_updated_at ;;
  }

  dimension: requester_wait_time_in_minutes__business {
    type: number
    sql: ${TABLE}.requester_wait_time_in_minutes__business ;;
  }

  #   - dimension: requester_wait_time_in_minutes__calendar
  #     type: number
  #     sql: ${TABLE}.requester_wait_time_in_minutes__calendar

  dimension_group: solved {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.solved_at ;;
  }

  dimension_group: status_updated {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.status_updated_at ;;
  }

  dimension: ticket_id {
    type: number
    # hidden: true
    sql: ${TABLE}.ticket_id ;;
  }

  dimension_group: updated {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.updated_at ;;
  }

  measure: count {
    type: count
    drill_fields: [id, tickets.via__source__from__name, tickets.id, tickets.via__source__to__name]
  }
}
