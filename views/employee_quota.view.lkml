# The name of this view in Looker is "Employee Quota"
view: employee_quota {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `traininglookerteam.BetsyBikes.EmployeeQuota` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Data" in Explore.

  dimension: data {
    type: number
    sql: ${TABLE}.Data ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_data {
    type: sum
    sql: ${data} ;;  }
  measure: average_data {
    type: average
    sql: ${data} ;;  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: quota {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.QuotaDate ;;
  }

  dimension: sales_person_id {
    type: string
    sql: ${TABLE}.`SalesPerson ID` ;;
  }
  measure: count {
    type: count
  }
}
