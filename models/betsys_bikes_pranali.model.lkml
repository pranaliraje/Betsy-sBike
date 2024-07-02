# Define the database connection to be used for this model.
connection: "betsybikes"

include: "/views/**/*.view.lkml"

# Datagroups define a caching policy for an Explore. To learn more,
# use the Quick Help panel on the right to see documentation.

datagroup: betsys_bikes_pranali_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: betsys_bikes_pranali_default_datagroup

explore: employee_details {}

explore: sales_order_details {}

explore: sales_territory_history {}


explore: sales_order_header {
  join: sales_territory_history{
    type: left_outer
    sql_on: ${sales_order_header.territory_id} = ${sales_territory_history.territory_id} ;;
    relationship: one_to_many
  }

  join: sales_territory{
    type: left_outer
    sql_on: ${sales_order_header.territory_id} = ${sales_territory.territory_id} ;;
    relationship: one_to_many
  }

  join: customer{
    type: left_outer
    sql_on: ${sales_order_header.customer_id} = ${customer.customer_id} ;;
    relationship: many_to_one
  }

  join: store{
    type: left_outer
    sql_on: ${customer.store_id} = ${store.store_id} ;;
    relationship: many_to_one
  }

  join: person {
    type: left_outer
    sql_on: ${person.business_entity_id} = ${customer.person_id} ;;
    relationship: many_to_one
  }

  join: sales_order_details {
    type: left_outer
    sql_on: ${sales_order_header.sales_order_id} = ${sales_order_details.sales_order_id} ;;
    relationship: one_to_many
  }

  join: product {
    type: left_outer
    sql_on: ${sales_order_details.product_id} = ${product.product_id} ;;
    relationship: many_to_one
  }

  join: peoduct_vendor {
    type: left_outer
    sql_on: ${product.product_id} = ${peoduct_vendor.product_id} ;;
    relationship: many_to_one
  }

  join: vendor {
    type: left_outer
    sql_on: ${peoduct_vendor.business_entity_id} = ${vendor.business_entity_id} ;;
    relationship: many_to_one
  }

  join: product_subcategory {
    type: left_outer
    sql_on: ${product.product_subcategory_id} = ${product_subcategory.product_subcategory_id} ;;
    relationship: many_to_one
  }

  join: product_category {
    type: left_outer
    sql_on: ${product_subcategory.product_category_id} = ${product_category.product_category_id} ;;
    relationship: many_to_one
  }

  join: product_model {
    type: left_outer
    sql_on: ${product.product_model_id} = ${product_model.product_model_id} ;;
    relationship: many_to_one
  }

  join: employee_details {
    type: left_outer
    sql_on: ${sales_territory_history.business_entity_id} = ${employee_details.employee_business_entity_id} ;;
    relationship: one_to_many
  }

  #join: employee_quota {
   # type: left_outer
    #sql_on: ${employee_quota.sales_person_id} =   ;;
  #}

}
