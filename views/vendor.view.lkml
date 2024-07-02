# The name of this view in Looker is "Vendor"
view: vendor {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `traininglookerteam.BetsyBikes.Vendor` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Account Number" in Explore.

  dimension: account_number {
    type: string
    sql: ${TABLE}.AccountNumber ;;
  }

  dimension: active_flag {
    type: number
    sql: ${TABLE}.ActiveFlag ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_active_flag {
    type: sum
    sql: ${active_flag} ;;  }
  measure: average_active_flag {
    type: average
    sql: ${active_flag} ;;  }

  dimension: business_entity_id {
    type: number
    sql: ${TABLE}.BusinessEntityID ;;
  }

  dimension: credit_rating {
    type: number
    sql: ${TABLE}.CreditRating ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.Name ;;
  }

  dimension: preferred_vendor_status {
    type: number
    sql: ${TABLE}.PreferredVendorStatus ;;
  }
  measure: count {
    type: count
    drill_fields: [name]
  }
}
