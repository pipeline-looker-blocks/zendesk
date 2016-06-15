
- view: average_tickets_per_org
  derived_table:
    sql: |
      SELECT 
        ("tickets.count" / "organizations.count")::decimal(10,2) avg_tix_per_org
      FROM
        (SELECT 
          COUNT(*) AS "tickets.count",
          COUNT(DISTINCT organizations.id) AS "organizations.count"
        FROM zendesk_pipeline.tickets AS tickets
        LEFT JOIN zendesk_pipeline.organizations AS organizations ON tickets.organization_id = organizations.id
        
        ORDER BY 1 DESC)

  fields:
  - measure: count
    type: count
    drill_fields: detail*

  - dimension: avg_tix_per_org
    type: number
    sql: ${TABLE}.avg_tix_per_org

  sets:
    detail:
      - avg_tix_per_org

