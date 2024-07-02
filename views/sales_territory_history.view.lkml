# The name of this view in Looker is "Sales Territory History"
view: sales_territory_history {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `traininglookerteam.BetsyBikes.SalesTerritoryHistory` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Business Entity ID" in Explore.

  dimension: business_entity_id {
    type: number
    sql: ${TABLE}.BusinessEntityID ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: end {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.EndDate ;;
  }

  dimension_group: start {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.StartDate ;;
  }

  dimension: territory_id {
    type: number
    sql: ${TABLE}.TerritoryID ;;
  }
  measure: count {
    type: count
  }

 # dimension: Sales_territory_id {
  #  type: string
   # sql: if(${sales_order_header.online_order_flag} = -1,'285',cast(${business_entity_id} as STRING)) ;;
  #}

  #dimension: Sales_person_id {
   # type: number
    #sql: ${Sales_territory_id} ;;
  #}
}
