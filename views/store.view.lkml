# The name of this view in Looker is "Store"
view: store {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `traininglookerteam.BetsyBikes.Store` ;;
  drill_fields: [store_id]

  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: store_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.StoreID ;;
  }
    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Sales Person ID" in Explore.

  dimension: sales_person_id {
    type: number
    sql: ${TABLE}.SalesPersonID ;;
  }

  dimension: store_name {
    type: string
    sql: ${TABLE}.StoreName ;;
  }
  measure: count {
    type: count
    drill_fields: [store_id, store_name, customer.count]
  }
}
