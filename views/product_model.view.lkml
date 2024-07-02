# The name of this view in Looker is "Product Model"
view: product_model {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `traininglookerteam.BetsyBikes.ProductModel` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Name" in Explore.

  dimension: name {
    type: string
    sql: ${TABLE}.Name ;;
  }

  dimension: product_model_id {
    type: number
    sql: ${TABLE}.ProductModelID ;;
  }
  measure: count {
    type: count
    drill_fields: [name]
  }
}
